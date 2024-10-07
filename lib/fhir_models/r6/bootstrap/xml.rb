module FHIR
  module R6
    module Xml
      extend FHIR::R6
      extend FHIR::ClassXml
      include FHIR::InstanceXml
    end
  end
end
