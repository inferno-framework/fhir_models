module FHIR
  class Generator
    class IGMetadata
      ATTRIBUTES = [
        :name,
        :shortName,
        :version,
        :fhirVersions,
        :url
      ].freeze

      ATTRIBUTES.each { |name| attr_accessor name }

      def initialize(hash)
        hash.each do |key, value|
          next unless ATTRIBUTES.include?(key.to_sym)

          instance_variable_set(:"@#{key}", value)
        end

        self.shortName = url.split('/').last unless url.nil?
        self.shortName = 'R6' if fhirVersions.include?('6.0.0-ballot2')
      end
    end
  end
end
