require_relative 'ig_loader'
require_relative 'template'
require_relative 'metadata_generator'
require_relative 'class_generator'

VERSION_MAP = {
  '4.0.1' => 'r4',
  '4.3.0' => 'r4b',
  '5.0.0' => 'r5',
  '6.0.0-ballot2' => 'r6'
}.freeze

module FHIR
  class Generator
    def self.generate
      ig_packages = Dir.glob(File.join(Dir.pwd, 'lib', 'fhir_models', 'igs', '*.tgz'))

      ig_packages.each do |ig_package|
        new(ig_package).generate
      end
    end

    attr_accessor :ig_resources, :ig_file_name

    def initialize(ig_file_name)
      self.ig_file_name = ig_file_name
    end

    def generate
      puts "Generating tests for IG #{File.basename(ig_file_name)}"
      load_ig_package
      generate_metadata
      generate_types
      generate_resources
    end

    def base_output_folder
      File.join(__dir__, '../', VERSION_MAP[ig_resources.ig_metadata.version].to_s, 'generated')
    end

    def load_ig_package
      FHIR.logger = Logger.new('/dev/null')
      ig_loader = IGLoader.new(ig_file_name)
      self.ig_resources = ig_loader.load(show_summary: true)
      FileUtils.mkdir_p(base_output_folder)
    end

    def generate_metadata
      MetadataGenerator.new(ig_resources, base_output_folder).generate
    end

    def generate_types
      output_folder = File.join(base_output_folder, 'types')
      FileUtils.mkdir_p(output_folder)

      complex_types = ig_resources.complex_types
      ClassGenerator.new(complex_types, ig_resources, output_folder).generate
    end

    def generate_resources
      output_folder = File.join(base_output_folder, 'resources')
      FileUtils.mkdir_p(output_folder)

      resource_definitions = ig_resources.resource_definitions
      ClassGenerator.new(resource_definitions, ig_resources, output_folder).generate
    end
  end
end
