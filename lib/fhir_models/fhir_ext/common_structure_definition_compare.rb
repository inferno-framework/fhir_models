module FHIR
  # Extend StructureDefinition for profile comparison code
  module CommonStructureDefinitionCompare
    extend FHIR::Deprecate

    # -------------------------------------------------------------------------
    #                            Profile Comparison
    # -------------------------------------------------------------------------

    # Checks whether or not "another_definition" is compatible with this definition.
    # If they have conflicting elements, restrictions, bindings, modifying extensions, etc.
    def compatible?(another_definition)
      @errors = []
      @warnings = []

      @finding = FHIR::StructureDefinitionFinding.new
      @finding.resourceType = snapshot.element[0].path
      @finding.profileIdA = id
      @finding.profileIdB = another_definition.id if another_definition.respond_to?(:id)

      if !(another_definition.is_a? versioned_fhir_module::StructureDefinition)
        @errors << @finding.error('', '', 'Not a StructureDefinition', 'StructureDefinition', another_definition.class.name.to_s)
        return false
      elsif another_definition.snapshot.element[0].path != snapshot.element[0].path
        @errors << @finding.error('', '', 'Incompatible resourceType', @finding.resourceType, another_definition.snapshot.element[0].path.to_s)
        return false
      end

      left_elements = Array.new(snapshot.element)
      right_elements = Array.new(another_definition.snapshot.element)

      left_paths = left_elements.map(&:path)
      right_paths = right_elements.map(&:path)

      # StructureDefinitions don't always include all base attributes (for example, of a ContactPoint)
      # if nothing is modified from the base definition, so we have to add them in if they are missing.
      base_definition = versioned_fhir_module::Definitions.get_resource_definition(snapshot.element[0].path)
      base_elements = base_definition.snapshot.element

      left_missing = right_paths - left_paths
      # left_missing_roots = left_missing.map{|e| e.split('.')[0..-2].join('.') }.uniq
      add_missing_elements(id, left_missing, left_elements, base_elements)

      right_missing = left_paths - right_paths
      # right_missing_roots = right_missing.map{|e| e.split('.')[0..-2].join('.') }.uniq
      add_missing_elements(another_definition.id, right_missing, right_elements, base_elements)

      # update paths
      left_paths = left_elements.map(&:path)
      right_paths = right_elements.map(&:path)

      # recalculate the missing attributes
      left_missing = right_paths - left_paths
      right_missing = left_paths - right_paths

      # generate warnings for missing fields (ignoring extensions)
      left_missing.each do |e|
        next if e.include? 'extension'

        elem = get_element_by_path(e, right_elements)
        if !elem.min.nil? && elem.min.positive?
          @errors << @finding.error(e, 'min', 'Missing REQUIRED element', 'Missing', elem.min.to_s)
        elsif elem.isModifier == true
          @errors << @finding.error(e, 'isModifier', 'Missing MODIFIER element', 'Missing', elem.isModifier.to_s)
        else
          @warnings << @finding.warning(e, '', 'Missing element', 'Missing', 'Defined')
        end
      end
      right_missing.each do |e|
        next if e.include? 'extension'

        elem = get_element_by_path(e, left_elements)
        if !elem.min.nil? && elem.min.positive?
          @errors << @finding.error(e, 'min', 'Missing REQUIRED element', elem.min.to_s, 'Missing')
        elsif elem.isModifier == true
          @errors << @finding.error(e, 'isModifier', 'Missing MODIFIER element', elem.isModifier.to_s, 'Missing')
        else
          @warnings << @finding.warning(e, '', 'Missing element', 'Defined', 'Missing')
        end
      end

      left_extensions = []
      right_extensions = []

      # compare elements, starting with the elements in this definition
      left_elements.each do |x|
        if x.path.include? 'extension'
          # handle extensions separately
          left_extensions << x
        else
          y = get_element_by_path(x.path, right_elements)
          compare_element_definitions(x, y, another_definition)
        end
      end

      # now compare elements defined in the other definition, if we haven't already looked at them
      right_elements.each do |y|
        if y.path.include? 'extension'
          # handle extensions separately
          right_extensions << y
        elsif left_missing.include? y.path
          x = get_element_by_path(y.path, left_elements)
          compare_element_definitions(x, y, another_definition)
        end
      end

      # finally, compare the extensions.
      checked_extensions = []
      left_extensions.each do |x|
        y = get_extension(x.name, right_extensions)
        unless y.nil?
          # both profiles share an extension with the same name
          checked_extensions << x.name
          compare_extension_definition(x, y, another_definition)
        end
        y = get_extension(x.type[0].profile, right_extensions)
        next unless !y.nil? && x.name != y.name

        # both profiles share the same extension definition but with a different name
        checked_extensions << x.name
        checked_extensions << y.name
        compare_element_definitions(x, y, another_definition)
      end
      right_extensions.each do |y|
        next if checked_extensions.include?(y.name)

        x = get_extension(y.name, left_extensions)
        unless x.nil?
          # both profiles share an extension with the same name
          checked_extensions << y.name
          compare_extension_definition(x, y, another_definition)
        end
        x = get_extension(y.type[0].profile, left_extensions)
        next unless !x.nil? && x.name != y.name && !checked_extensions.include?(x.name)

        # both profiles share the same extension definition but with a different name
        checked_extensions << x.name
        checked_extensions << y.name
        compare_element_definitions(x, y, another_definition)
      end
      @errors.flatten!
      @warnings.flatten!
      @errors.empty?
    end
    deprecate :is_compatible?, :compatible?

    def get_element_by_path(path, elements = snapshot.element)
      elements.detect { |element| element.path == path }
    end

    def get_extension(extension, elements = snapshot.element)
      elements.each do |element|
        if element.path.include?('extension') || element.type.map(&:code).include?('Extension')
          return element if element.name == extension || element.type.map(&:profile).include?(extension)
        end
      end
      nil
    end

    # private
    # name -- name of the profile we're fixing
    # missing_paths -- list of paths that we're adding
    # elements -- list of elements currently defined in the profile
    # base_elements -- list of elements defined in the base resource the profile extends
    def add_missing_elements(_name, missing_paths, elements, base_elements)
      variable_paths = elements.map(&:path).grep(/\[x\]/).map { |e| e[0..-4] }
      variable_paths << base_elements.map(&:path).grep(/\[x\]/).map { |e| e[0..-4] }
      variable_paths.flatten!.uniq!

      missing_paths.each do |path|
        # Skip extensions
        next if path.include? 'extension'

        # Skip the variable paths that end with "[x]"
        next if variable_paths.any? { |variable| path.starts_with?(variable) }

        elem = get_element_by_path(path, base_elements)
        unless elem.nil?
          # _DEEP_ copy
          elements << versioned_fhir_module::ElementDefinition.from_fhir_json(elem.to_fhir_json)
          next
        end

        x = path.split('.')
        root = x.first(x.size - 1).join('.')
        next unless root.include? '.'

        # get the root element to fill in the details
        elem = get_element_by_path(root, elements)
        # get the data type definition to fill in the details
        # assume missing elements are from first data type (gross)
        next if elem.type.nil? || elem.type.empty?

        type_def = versioned_fhir_module::Definitions.type_definition(elem.type[0].code)
        next if type_def.nil?

        type_elements = Array.new(type_def.snapshot.element)
        # _DEEP_ copy
        type_elements.map! do |e| # {|e| FHIR::ElementDefinition.from_fhir_json(e.to_fhir_json) }
          versioned_fhir_module::ElementDefinition.from_fhir_json(e.to_fhir_json)
        end
        # Fix path names
        type_root = String.new(type_elements[0].path)
        type_elements.each { |e| e.path.gsub!(type_root, root) }
        # finally, add the missing element definitions
        # one by one -- only if they are not already present (i.e. do not override)
        type_elements.each do |z|
          y = get_element_by_path(z.path, elements)
          next unless y.nil?

          elements << z
          # else
          #   @warnings << "StructureDefinition #{name} already contains #{z.path}"
        end
        elements.uniq!
        # else
        #   @warnings << "StructureDefinition #{name} missing -- #{path}"
      end
    end

    # private
    def compare_extension_definition(x, y, another_definition)
      x_profiles = x.type.map(&:profile)
      y_profiles = y.type.map(&:profile)
      x_only = x_profiles - y_profiles
      shared = x_profiles - x_only

      if !shared.nil? && shared.empty?
        # same name, but different profiles
        # maybe the profiles are the same, just with different URLs...
        # ... so we have to compare them, if we can.
        @warnings << @finding.warning("#{x.path} (#{x.name})", 'type.profile', 'Different Profiles', x_profiles.to_s, y_profiles.to_s)
        x_extension = versioned_fhir_module::Definitions.get_extension_definition(x.type[0].profile)
        y_extension = versioned_fhir_module::Definitions.get_extension_definition(y.type[0].profile)
        if !x_extension.nil? && !y_extension.nil?
          x_extension.compatible?(y_extension)
          @errors << x_extension.errors
          @warnings << x_extension.warnings
        else
          @warnings << @finding.warning("#{x.path} (#{x.name})", '', 'Could not find extension definitions to compare.', '', '')
        end
      else
        compare_element_definitions(x, y, another_definition)
      end
    end

    # private
    def compare_element_definitions(x, y, another_definition)
      return if x.nil? || y.nil? || another_definition.nil?

      # check cardinality
      x_min = x.min || 0
      x_max = x.max == '*' ? Float::INFINITY : x.max.to_i
      y_min = y.min || 0
      y_max = y.max == '*' ? Float::INFINITY : y.max.to_i

      if x_min.nil? || x.max.nil? || y_min.nil? || y.max.nil?
        @errors << @finding.error(x.path.to_s, 'min/max', 'Unknown cardinality', "#{x_min}..#{x.max}", "#{y_min}..#{y.max}")
      elsif (x_min > y_max) || (x_max < y_min)
        @errors << @finding.error(x.path.to_s, 'min/max', 'Incompatible cardinality', "#{x_min}..#{x.max}", "#{y_min}..#{y.max}")
      elsif (x_min != y_min) || (x_max != y_max)
        @warnings << @finding.warning(x.path.to_s, 'min/max', 'Inconsistent cardinality', "#{x_min}..#{x.max}", "#{y_min}..#{y.max}")
      end

      # check data types
      x_types = x.type.map(&:code)
      y_types = y.type.map(&:code)
      x_only = x_types - y_types
      y_only = y_types - x_types
      shared = x_types - x_only

      if !shared.nil? && shared.empty? && !x_types.empty? && !y_types.empty? && !x.constraint.empty? && !y.constraint.empty?
        @errors << @finding.error(x.path.to_s, 'type.code', 'Incompatible data types', x_types.to_s, y_types.to_s)
      end
      if !x_only.nil? && !x_only.empty?
        @warnings << @finding.warning(x.path.to_s, 'type.code', 'Allows additional data types', x_only.to_s, 'not allowed')
      end
      if !y_only.nil? && !y_only.empty?
        @warnings << @finding.warning(x.path.to_s, 'type.code', 'Allows additional data types', 'not allowed', y_only.to_s)
      end

      # check bindings
      if x.binding.nil? && !y.binding.nil?
        val = y.binding.valueSet || y.binding.description
        @warnings << @finding.warning(x.path.to_s, 'binding', 'Inconsistent binding', '', val)
      elsif !x.binding.nil? && y.binding.nil?
        val = x.binding.valueSet || x.binding.description
        @warnings << @finding.warning(x.path.to_s, 'binding', 'Inconsistent binding', val, '')
      elsif !x.binding.nil? && !y.binding.nil?
        x_vs = x.binding.valueSet
        y_vs = y.binding.valueSet
        if x_vs != y_vs
          if x.binding.strength == 'required' || y.binding.strength == 'required'
            @errors << @finding.error(x.path.to_s, 'binding.strength', 'Incompatible bindings', "#{x.binding.strength} #{x_vs}", "#{y.binding.strength} #{y_vs}")
          else
            @warnings << @finding.warning(x.path.to_s, 'binding.strength', 'Inconsistent bindings', "#{x.binding.strength} #{x_vs}", "#{y.binding.strength} #{y_vs}")
          end
        end
      end

      # check default values
      if x.defaultValue.try(:type) != y.defaultValue.try(:type)
        @errors << @finding.error(x.path.to_s, 'defaultValue', 'Incompatible default type', x.defaultValue.try(:type).to_s, y.defaultValue.try(:type).to_s)
      end
      if x.defaultValue.try(:value) != y.defaultValue.try(:value)
        @errors << @finding.error(x.path.to_s, 'defaultValue', 'Incompatible default value', x.defaultValue.try(:value).to_s, y.defaultValue.try(:value).to_s)
      end

      # check meaning when missing
      if x.meaningWhenMissing != y.meaningWhenMissing
        @errors << @finding.error(x.path.to_s, 'meaningWhenMissing', 'Inconsistent missing meaning', x.meaningWhenMissing.tr(',', ';').to_s, y.meaningWhenMissing.tr(',', ';').to_s)
      end

      # check fixed values
      if x.fixed.try(:type) != y.fixed.try(:type)
        @errors << @finding.error(x.path.to_s, 'fixed', 'Incompatible fixed type', x.fixed.try(:type).to_s, y.fixed.try(:type).to_s)
      end
      if x.fixed != y.fixed
        xfv = x.fixed.try(:value)
        xfv = xfv.to_xml.delete(/\n/) if x.fixed.try(:value).methods.include?(:to_xml)
        yfv = y.fixed.try(:value)
        yfv = yfv.to_xml.delete(/\n/) if y.fixed.try(:value).methods.include?(:to_xml)
        @errors << @finding.error(x.path.to_s, 'fixed', 'Incompatible fixed value', xfv.to_s, yfv.to_s)
      end

      # check min values
      if x.min.try(:type) != y.min.try(:type)
        @errors << @finding.error(x.path.to_s, 'min', 'Incompatible min type', x.min.try(:type).to_s, y.min.try(:type).to_s)
      end
      if x.min.try(:value) != y.min.try(:value)
        @errors << @finding.error(x.path.to_s, 'min', 'Incompatible min value', x.min.try(:value).to_s, y.min.try(:value).to_s)
      end

      # check max values
      if x.max.try(:type) != y.max.try(:type)
        @errors << @finding.error(x.path.to_s, 'max', 'Incompatible max type', x.max.try(:type).to_s, y.max.try(:type).to_s)
      end
      if x.max.try(:value) != y.max.try(:value)
        @errors << @finding.error(x.path.to_s, 'max', 'Incompatible max value', x.max.try(:value).to_s, y.max.try(:value).to_s)
      end

      # check pattern values
      if x.pattern.try(:type) != y.pattern.try(:type)
        @errors << @finding.error(x.path.to_s, 'pattern', 'Incompatible pattern type', x.pattern.try(:type).to_s, y.pattern.try(:type).to_s)
      end
      if x.pattern.try(:value) != y.pattern.try(:value)
        @errors << @finding.error(x.path.to_s, 'pattern', 'Incompatible pattern value', x.pattern.try(:value).to_s, y.pattern.try(:value).to_s)
      end

      # maxLength (for Strings)
      if x.maxLength != y.maxLength
        @warnings << @finding.warning(x.path.to_s, 'maxLength', 'Inconsistent maximum length', x.maxLength.to_s, y.maxLength.to_s)
      end

      # constraints
      x_constraints = x.constraint.map(&:xpath)
      y_constraints = y.constraint.map(&:xpath)
      x_only = x_constraints - y_constraints
      y_only = y_constraints - x_constraints
      shared = x_constraints - x_only

      if !shared.nil? && shared.empty? && !x.constraint.empty? && !y.constraint.empty?
        @errors << @finding.error(x.path.to_s, 'constraint.xpath', 'Incompatible constraints', x_constraints.map { |z| z.tr(',', ';') }.join(' && ').to_s, y_constraints.map { |z| z.tr(',', ';') }.join(' && ').to_s)
      end
      if !x_only.nil? && !x_only.empty?
        @errors << @finding.error(x.path.to_s, 'constraint.xpath', 'Additional constraints', x_constraints.map { |z| z.tr(',', ';') }.join(' && ').to_s, '')
      end
      if !y_only.nil? && !y_only.empty?
        @errors << @finding.error(x.path.to_s, 'constraint.xpath', 'Additional constraints', '', y_constraints.map { |z| z.tr(',', ';') }.join(' && ').to_s)
      end

      # mustSupports
      if x.mustSupport != y.mustSupport
        @warnings << @finding.warning(x.path.to_s, 'mustSupport', 'Inconsistent mustSupport', (x.mustSupport || false).to_s, (y.mustSupport || false).to_s)
      end

      # isModifier
      return unless x.isModifier != y.isModifier

      @errors << @finding.error(x.path.to_s, 'isModifier', 'Incompatible isModifier', (x.isModifier || false).to_s, (y.isModifier || false).to_s)
    end

    private :add_missing_elements, :compare_extension_definition, :compare_element_definitions
  end
end
