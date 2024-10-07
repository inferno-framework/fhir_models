module FHIR
  module build.fhir.org
    class CodeableReference < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'CodeableReference.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'CodeableReference.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'concept' => {'type'=>'CodeableConcept', 'path'=>'CodeableReference.concept', 'min'=>0, 'max'=>1},
        'reference' => {'type'=>'Reference', 'path'=>'CodeableReference.reference', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :concept   # 0-1 CodeableConcept
      attr_accessor :reference # 0-1 Reference()
    end
  end
end