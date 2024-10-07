module FHIR
  module R6
    class Communication < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['based-on', 'category', 'encounter', 'identifier', 'in-response-to', 'instantiates-canonical', 'instantiates-uri', 'medium', 'part-of', 'patient', 'reason-code', 'reason-reference', 'received', 'recipient', 'sender', 'sent', 'status', 'subject', 'topic']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Communication.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Communication.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Communication.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Communication.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Communication.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Communication.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Communication.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Communication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Communication.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'Communication.instantiatesCanonical', 'min'=>0, 'max'=>Float::INFINITY},
        'instantiatesUri' => {'type'=>'uri', 'path'=>'Communication.instantiatesUri', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/CommunicationRequest', 'http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/Task', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'Communication.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Communication.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'inResponseTo' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Communication'], 'type'=>'Reference', 'path'=>'Communication.inResponseTo', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/event-status'=>['preparation', 'in-progress', 'not-done', 'on-hold', 'stopped', 'completed', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'Communication.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/event-status'}},
        'statusReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/communication-not-done-reason'=>['unknown', 'system-error', 'invalid-phone-number', 'recipient-unavailable', 'family-objection', 'patient-objection']}, 'type'=>'CodeableConcept', 'path'=>'Communication.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/communication-not-done-reason'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/communication-category'=>['alert', 'notification', 'reminder', 'instruction']}, 'type'=>'CodeableConcept', 'path'=>'Communication.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/communication-category'}},
        'priority' => {'valid_codes'=>{'http://hl7.org/fhir/request-priority'=>['routine', 'urgent', 'asap', 'stat']}, 'type'=>'code', 'path'=>'Communication.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-priority'}},
        'medium' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationMode'=>['PHYSICAL', 'REMOTE', 'VERBAL', 'DICTATE', 'FACE', 'PHONE', 'VIDEOCONF', 'WRITTEN', 'FAXWRIT', 'HANDWRIT', 'MAILWRIT', 'ONLINEWRIT', 'EMAILWRIT', 'TYPEWRIT', 'MSGWRIT', 'SMSWRIT', 'MMSWRIT', 'APPWRIT', 'ELECTRONIC']}, 'type'=>'CodeableConcept', 'path'=>'Communication.medium', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ParticipationMode'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Communication.subject', 'min'=>0, 'max'=>1},
        'topic' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/communication-topic'=>['prescription-refill-request', 'progress-update', 'report-labs', 'appointment-reminder', 'phone-consult', 'summary-report']}, 'type'=>'CodeableConcept', 'path'=>'Communication.topic', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/communication-topic'}},
        'about' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Communication.about', 'min'=>0, 'max'=>Float::INFINITY},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Communication.encounter', 'min'=>0, 'max'=>1},
        'sent' => {'type'=>'dateTime', 'path'=>'Communication.sent', 'min'=>0, 'max'=>1},
        'received' => {'type'=>'dateTime', 'path'=>'Communication.received', 'min'=>0, 'max'=>1},
        'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Communication.recipient', 'min'=>0, 'max'=>Float::INFINITY},
        'sender' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Endpoint', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'Communication.sender', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'CodeableReference', 'path'=>'Communication.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'payload' => {'type'=>'Communication::Payload', 'path'=>'Communication.payload', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'Communication.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Payload < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'content' => ['Attachment', 'Reference', 'CodeableConcept']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Payload.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Payload.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Payload.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'contentAttachment' => {'type'=>'Attachment', 'path'=>'Payload.content[x]', 'min'=>1, 'max'=>1},
          'contentReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Payload.content[x]', 'min'=>1, 'max'=>1},
          'contentCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Payload.content[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :contentAttachment      # 1-1 Attachment
        attr_accessor :contentReference       # 1-1 Reference(Resource)
        attr_accessor :contentCodeableConcept # 1-1 CodeableConcept
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
      attr_accessor :instantiatesCanonical # 0-* [ canonical ]
      attr_accessor :instantiatesUri       # 0-* [ uri ]
      attr_accessor :basedOn               # 0-* [ Reference(CarePlan|CommunicationRequest|DeviceRequest|ImmunizationRecommendation|MedicationRequest|NutritionOrder|ServiceRequest|Task|VisionPrescription) ]
      attr_accessor :partOf                # 0-* [ Reference(Resource) ]
      attr_accessor :inResponseTo          # 0-* [ Reference(Communication) ]
      attr_accessor :status                # 1-1 code
      attr_accessor :statusReason          # 0-1 CodeableConcept
      attr_accessor :category              # 0-* [ CodeableConcept ]
      attr_accessor :priority              # 0-1 code
      attr_accessor :medium                # 0-* [ CodeableConcept ]
      attr_accessor :subject               # 0-1 Reference(Patient|Group)
      attr_accessor :topic                 # 0-1 CodeableConcept
      attr_accessor :about                 # 0-* [ Reference(Resource) ]
      attr_accessor :encounter             # 0-1 Reference(Encounter)
      attr_accessor :sent                  # 0-1 dateTime
      attr_accessor :received              # 0-1 dateTime
      attr_accessor :recipient             # 0-* [ Reference(CareTeam|Device|Group|HealthcareService|Location|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson|Endpoint) ]
      attr_accessor :sender                # 0-1 Reference(Device|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson|HealthcareService|Endpoint|CareTeam)
      attr_accessor :reason                # 0-* [ CodeableReference ]
      attr_accessor :payload               # 0-* [ Communication::Payload ]
      attr_accessor :note                  # 0-* [ Annotation ]

      def resourceType
        'Communication'
      end
    end
  end
end