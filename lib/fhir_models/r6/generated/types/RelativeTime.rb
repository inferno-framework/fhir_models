module FHIR
  module R6
    class RelativeTime < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'offset' => ['Duration', 'Range']
      }
      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'RelativeTime.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'RelativeTime.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'RelativeTime.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'contextReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RelativeTime.contextReference', 'min'=>0, 'max'=>1},
        'contextDefinition' => {'type'=>'canonical', 'path'=>'RelativeTime.contextDefinition', 'min'=>0, 'max'=>1},
        'contextPath' => {'type'=>'string', 'path'=>'RelativeTime.contextPath', 'min'=>0, 'max'=>1},
        'contextCode' => {'valid_codes'=>{'http://hl7.org/fhir/evidence-variable-event'=>['study-start', 'treatment-start', 'condition-detection', 'condition-treatment', 'hospital-admission', 'hospital-discharge', 'operative-procedure']}, 'type'=>'CodeableConcept', 'path'=>'RelativeTime.contextCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/evidence-variable-event'}},
        'offsetDuration' => {'type'=>'Duration', 'path'=>'RelativeTime.offset[x]', 'min'=>0, 'max'=>1},
        'offsetRange' => {'type'=>'Range', 'path'=>'RelativeTime.offset[x]', 'min'=>0, 'max'=>1},
        'text' => {'type'=>'string', 'path'=>'RelativeTime.text', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :contextReference  # 0-1 Reference(Resource)
      attr_accessor :contextDefinition # 0-1 canonical
      attr_accessor :contextPath       # 0-1 string
      attr_accessor :contextCode       # 0-1 CodeableConcept
      attr_accessor :offsetDuration    # 0-1 Duration
      attr_accessor :offsetRange       # 0-1 Range
      attr_accessor :text              # 0-1 string
    end
  end
end