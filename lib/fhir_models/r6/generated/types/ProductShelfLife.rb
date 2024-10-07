module FHIR
  module build.fhir.org
    class ProductShelfLife < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'period' => ['Duration', 'string']
      }
      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ProductShelfLife.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ProductShelfLife.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ProductShelfLife.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'ProductShelfLife.type', 'min'=>0, 'max'=>1},
        'periodDuration' => {'type'=>'Duration', 'path'=>'ProductShelfLife.period[x]', 'min'=>0, 'max'=>1},
        'periodString' => {'type'=>'string', 'path'=>'ProductShelfLife.period[x]', 'min'=>0, 'max'=>1},
        'specialPrecautionsForStorage' => {'type'=>'CodeableConcept', 'path'=>'ProductShelfLife.specialPrecautionsForStorage', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                           # 0-1 string
      attr_accessor :extension                    # 0-* [ Extension ]
      attr_accessor :modifierExtension            # 0-* [ Extension ]
      attr_accessor :type                         # 0-1 CodeableConcept
      attr_accessor :periodDuration               # 0-1 Duration
      attr_accessor :periodString                 # 0-1 string
      attr_accessor :specialPrecautionsForStorage # 0-* [ CodeableConcept ]
    end
  end
end