module FHIR
  module R6
    class DeviceUsage < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'timing' => ['Timing', 'Period', 'dateTime']
      }
      SEARCH_PARAMS = ['device', 'identifier', 'patient', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'DeviceUsage.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'DeviceUsage.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'DeviceUsage.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'DeviceUsage.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'DeviceUsage.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'DeviceUsage.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'DeviceUsage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceUsage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'DeviceUsage.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'DeviceUsage.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/deviceusage-status'=>['active', 'completed', 'not-done', 'entered-in-error', 'intended', 'stopped', 'on-hold']}, 'type'=>'code', 'path'=>'DeviceUsage.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/deviceusage-status'}},
        'category' => {'type'=>'CodeableConcept', 'path'=>'DeviceUsage.category', 'min'=>0, 'max'=>Float::INFINITY},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'DeviceUsage.patient', 'min'=>1, 'max'=>1},
        'derivedFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Claim', 'http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'DeviceUsage.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
        'context' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'DeviceUsage.context', 'min'=>0, 'max'=>1},
        'timingTiming' => {'type'=>'Timing', 'path'=>'DeviceUsage.timing[x]', 'min'=>0, 'max'=>1},
        'timingPeriod' => {'type'=>'Period', 'path'=>'DeviceUsage.timing[x]', 'min'=>0, 'max'=>1},
        'timingDateTime' => {'type'=>'dateTime', 'path'=>'DeviceUsage.timing[x]', 'min'=>0, 'max'=>1},
        'dateAsserted' => {'type'=>'dateTime', 'path'=>'DeviceUsage.dateAsserted', 'min'=>0, 'max'=>1},
        'usageStatus' => {'valid_codes'=>{'http://hl7.org/fhir/deviceusage-status'=>['active', 'completed', 'not-done', 'entered-in-error', 'intended', 'stopped', 'on-hold']}, 'type'=>'CodeableConcept', 'path'=>'DeviceUsage.usageStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/deviceusage-status'}},
        'usageReason' => {'type'=>'CodeableConcept', 'path'=>'DeviceUsage.usageReason', 'min'=>0, 'max'=>Float::INFINITY},
        'adherence' => {'type'=>'DeviceUsage::Adherence', 'path'=>'DeviceUsage.adherence', 'min'=>0, 'max'=>1},
        'informationSource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DeviceUsage.informationSource', 'min'=>0, 'max'=>1},
        'device' => {'type'=>'CodeableReference', 'path'=>'DeviceUsage.device', 'min'=>1, 'max'=>1},
        'reason' => {'type'=>'CodeableReference', 'path'=>'DeviceUsage.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'bodySite' => {'type'=>'CodeableReference', 'path'=>'DeviceUsage.bodySite', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'DeviceUsage.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Adherence < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Adherence.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Adherence.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Adherence.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/deviceusage-adherence-code'=>['always', 'never', 'sometimes']}, 'type'=>'CodeableConcept', 'path'=>'Adherence.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/deviceusage-adherence-code'}},
          'reason' => {'valid_codes'=>{'http://hl7.org/fhir/deviceusage-adherence-reason'=>['lost', 'stolen', 'prescribed', 'broken', 'burned', 'forgot']}, 'type'=>'CodeableConcept', 'path'=>'Adherence.reason', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/deviceusage-adherence-reason'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 CodeableConcept
        attr_accessor :reason            # 1-* [ CodeableConcept ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :basedOn           # 0-* [ Reference(ServiceRequest) ]
      attr_accessor :status            # 1-1 code
      attr_accessor :category          # 0-* [ CodeableConcept ]
      attr_accessor :patient           # 1-1 Reference(Patient)
      attr_accessor :derivedFrom       # 0-* [ Reference(ServiceRequest|Procedure|Claim|Observation|QuestionnaireResponse|DocumentReference) ]
      attr_accessor :context           # 0-1 Reference(Encounter|EpisodeOfCare)
      attr_accessor :timingTiming      # 0-1 Timing
      attr_accessor :timingPeriod      # 0-1 Period
      attr_accessor :timingDateTime    # 0-1 dateTime
      attr_accessor :dateAsserted      # 0-1 dateTime
      attr_accessor :usageStatus       # 0-1 CodeableConcept
      attr_accessor :usageReason       # 0-* [ CodeableConcept ]
      attr_accessor :adherence         # 0-1 DeviceUsage::Adherence
      attr_accessor :informationSource # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Organization)
      attr_accessor :device            # 1-1 CodeableReference
      attr_accessor :reason            # 0-* [ CodeableReference ]
      attr_accessor :bodySite          # 0-1 CodeableReference
      attr_accessor :note              # 0-* [ Annotation ]

      def resourceType
        'DeviceUsage'
      end
    end
  end
end