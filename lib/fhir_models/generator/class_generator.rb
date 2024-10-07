require_relative 'template'

module FHIR
  class Generator
    class ClassGenerator
      KNOWN_MISSING_EXPANSIONS = ['bcp47', 'bcp13.txt', 'mimetypes', 'LL379-9'].freeze
      attr_accessor :structure_defs, :ig_resources, :output_folder

      def initialize(structure_defs, ig_resources, output_folder)
        self.structure_defs = structure_defs
        self.ig_resources = ig_resources
        self.output_folder = output_folder
        @templates = []
      end

      def generate
        structure_defs.each do |structure_def|
          @templates.clear
          type_name = structure_def['id']
          template = generate_class([type_name], structure_def, top_level: true)
          params = ig_resources.get_search_parameters(type_name).map { |p| p['code'] }
          template.constants['SEARCH_PARAMS'] = params.sort unless params.nil?
          filename = File.join(output_folder, "#{type_name}.rb")
          file = File.open(filename, 'w:UTF-8')
          file.write(template.to_s)
          file.close
        end
      end

      # This method is necessary for fields such as `codeFilter`.  "codeFilter".capitalize -> "Codefilter", but "CodeFilter" is desired output.
      def cap_first(string)
        t = String.new(string)
        t[0] = t[0].upcase
        t
      end

      def generate_class(hierarchy, structure_def, top_level: false)
        type_name = structure_def['id']
        path_type = structure_def['type'] || type_name

        template = Template.new([type_name], top_level)
        template.hierarchy = hierarchy
        template.kind = structure_def['kind']
        template.fhir_version = ig_resources.ig_metadata.shortName
        template.fhir_version = 'R6' if ig_resources.ig_metadata.fhirVersions.include?("6.0.0-ballot2")
        return template if structure_def['snapshot'].nil? || structure_def['snapshot']['element'].nil?

        multiple_data_types = {}

        # examine the snapshot.elements... move the Element and BackboneElements,
        # and their children, into separate StructureDefiniton hashes and process as
        # child templates.
        child_templates = []
        structure_def['snapshot']['element'].each do |element|
          # skip the first element
          next if element['path'] == path_type
          next unless element['type']

          unique_types = element['type'].map { |t| t['code'] }.uniq
          child_templates << element['path'] if unique_types.include?('Element') || unique_types.include?('BackboneElement')
        end
        # now build the child templates...
        child_templates.each do |child_name|
          child_fixed_name = cap_first(child_name.gsub("#{type_name}.", ''))
          next if child_fixed_name.include?('.')

          child_def = { 'id' => child_fixed_name, 'snapshot' => { 'element' => [] } }
          # Copy the element definitions for the child structure
          structure_def['snapshot']['element'].each do |element|
            child_def['snapshot']['element'] << element.clone if element['path'].start_with?("#{child_name}.")
          end
          # Remove the child elements
          child_paths = child_def['snapshot']['element'].map { |e| e['path'] }
          # child_paths = child_paths.drop(1)
          structure_def['snapshot']['element'].keep_if do |element|
            !child_paths.include?(element['path'])
          end
          # Rename the child paths
          child_def['snapshot']['element'].each do |element|
            element['path'] = element['path'].gsub(child_name, child_fixed_name)
          end
          # add the child
          child_hierarchy = hierarchy + [child_fixed_name]
          child_klass = generate_class(child_hierarchy, child_def)
          template.templates << child_klass
          @templates << child_klass
        end

        # Process the remaining attributes (none of which are Elements or BackboneElements)
        structure_def['snapshot']['element'].each do |element|
          # skip the first element
          next if element['path'] == path_type

          field_base_name = element['path'].gsub("#{path_type}.", '')
          # If the element has a type, treat it as a datatype or resource
          # If not, treat it as a reference to an already declared internal class
          if !element['type'].nil?
            # profiles contains a list of profiles if the datatype is Reference or Extension
            profiles = []
            element['type'].select { |t| t['code'] == 'Reference' || t['code'] == 'Extension' }.each do |data_type|
              profiles << data_type['targetProfile']
            end
            profiles.reject!(&:nil?)
            profiles.flatten!

            # Calculate fields that have multiple data types
            if element['type'].length > 1
              fieldname = field_base_name.gsub('[x]', '')
              unique_types = element['type'].map { |t| t['code'] }.uniq
              multiple_data_types[fieldname] = unique_types if unique_types.length > 1
            end

            # generate a field for each valid datatype... this is for things like Resource.attribute[x]
            element['type'].each do |type|
              extension = type['extension']
              data_type = type['code'] || 'string'
              if element['path'].end_with?('.id')
                data_type = element['base']['path'] == 'Resource.id' ? 'id' : 'string'
              elsif data_type == 'http://hl7.org/fhirpath/System.String' && extension
                data_type = extension.first['valueUrl']
              end
              fieldname = field_base_name.gsub('[x]', cap_first(data_type))
              field = FHIR::Field.new(fieldname)
              field.path = element['path'].gsub(path_type, type_name)
              field.type = data_type
              field.type = 'Extension' if field.path.end_with?('extension')
              field.type_profiles = profiles if ['Reference', 'Extension'].include?(data_type)
              field.min = element['min']
              field.max = element['max']
              field.max = field.max.to_i
              field.max = '*' if element['max'] == '*'

              if ['code', 'Coding', 'CodeableConcept'].include?(data_type) && element['binding']
                field.binding = element['binding']
                field.binding['uri'] = field.binding['valueSet']
                field.binding.delete('valueSet')
                field.binding.delete('description')
                field.binding.delete('extension')
                # set the actual code list
                binding_uri = field.binding['uri']
                # Strip off the |4.0.0 or |4.0.1 or |2014-03-26 or similar from the ends of URLs
                binding_uri&.gsub!(/\|[A-Za-z0-9.-]*/, '')
                codes = ig_resources.get_codes(binding_uri)
                field.valid_codes = codes unless codes.nil?
                if field.valid_codes.empty? && binding_uri && !binding_uri.end_with?(*KNOWN_MISSING_EXPANSIONS)
                  FHIR.logger.warn "  MISSING EXPANSION -- #{field.path} #{field.min}..#{field.max}: #{binding_uri} (#{field.binding['strength']})"
                  @missing_expansions = true
                  @missing_required_expansion ||= (field.binding['strength'] == 'required')
                end
              elsif ['Element', 'BackboneElement'].include?(data_type)
                # This is a nested structure or class
                field.type = "#{hierarchy.join('::')}::#{cap_first(field.name)}"
              end

              template.fields << field
            end
          else # If there is no data type, treat the type as a reference to an already declared internal class
            field = FHIR::Field.new(field_base_name)
            field.path = element['path'].gsub(path_type, type_name)
            field.type = element['contentReference']
            field.type = field.type[1..] if field.type[0] == '#'
            if hierarchy.last == field.type
              # reference to self
              field.type = hierarchy.join('::').to_s
            else
              # reference to contained template
              klass = @templates.select { |x| x.hierarchy.last == field.type }.first
              field.type = if !klass.nil?
                             # the template/child class was declared somewhere else in this class hierarchy
                             klass.hierarchy.join('::')
                           else
                             # the template/child is a direct ancester (it isn't in @templates yet because it is being defined now)
                             field.type.split('.').map { |x| cap_first(x) }.join('::')
                           end
            end
            field.min = element['min']
            field.max = element['max']
            field.max = field.max.to_i
            field.max = '*' if element['max'] == '*'
            template.fields << field
          end
        end

        template.constants['MULTIPLE_TYPES'] = multiple_data_types unless multiple_data_types.empty?
        template
      end
    end
  end
end
