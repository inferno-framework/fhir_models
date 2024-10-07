module FHIR
  module build.fhir.org
    class HumanName < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'HumanName.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'HumanName.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'use' => {'valid_codes'=>{'http://hl7.org/fhir/name-use'=>['usual', 'official', 'temp', 'nickname', 'anonymous', 'old', 'maiden']}, 'type'=>'code', 'path'=>'HumanName.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/name-use'}},
        'text' => {'type'=>'string', 'path'=>'HumanName.text', 'min'=>0, 'max'=>1},
        'family' => {'type'=>'string', 'path'=>'HumanName.family', 'min'=>0, 'max'=>1},
        'given' => {'type'=>'string', 'path'=>'HumanName.given', 'min'=>0, 'max'=>Float::INFINITY},
        'prefix' => {'type'=>'string', 'path'=>'HumanName.prefix', 'min'=>0, 'max'=>Float::INFINITY},
        'suffix' => {'type'=>'string', 'path'=>'HumanName.suffix', 'min'=>0, 'max'=>Float::INFINITY},
        'period' => {'type'=>'Period', 'path'=>'HumanName.period', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :use       # 0-1 code
      attr_accessor :text      # 0-1 string
      attr_accessor :family    # 0-1 string
      attr_accessor :given     # 0-* [ string ]
      attr_accessor :prefix    # 0-* [ string ]
      attr_accessor :suffix    # 0-* [ string ]
      attr_accessor :period    # 0-1 Period
    end
  end
end