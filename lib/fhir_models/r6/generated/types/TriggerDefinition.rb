module FHIR
  module build.fhir.org
    class TriggerDefinition < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'timing' => ['Timing', 'Reference', 'date', 'dateTime']
      }
      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'TriggerDefinition.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'TriggerDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/trigger-type'=>['named-event', 'periodic', 'data-changed', 'data-added', 'data-modified', 'data-removed', 'data-accessed', 'data-access-ended']}, 'type'=>'code', 'path'=>'TriggerDefinition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/trigger-type'}},
        'name' => {'type'=>'string', 'path'=>'TriggerDefinition.name', 'min'=>0, 'max'=>1},
        'code' => {'type'=>'CodeableConcept', 'path'=>'TriggerDefinition.code', 'min'=>0, 'max'=>1},
        'subscriptionTopic' => {'type'=>'canonical', 'path'=>'TriggerDefinition.subscriptionTopic', 'min'=>0, 'max'=>1},
        'timingTiming' => {'type'=>'Timing', 'path'=>'TriggerDefinition.timing[x]', 'min'=>0, 'max'=>1},
        'timingReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Schedule'], 'type'=>'Reference', 'path'=>'TriggerDefinition.timing[x]', 'min'=>0, 'max'=>1},
        'timingDate' => {'type'=>'date', 'path'=>'TriggerDefinition.timing[x]', 'min'=>0, 'max'=>1},
        'timingDateTime' => {'type'=>'dateTime', 'path'=>'TriggerDefinition.timing[x]', 'min'=>0, 'max'=>1},
        'data' => {'type'=>'DataRequirement', 'path'=>'TriggerDefinition.data', 'min'=>0, 'max'=>Float::INFINITY},
        'condition' => {'type'=>'Expression', 'path'=>'TriggerDefinition.condition', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :name              # 0-1 string
      attr_accessor :code              # 0-1 CodeableConcept
      attr_accessor :subscriptionTopic # 0-1 canonical
      attr_accessor :timingTiming      # 0-1 Timing
      attr_accessor :timingReference   # 0-1 Reference(Schedule)
      attr_accessor :timingDate        # 0-1 date
      attr_accessor :timingDateTime    # 0-1 dateTime
      attr_accessor :data              # 0-* [ DataRequirement ]
      attr_accessor :condition         # 0-1 Expression
    end
  end
end