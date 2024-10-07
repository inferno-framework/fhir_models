module FHIR
  module build.fhir.org
    class DeviceDispense < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['code', 'identifier', 'patient', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'DeviceDispense.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'DeviceDispense.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'DeviceDispense.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'DeviceDispense.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'DeviceDispense.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'DeviceDispense.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'DeviceDispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceDispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'DeviceDispense.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/DeviceRequest'], 'type'=>'Reference', 'path'=>'DeviceDispense.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'DeviceDispense.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/devicedispense-status'=>['preparation', 'in-progress', 'cancelled', 'on-hold', 'completed', 'entered-in-error', 'stopped', 'declined', 'unknown']}, 'type'=>'code', 'path'=>'DeviceDispense.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/devicedispense-status'}},
        'statusReason' => {'type'=>'CodeableReference', 'path'=>'DeviceDispense.statusReason', 'min'=>0, 'max'=>1},
        'category' => {'type'=>'CodeableConcept', 'path'=>'DeviceDispense.category', 'min'=>0, 'max'=>Float::INFINITY},
        'device' => {'type'=>'CodeableReference', 'path'=>'DeviceDispense.device', 'min'=>1, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'DeviceDispense.subject', 'min'=>1, 'max'=>1},
        'receiver' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'DeviceDispense.receiver', 'min'=>0, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'DeviceDispense.encounter', 'min'=>0, 'max'=>1},
        'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'DeviceDispense.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'performer' => {'type'=>'DeviceDispense::Performer', 'path'=>'DeviceDispense.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'DeviceDispense.location', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'DeviceDispense.type', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'DeviceDispense.quantity', 'min'=>0, 'max'=>1},
        'preparedDate' => {'type'=>'dateTime', 'path'=>'DeviceDispense.preparedDate', 'min'=>0, 'max'=>1},
        'whenHandedOver' => {'type'=>'dateTime', 'path'=>'DeviceDispense.whenHandedOver', 'min'=>0, 'max'=>1},
        'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'DeviceDispense.destination', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'DeviceDispense.note', 'min'=>0, 'max'=>Float::INFINITY},
        'usageInstruction' => {'type'=>'markdown', 'path'=>'DeviceDispense.usageInstruction', 'min'=>0, 'max'=>1},
        'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'DeviceDispense.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Performer < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'function' => {'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|Patient|Device|RelatedPerson|CareTeam)
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :meta                  # 0-1 Meta
      attr_accessor :implicitRules         # 0-1 uri
      attr_accessor :language              # 0-1 code
      attr_accessor :text                  # 0-1 Narrative
      attr_accessor :contained             # 0-* [ Resource ]
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :identifier            # 0-* [ Identifier ]
      attr_accessor :basedOn               # 0-* [ Reference(CarePlan|DeviceRequest) ]
      attr_accessor :partOf                # 0-* [ Reference(Procedure) ]
      attr_accessor :status                # 1-1 code
      attr_accessor :statusReason          # 0-1 CodeableReference
      attr_accessor :category              # 0-* [ CodeableConcept ]
      attr_accessor :device                # 1-1 CodeableReference
      attr_accessor :subject               # 1-1 Reference(Patient|Practitioner)
      attr_accessor :receiver              # 0-1 Reference(Patient|Practitioner|RelatedPerson|Location|PractitionerRole)
      attr_accessor :encounter             # 0-1 Reference(Encounter)
      attr_accessor :supportingInformation # 0-* [ Reference(Resource) ]
      attr_accessor :performer             # 0-* [ DeviceDispense::Performer ]
      attr_accessor :location              # 0-1 Reference(Location)
      attr_accessor :type                  # 0-1 CodeableConcept
      attr_accessor :quantity              # 0-1 Quantity
      attr_accessor :preparedDate          # 0-1 dateTime
      attr_accessor :whenHandedOver        # 0-1 dateTime
      attr_accessor :destination           # 0-1 Reference(Location)
      attr_accessor :note                  # 0-* [ Annotation ]
      attr_accessor :usageInstruction      # 0-1 markdown
      attr_accessor :eventHistory          # 0-* [ Reference(Provenance) ]

      def resourceType
        'DeviceDispense'
      end
    end
  end
end