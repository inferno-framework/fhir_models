module FHIR
  module R6
    class Definitions
      include CommonDefinitions
      extend FHIR::R6
      @ig_file_name = File.join(__dir__, '..', '..', 'igs', 'hl7.fhir.r6.core.tgz')

      load_igs(@ig_file_name)
    end
  end
end
