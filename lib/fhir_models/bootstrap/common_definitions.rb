require 'tempfile'
require_relative '../generator/ig_loader'

module FHIR
  module CommonDefinitions
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      extend FHIR::Deprecate

      def ig_resources
        @ig_resources ||= @ig_loader.load
      end

      def cache
        @cache ||= {}
      end

      # This method actually just sets up lazy loading to avoid having to load
      # everything at start time.
      def load_igs(ig_file_name)
        @ig_loader = FHIR::Generator::IGLoader.new(ig_file_name)
      end

      def find_structure_definition(structure_defs, target_name)
        return nil if target_name.nil?
        return cache[target_name] if cache[target_name]

        definition = structure_defs.find do |sd|
          sd['id'] == target_name || sd['name'] == target_name || sd['url'] == target_name
        end

        cache[target_name] = create_structure_definition(definition) if definition
        cache[target_name]
      end

      def create_structure_definition(definition)
        return nil if definition.nil?

        versioned_fhir_module::StructureDefinition.new(definition)
      end

      # # ----------------------------------------------------------------
      # #  Types
      # # ----------------------------------------------------------------

      def primitive_types
        ig_resources.primitive_types
      end
      deprecate :get_primitive_types, :primitive_types

      def complex_types
        ig_resources.complex_types
      end
      deprecate :get_complex_types, :complex_types

      def type_definition(type_name)
        find_structure_definition(primitive_types + complex_types, type_name)
      end
      deprecate :get_type_definition, :type_definition

      # ----------------------------------------------------------------
      #  Resources, Profiles, Extensions
      # ----------------------------------------------------------------

      def resource_definitions
        ig_resources.resource_definitions
      end
      deprecate :get_resource_definitions, :resource_definitions

      def resource_definition(resource_name)
        find_structure_definition(resource_definitions, resource_name)
      end
      deprecate :get_resource_definition, :resource_definition

      def extension_definition(extension_name)
        find_structure_definition(ig_resources.extension_definitions, extension_name)
      end
      deprecate :get_extension_definition, :extension_definition

      # Get the basetype (String) for a given profile or extension.
      def basetype(uri)
        return nil if uri.nil?

        defn = ig_resources.profiles.detect { |x| x['url'] == uri } || ig_resources.extension_definitions.detect { |x| x['url'] == uri }
        return nil if defn.nil?

        defn['type']
      end
      deprecate :get_basetype, :basetype

      # Get the StructureDefinition for a given profile.
      def profile(profile_url)
        find_structure_definition(ig_resources.profiles, profile_url)
      end
      deprecate :get_profile, :profile

      def profiles_for_resource(resource_name)
        return nil if resource_name.nil?

        ig_resources.profiles.select { |x| x['type'] == resource_name }
      end
      deprecate :get_profiles_for_resource, :profile_for_resource

      # ----------------------------------------------------------------
      #  ValueSet Code Expansions
      # ----------------------------------------------------------------

      def valuesets
        ig_resources.get_value_sets
      end

      def get_codes(url)
        ig_resources.get_codes(url)
      end

      # Why do we have this function?
      def get_display(system, code)
        return nil if system.nil? || code.nil?

        ig_resources.get_value_sets.each do |value_set|
          if value_set['expansion'] && value_set['expansion']['contains']
            value_set['expansion']['contains'].each do |contain|
              return contain['display'] if contain['system'] == system && contain['code'] == code
            end
          elsif value_set['compose'] && value_set['compose']['include']
            value_set['compose']['include'].each do |include_element|
              if include_element['system'] == system && include_element['concept']
                include_element['concept'].each { |concept| return concept['display'] if concept['code'] == code }
              end
            end
          end
        end
      end

      # ----------------------------------------------------------------
      #  Search Params
      # ----------------------------------------------------------------

      def self.search_parameters(type_name)
        ig_resources.get_search_parameters(type_name)
      end
      deprecate :get_search_parameters, :search_parameters
    end
  end
end
