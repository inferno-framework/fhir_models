module FHIR
  module R6
    class CodeableConcept < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'CodeableConcept.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'CodeableConcept.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'coding' => {'type'=>'Coding', 'path'=>'CodeableConcept.coding', 'min'=>0, 'max'=>Float::INFINITY},
        'text' => {'type'=>'string', 'path'=>'CodeableConcept.text', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :coding    # 0-* [ Coding ]
      attr_accessor :text      # 0-1 string
    end
  end
end