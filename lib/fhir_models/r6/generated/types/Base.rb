module FHIR
  module build.fhir.org
    class Base < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []

    end
  end
end