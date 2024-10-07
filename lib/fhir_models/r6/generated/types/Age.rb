module FHIR
  module build.fhir.org
    class Age < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Age.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Age.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'value' => {'type'=>'decimal', 'path'=>'Age.value', 'min'=>0, 'max'=>1},
        'comparator' => {'valid_codes'=>{'http://hl7.org/fhir/quantity-comparator'=>['<', '<=', '>=', '>', 'ad']}, 'type'=>'code', 'path'=>'Age.comparator', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/quantity-comparator'}},
        'unit' => {'type'=>'string', 'path'=>'Age.unit', 'min'=>0, 'max'=>1},
        'system' => {'type'=>'uri', 'path'=>'Age.system', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'code', 'path'=>'Age.code', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id         # 0-1 string
      attr_accessor :extension  # 0-* [ Extension ]
      attr_accessor :value      # 0-1 decimal
      attr_accessor :comparator # 0-1 code
      attr_accessor :unit       # 0-1 string
      attr_accessor :system     # 0-1 uri
      attr_accessor :code       # 0-1 code
    end
  end
end