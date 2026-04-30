module FHIR
  class Generator
    class IGResources
      attr_accessor :ig_metadata

      def add(resource, break_bundle: false)
        return if resource.nil?

        if break_bundle && resource['resourceType'] == 'Bundle'
          resource['entry']&.each do |entry|
            entry_resource = entry['resource']
            next if entry_resource.nil?

            if entry_resource['resourceType'] == 'ValueSet'
              merge_value_set(entry_resource)
            else
              resources_by_type[resource['resourceType']] << entry_resource
            end
          end
        else
          resources_by_type[resource['resourceType']] << resource
        end
      end

      def primitive_types
        resources_by_type['StructureDefinition'].select { |sd| sd['kind'] == 'primitive-type' }
      end

      def complex_types
        resources_by_type['StructureDefinition'].select { |sd| sd['kind'] == 'complex-type' && sd['derivation'] != 'constraint' }
      end

      def resource_definitions
        resources_by_type['StructureDefinition'].select { |sd| sd['kind'] == 'resource' && sd['derivation'] != 'constraint' }
      end

      def extension_definitions
        resources_by_type['StructureDefinition'].select { |sd| sd['type'] == 'Extension' && sd['derivation'] == 'constraint' }
      end

      def profiles
        resources_by_type['StructureDefinition'].select { |sd| sd['kind'] == 'resource' && sd['derivation'] == 'constraint' }
      end

      def get_code_systems(url = nil)
        if url.nil?
          resources_by_type['CodeSystem']
        else
          resources_by_type['CodeSystem'].find { |cs| cs['url'] == url }
        end
      end

      def get_value_sets(url = nil)
        if url.nil?
          resources_by_type['ValueSet']
        else
          resources_by_type['ValueSet'].find { |vs| vs['url'] == url }
        end
      end

      def get_search_parameters(type_name = nil)
        if type_name.nil?
          resources_by_type['SearchParameter']
        else
          resources_by_type['SearchParameter'].select do |p|
            p['base']&.include?(type_name) && p['expression'] && !p['expression'].include?('extension')
          end
        end
      end

      def transformed_expansion
        @transformed_expansion ||= {}
      end

      def merge_value_set(from_value_set)
        url = from_value_set['url']
        to_value_set = get_value_sets(url)

        if to_value_set.nil?
          resources_by_type['ValueSet'] << from_value_set
        elsif to_value_set['expansion'].nil? && !from_value_set['expansion'].nil?
          to_value_set['expansion'] = from_value_set['expansion']
        elsif to_value_set['compose'].nil? && !from_value_set['compose'].nil?
          to_value_set['compose'] = from_value_set['compose']
        else
          puts "Cannot merge ValueSet #{url}"
        end
      end

      def get_codes(url)
        return nil if url.nil?
        return transformed_expansion[url] if transformed_expansion[url]

        value_set = get_value_sets(url)
        unless value_set.nil?
          transformed_expansion[url] = {}
          # if the expansion is completed already, use it...
          # except for http://hl7.org/fhir/ValueSet/c80-doc-typecodes, because that expansion is missing codes
          if value_set.dig('expansion', 'contains') && url != 'http://hl7.org/fhir/ValueSet/c80-doc-typecodes'
            transformed_expansion[url] = value_set['expansion']['contains']
                                         .group_by { |coding| coding['system'] }
                                         .transform_values { |v| v.map { |coding| coding['code'] } }
          elsif !value_set['compose'].nil?
            # the expansion is not available, so we have to include values
            # and possibly partially expand the Valueset by including extra CodeSystems
            # So, for each system, if codes are included add them...
            value_set['compose']['include']&.each do |include_element|
              system_url = include_element['system']
              next if system_url.nil?

              included_codes = codes_from_compose(include_element)
              transformed_expansion[url][system_url] = included_codes unless included_codes.empty?
            end

            value_set['compose']['exclude']&.each do |exclude_element|
              system_url = exclude_element['system']
              next if system_url.nil?

              excluded_codes = codes_from_compose(exclude_element)

              if transformed_expansion[url].key?(system_url)
                transformed_expansion[url][system_url] = transformed_expansion[url][system_url] - excluded_codes
                transformed_expansion[url].delete(system_url) if transformed_expansion[url][system_url].empty?
              end
            end
          end
          transformed_expansion[url].each_value(&:uniq!)
        end
        transformed_expansion[url]
      end

      def codes_from_compose(backbone_element)
        collected_codes = []
        system_url = backbone_element['system']

        if !system_url.nil?
          if !backbone_element['concept'].nil?
            backbone_element['concept'].each { |coding| collected_codes << coding['code'] }
          elsif backbone_element['filter'].nil?
            # i.e. the include/exclude element has 'system', 'copyright' and/or 'version'
            cs = get_code_systems(system_url)
            collected_codes.concat(all_codes_from_concept(cs['concept'])) unless cs.nil?
          end
        elsif !backbone_element['valueSet'].nil?
          # Handle include/exclude value set
        end

        collected_codes
      end

      def all_codes_from_concept(concept)
        collected_codes = []
        concept&.each do |c|
          collected_codes << c['code']
          collected_codes.concat(all_codes_from_concept(c['concept'])) unless c['concept'].nil?
        end
        collected_codes
      end

      # private
      def resources_by_type
        @resources_by_type ||= Hash.new { |hash, key| hash[key] = [] }
      end
    end
  end
end
