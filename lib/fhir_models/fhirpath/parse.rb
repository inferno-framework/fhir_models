module FHIRPath
  @@reserved = ['all', 'not', 'empty', 'exists', 'where', 'select', 'extension', 'startsWith', 'contains', 'in', 'distinct', '=', '!=', '<=', '>=', '<', '>', 'and', 'or', 'xor', '+', '-', '/', '*', 'toInteger', 'implies', 'children', 'first', 'last', 'tail', 'count', 'length', 'substring']

  def self.parse(expression)
    build_tree(tokenize(expression))
  end

  # This method tokenizes the expression into a flat array of tokens
  def self.tokenize(expression)
    raw_tokens = expression.gsub('()', '').split(%r{(\(|\)|\s|>=|<=|>|<|=|!=|\+|-|/|\*)})
    # recreate strings if they were split
    size = nil
    while raw_tokens.include?("'") && size != raw_tokens.length
      index = raw_tokens.index("'")
      e_index = raw_tokens[(index + 1)..raw_tokens.length].index("'")
      raw_tokens[index] = raw_tokens[index..(index + e_index + 1)].join
      ((index + 1)..(index + e_index + 1)).each { |i| raw_tokens[i] = nil }
      raw_tokens.compact!
      size = raw_tokens.length
    end
    # reassemble strings that might have been inadvertently split that start and end with double-quotes
    reassemble_strings(raw_tokens)
    tokens = []
    raw_tokens.each do |token|
      # split a path unless it is quoted
      if token.include?('.') && !(token.start_with?("'") && token.end_with?("'"))
        token.split('.').each { |t| tokens << t }
      # split arrays and replace with array
      elsif token.include?('|')
        array = []
        token.split('|').each { |t| array << t.delete('\'') }
        tokens << array
      else
        tokens << token
      end
    end
    # we may need to reassemble quoted strings again
    reassemble_strings(tokens)
    tokens.delete_if { |token| token.empty? || (token.is_a?(String) && token.match(/\S/).nil?) }
    FHIR.logger.debug "TOKENS: #{tokens}"
    tokens
  end

  def self.reassemble_strings(tokens)
    tokens.each_with_index do |token, index|
      next unless token.is_a?(String)

      e_index = nil
      if token.start_with?('"') && !token.end_with?('"')
        e_index = tokens[index..].index { |t| t.end_with?('"') }
      elsif token.start_with?("'") && !token.end_with?("'")
        e_index = tokens[index..].index { |t| t.end_with?("'") }
      end
      next unless e_index

      i = index + 1
      while i <= index + e_index
        tokens[index] += tokens[i]
        tokens[i] = ''
        i += 1
      end
    end
  end

  # This method builds an Abstract Syntax Tree (AST) from a flat list of tokens
  def self.build_tree(tokens)
    return if tokens.empty?

    tree = []
    until tokens.empty?
      token = tokens.delete_at(0)
      if token == '(' # sub expression
        tree << FHIRPath::Expression.new(build_tree(tokens))
      elsif token == ')'
        return tree
      elsif token != '.'
        tree << atom(token)
      end
    end
    # post-processing
    tree.each_with_index do |t, index|
      if t == :extension # 'extension' can be a path or a function call (if followed by a block)
        next_token = tree[index + 1]
        tree[index] = 'extension' if next_token.nil? || !next_token.is_a?(FHIRPath::Expression)
      end
    end
    tree
  end

  # This method converts a token within an expression to a native number (if applicable)
  # otherwise it considers it to be a symbol.
  def self.atom(token)
    # check if it is a number
    value = token
    begin
      value = Float(token)
    rescue StandardError
      value = token
      value = token.to_sym if @@reserved.include?(token)
      value = true if token == 'true'
      value = false if token == 'false'
    end
    value
  end
end
