module FHIR
  module R6
    module Json
      extend FHIR::R6
      extend FHIR::ClassJson
      include FHIR::InstanceJson
    end
  end
end
