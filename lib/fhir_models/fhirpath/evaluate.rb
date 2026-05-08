module FHIRPath
  @@context = {}
  @@parent = nil

  # This is the entry point to using the FHIRPath class
  def self.evaluate(expression, hash, parent = nil)
    @@context = hash
    @@parent = parent
    tree = FHIRPath.parse(expression)
    FHIR.logger.debug "TREE: #{tree}"
    compute(tree, hash)
  end

  # Get a value from a hash, with some special handling of
  # self references
  def self.get(raw_key, hash)
    return @@context if ['$context', '$resource'].include?(raw_key)
    return @@parent if raw_key == '$parent'
    return 'http://unitsofmeasure.org' if raw_key == '%ucum'
    return 'http://snomed.info/sct' if raw_key == '%sct'
    return 'http://loinc.org' if raw_key == '%loinc'
    return raw_key.gsub(/\A\'|\'\Z/, '') if raw_key.start_with?("'") && raw_key.end_with?("'")
    key = raw_key.gsub(/\A"|"\Z/, '') # remove quotes around path if they exist
    if hash.is_a?(Array)
      response = []
      hash.each do |e|
        next unless e.is_a?(Hash)
        item = e[key]
        if item.is_a?(Array)
          item.each { |i| response << i }
        else
          response << item
        end
      end
      return response
    end
    return :null unless hash.is_a?(Hash)
    return hash if hash['resourceType'] == key
    val = hash[key]
    if val.nil?
      # this block is a dangerous hack to get fields of multiple data types
      # e.g. 'value' instead of 'valueQuantity', or 'onset' instead of 'onsetDateTime' or 'onsetPeriod'
      nkey = hash.keys.select { |x| x.start_with?(key) }.first
      unless nkey.nil?
        tail = nkey.gsub(key, '')
        val = hash[nkey] if tail[0] == tail[0].capitalize
      end
    end
    val = :null if val.nil?
    val = "'#{val}'" if val.is_a?(String) && !(val.start_with?("'") && val.end_with?("'"))
    val
  end

  # Convert nils and empty Arrays to false
  # Everything else is true.
  def self.convert_to_boolean(value)
    return false if value.nil?
    return false if value.is_a?(Array) && value.empty?
    return false if value.is_a?(Hash) && value.empty?
    return false if value == :null
    return false if value == false
    true
  end

  def self.clean_index(tree, index)
    tree[index] = nil unless index.nil?
  end

  # evaluate a parsed expression given some context data
  def self.compute(tree, data)
    tree = tree.tree if tree.is_a?(FHIRPath::Expression)
    # --------------- OPERATOR PRECEDENCE ------------------
    # 01 . (path/function invocation)
    # 02 [] (indexer)
    # 03 unary + and -
    # 04: *, /, div, mod
    # 05: +, -,
    # 06: |
    # 07: >, <, >=, <=
    # 08: is, as
    # 09: =, ~, !=, !~
    # 10: in, contains
    # 11: and
    # 12: xor, or
    # 13: implies

    # evaluate all the data at this level
    functions = [:where, :select, :extension, :children, :first, :last, :tail]
    size = -1
    substitutions = 1
    while tree.length != size || substitutions > 0
      substitutions = 0
      FHIR.logger.debug "DATA: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node, index|
        if node.is_a?(String) && !(node.start_with?("'") && node.end_with?("'"))
          array_index = nil
          if node.include?('[') && node.end_with?(']')
            array_index = node[node.index('[')..-1].gsub(/\[|\]/, '')
            t = get(array_index, data)
            t = array_index.to_i if t.nil? || t == :null
            array_index = t
            node = node[0..node.index('[') - 1]
          end
          if previous_node.is_a?(Hash) || previous_node.is_a?(Array)
            tree[index] = get(node, previous_node)
            clean_index(tree, previous_index)
          elsif !previous_node.is_a?(FHIRPath::Expression)
            tree[index] = get(node, data)
          end
          if array_index && tree[index].is_a?(Array)
            tree[index] = tree[index][array_index]
          end
          FHIR.logger.debug "V===> #{tree}"
        elsif node.is_a?(Symbol) && functions.include?(node)
          previous_node = compute(previous_node, data) if previous_node.is_a?(FHIRPath::Expression)
          case node
          when :where
            # the previous node should be data (as Array or Hash)
            # the next node should be a block or subexpression (as FHIRPath::Expression)
            block = tree[index + 1]
            if block.is_a?(FHIRPath::Expression)
              tree[index + 1] = nil
            else
              raise 'Where function requires a block.'
            end
            previous_node = [] if previous_node == :null
            if previous_node.is_a?(Array)
              previous_node.keep_if do |item|
                sub = compute(block.clone, item)
                convert_to_boolean(sub)
              end
              tree[index] = previous_node
              clean_index(tree, previous_index)
            elsif previous_node.is_a?(Hash)
              sub = compute(block, previous_node)
              tree[index] = convert_to_boolean(sub) ? previous_node : {}
              clean_index(tree, previous_index)
            else
              raise "Where function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :select
            # select is equivalent to ruby Array.map!
            # the previous node should be data (as Array or Hash)
            # the next node should be a block or subexpression (as FHIRPath::Expression)
            block = tree[index + 1]
            if block.is_a?(FHIRPath::Expression)
              tree[index + 1] = nil
            else
              raise 'Select function requires a block.'
            end
            previous_node = [] if previous_node == :null
            if previous_node.is_a?(Array)
              previous_node.map! do |item|
                compute(block.clone, item)
              end
              tree[index] = previous_node
              clean_index(tree, previous_index)
            elsif previous_node.is_a?(Hash)
              tree[index] = compute(block, previous_node)
              clean_index(tree, previous_index)
            else
              raise "Select function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :extension
            # the previous node should be a data (as Hash)
            # the next node optionally is a block or subexpression (as FHIRPath::Expression)
            block = tree[index + 1]
            if block.is_a?(FHIRPath::Expression)
              tree[index + 1] = nil
            else
              raise 'Extension function requires a block.'
            end
            if previous_node.is_a?(Hash)
              FHIR.logger.debug 'Evaling Extension Block....'
              exts = data['extension']
              if exts.is_a?(Array)
                url = nil
                begin
                  url = block.tree.first.gsub(/\'|\"/, '')
                rescue
                  raise 'Extension function requires a single URL as String.'
                end
                ext = exts.select { |x| x['url'] == url }.first
                tree[index] = ext
                clean_index(tree, previous_index)
              else
                raise "Extension function not applicable to #{exts.class}: #{exts}"
              end
            else
              raise "Extension not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :children
            # if there is a previous node, it should be data (as Hash)
            # otherwise, use the context as data
            if previous_node.is_a?(Hash)
              tree[index] = previous_node.values
              clean_index(tree, previous_index)
              substitutions += 1
            elsif data.is_a?(Hash)
              tree[index] = data.values
              substitutions += 1
            else
              raise "Children not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :first
            # the previous node should be an Array of length > 1
            if previous_node.is_a?(Array)
              tree[index] = previous_node.first
              clean_index(tree, previous_index)
            else
              raise "First function is not applicable to #{previous_node.class}: #{previous_node}"
            end
          when :last
            # the previous node should be an Array of length > 1
            if previous_node.is_a?(Array)
              tree[index] = previous_node.last
              clean_index(tree, previous_index)
            else
              raise "Last function is not applicable to #{previous_node.class}: #{previous_node}"
            end
          when :tail
            # the previous node should be an Array of length > 1
            if previous_node.is_a?(Array)
              tree[index] = previous_node.last(previous_node.length - 1)
              clean_index(tree, previous_index)
            else
              raise "Tail function is not applicable to #{previous_node.class}: #{previous_node}"
            end
          end
          FHIR.logger.debug "F===> #{tree}"
        end
        previous_index = index
        previous_node = tree[index]
      end
      FHIR.logger.debug '---------------------------------------------------'
      tree.compact!
    end
    tree.each_with_index do |node, index|
      tree[index] = node[1..-2] if node.is_a?(String) && node.start_with?("'") && node.end_with?("'")
    end
    FHIR.logger.debug "DATA: #{tree}"

    # evaluate all the functions at this level
    functions = [:all, :not, :empty, :exists, :startsWith, :substring, :contains, :in, :distinct, :toInteger, :count, :length]
    size = -1
    while tree.length != size
      FHIR.logger.debug "FUNC: #{tree}"
      previous_node = data
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node, index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = compute(previous_node, data) if previous_node.is_a?(FHIRPath::Expression)
          case node
          when :all
            if previous_node.is_a?(Array)
              result = true
              previous_node.each { |item| result = (result && convert_to_boolean(item)) }
              tree[index] = result
            else
              tree[index] = convert_to_boolean(previous_node)
            end
            clean_index(tree, previous_index)
          when :not
            tree[index] = !convert_to_boolean(previous_node)
            clean_index(tree, previous_index)
          when :count
            tree[index] = 0
            tree[index] = 1 unless previous_node == :null || previous_node.nil?
            tree[index] = previous_node.length if previous_node.is_a?(Array)
            clean_index(tree, previous_index)
          when :length
            if previous_node == :null || previous_node.nil?
              tree[index] = 0
            else
              tree[index] = previous_node.to_s.length
            end
            clean_index(tree, previous_index)
          when :empty
            tree[index] = (previous_node == :null || previous_node.empty? rescue previous_node.nil?)
            clean_index(tree, previous_index)
          when :exists
            tree[index] = !previous_node.nil? && previous_node != :null && previous_node != []
            clean_index(tree, previous_index)
          when :distinct
            tree[index] = (previous_node.uniq rescue previous_node)
            clean_index(tree, previous_index)
          when :startsWith
            # the previous node should be a data (as String)
            # the next node should be a block or subexpression (as FHIRPath::Expression)
            block = tree[index + 1]
            if block.is_a?(FHIRPath::Expression)
              tree[index + 1] = nil
            else
              raise 'StartsWith function requires a block.'
            end
            if previous_node.is_a?(String)
              FHIR.logger.debug 'Evaling StartsWith Block....'
              prefix = compute(block, data)
              tree[index] = previous_node.start_with?(prefix) rescue false
              clean_index(tree, previous_index)
            else
              raise "StartsWith function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :substring
            # the previous node should be a data (as String)
            # the next node should be a block or subexpression (as FHIRPath::Expression)
            block = tree[index + 1]
            if block.is_a?(FHIRPath::Expression)
              tree[index + 1] = nil
            else
              raise 'Substring function requires a block.'
            end
            if previous_node.is_a?(String)
              args = block.tree.first
              start = 0
              length = previous_node.length
              if args.is_a?(String) && args.include?(',')
                args = args.split(',')
                start = args.first.to_i
                length = args.last.to_i - 1
              else
                FHIR.logger.debug 'Evaling Substring Block....'
                start = compute(block, data)
                length = previous_node.length - start
              end
              tree[index] = previous_node[start..(start + length)]
              clean_index(tree, previous_index)
            else
              raise "Substring function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :contains
            # the previous node should be a data (as String)
            # the next node should be a block or subexpression (as FHIRPath::Expression)
            block = tree[index + 1]
            if block.is_a?(FHIRPath::Expression)
              tree[index + 1] = nil
            else
              raise 'Contains function requires a block.'
            end
            if previous_node.is_a?(String)
              FHIR.logger.debug 'Evaling Contains Block....'
              substring = compute(block, data)
              tree[index] = previous_node.include?(substring) rescue false
              clean_index(tree, previous_index)
            else
              raise "Contains function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :in
            # the previous node should be a data (as String, Number, or Boolean)
            # the next node should an Array (possibly as a block or subexpression/FHIRPath::Expression)
            block = tree[index + 1]
            if block.is_a?(FHIRPath::Expression)
              FHIR.logger.debug 'Evaling In Block....'
              tree[index + 1] = compute(block, data)
            end
            array = tree[index + 1]
            if array.is_a?(Array)
              tree[index + 1] = nil
            else
              raise 'In function requires an array.'
            end
            if previous_node.is_a?(String) || previous_node == true || previous_node == false || previous_node.is_a?(Numeric)
              tree[index] = array.include?(previous_node) rescue false
              clean_index(tree, previous_index)
            else
              raise "In function not applicable to #{previous_node.class}: #{previous_node}"
            end
            break
          when :toInteger
            # the previous node should be a data (as String, Integer, Boolean)
            if previous_node.is_a?(String)
              tree[index] = previous_node.to_i rescue 0
            elsif previous_node.is_a?(Numeric)
              tree[index] = previous_node.to_i
            else
              tree[index] = 0
              tree[index] = 1 if convert_to_boolean(previous_node)
            end
            clean_index(tree, previous_index)
            break
          else
            raise "Function not implemented: #{node}"
          end
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end

    # evaluate all mult/div
    functions = [:"/", :"*"]
    size = -1
    while tree.length != size
      FHIR.logger.debug "MATH: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node, index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = compute(previous_node, data) if previous_node.is_a?(FHIRPath::Expression)
          tree[index + 1] = compute(tree[index + 1], data) if tree[index + 1].is_a?(FHIRPath::Expression)
          left = previous_node
          right = tree[index + 1]
          case node
          when :"/"
            tree[index] = (left / right)
          when :"*"
            tree[index] = (left * right)
          end
          tree[previous_index] = nil
          tree[index + 1] = nil
          break
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end
    FHIR.logger.debug "MATH: #{tree}"

    # evaluate all add/sub
    functions = [:"+", :"-"]
    size = -1
    while tree.length != size
      FHIR.logger.debug "MATH: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node, index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = compute(previous_node, data) if previous_node.is_a?(FHIRPath::Expression)
          tree[index + 1] = compute(tree[index + 1], data) if tree[index + 1].is_a?(FHIRPath::Expression)
          left = previous_node
          right = tree[index + 1]
          case node
          when :"+"
            tree[index] = (left + right)
          when :"-"
            tree[index] = (left - right)
          end
          tree[previous_index] = nil
          tree[index + 1] = nil
          break
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end
    FHIR.logger.debug "MATH: #{tree}"

    # evaluate all equality tests
    functions = [:"=", :"!=", :"<=", :">=", :"<", :">"]
    size = -1
    while tree.length != size
      FHIR.logger.debug "EQ: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node, index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = compute(previous_node, data) if previous_node.is_a?(FHIRPath::Expression)
          tree[index + 1] = compute(tree[index + 1], data) if tree[index + 1].is_a?(FHIRPath::Expression)
          left = previous_node
          right = tree[index + 1]
          case node
          when :"="
            tree[index] = (left == right)
          when :"!="
            tree[index] = (left != right)
          when :"<="
            tree[index] = (left <= right)
          when :">="
            tree[index] = (left >= right)
          when :"<"
            tree[index] = (left < right)
          when :">"
            tree[index] = (left > right)
          else
            raise "Equality operator not implemented: #{node}"
          end
          tree[previous_index] = nil
          tree[index + 1] = nil
          break
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end
    FHIR.logger.debug "EQ: #{tree}"

    # evaluate all logical tests
    functions = [:and, :or, :xor]
    size = -1
    while tree.length != size
      FHIR.logger.debug "LOGIC: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node, index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = compute(previous_node, data) if previous_node.is_a?(FHIRPath::Expression)
          tree[index + 1] = compute(tree[index + 1], data) if tree[index + 1].is_a?(FHIRPath::Expression)
          left = convert_to_boolean(previous_node)
          right = convert_to_boolean(tree[index + 1])
          case node
          when :and
            tree[index] = (left && right)
          when :or
            tree[index] = (left || right)
          when :xor
            tree[index] = (left ^ right)
          else
            raise "Logical operator not implemented: #{node}"
          end
          tree[previous_index] = nil
          tree[index + 1] = nil
          break
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end
    FHIR.logger.debug "LOGIC: #{tree}"

    functions = [:implies]
    size = -1
    while tree.length != size
      FHIR.logger.debug "IMPLIES: #{tree}"
      previous_node = nil
      previous_index = nil
      size = tree.length
      tree.each_with_index do |node, index|
        if node.is_a?(Symbol) && functions.include?(node)
          previous_node = compute(previous_node, data) if previous_node.is_a?(FHIRPath::Expression)
          tree[index + 1] = compute(tree[index + 1], data) if tree[index + 1].is_a?(FHIRPath::Expression)
          case node
          when :implies
            tree[index] = false
            exists = !previous_node.nil? && previous_node != :null
            implication = convert_to_boolean(tree[index + 1])
            tree[index] = true if exists && (implication || tree[index + 1] == false)
          else
            raise "Logical operator not implemented: #{node}"
          end
          tree[previous_index] = nil
          tree[index + 1] = nil
          break
        end
        previous_index = index
        previous_node = node
      end
      tree.compact!
    end
    FHIR.logger.debug "IMPLIES: #{tree}"

    # check for symbols
    tree.each do |node|
      raise "Unhandled reserved symbol: #{node}" if node.is_a?(Symbol)
    end

    FHIR.logger.debug "OUT: #{tree}"

    tree.map! do |out|
      while out.is_a?(FHIRPath::Expression)
        out = compute(out, data)
      end
      out
    end

    FHIR.logger.debug "RETURN: #{tree.first}"
    tree.first
  end
end
