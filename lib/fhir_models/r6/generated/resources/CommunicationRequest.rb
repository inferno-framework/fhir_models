module FHIR
  module build.fhir.org
    class CommunicationRequest < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'occurrence' => ['dateTime', 'Period']
      }
      SEARCH_PARAMS = ['about', 'authored', 'based-on', 'category', 'encounter', 'group-identifier', 'identifier', 'information-provider', 'medium', 'occurrence', 'patient', 'priority', 'recipient', 'replaces', 'requester', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'CommunicationRequest.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'CommunicationRequest.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'CommunicationRequest.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'CommunicationRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'CommunicationRequest.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'CommunicationRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'CommunicationRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'CommunicationRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'CommunicationRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'CommunicationRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'replaces' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CommunicationRequest'], 'type'=>'Reference', 'path'=>'CommunicationRequest.replaces', 'min'=>0, 'max'=>Float::INFINITY},
        'groupIdentifier' => {'type'=>'Identifier', 'path'=>'CommunicationRequest.groupIdentifier', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/request-status'=>['draft', 'active', 'on-hold', 'revoked', 'completed', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'CommunicationRequest.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-status'}},
        'statusReason' => {'valid_codes'=>{'http://snomed.info/sct'=>['281323002', '397709008', '105480006', '719500002', '445060000', '704273008', '704274002', '704458005', '704275001', '704276000', '704277009', '310376006', '414859005', '416409005', '416308001', '737038009', '713835001', '398227009']}, 'type'=>'CodeableConcept', 'path'=>'CommunicationRequest.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/communication-request-status-reason'}},
        'intent' => {'valid_codes'=>{'http://hl7.org/fhir/request-intent'=>['proposal', 'plan', 'directive', 'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order', 'option']}, 'type'=>'code', 'path'=>'CommunicationRequest.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-intent'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/communication-category'=>['alert', 'notification', 'reminder', 'instruction']}, 'type'=>'CodeableConcept', 'path'=>'CommunicationRequest.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/communication-category'}},
        'priority' => {'valid_codes'=>{'http://hl7.org/fhir/request-priority'=>['routine', 'urgent', 'asap', 'stat']}, 'type'=>'code', 'path'=>'CommunicationRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-priority'}},
        'doNotPerform' => {'type'=>'boolean', 'path'=>'CommunicationRequest.doNotPerform', 'min'=>0, 'max'=>1},
        'medium' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationMode'=>['PHYSICAL', 'REMOTE', 'VERBAL', 'DICTATE', 'FACE', 'PHONE', 'VIDEOCONF', 'WRITTEN', 'FAXWRIT', 'HANDWRIT', 'MAILWRIT', 'ONLINEWRIT', 'EMAILWRIT', 'TYPEWRIT', 'MSGWRIT', 'SMSWRIT', 'MMSWRIT', 'APPWRIT', 'ELECTRONIC']}, 'type'=>'CodeableConcept', 'path'=>'CommunicationRequest.medium', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ParticipationMode'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'CommunicationRequest.subject', 'min'=>0, 'max'=>1},
        'about' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'CommunicationRequest.about', 'min'=>0, 'max'=>Float::INFINITY},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'CommunicationRequest.encounter', 'min'=>0, 'max'=>1},
        'payload' => {'type'=>'CommunicationRequest::Payload', 'path'=>'CommunicationRequest.payload', 'min'=>0, 'max'=>Float::INFINITY},
        'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'CommunicationRequest.occurrence[x]', 'min'=>0, 'max'=>1},
        'occurrencePeriod' => {'type'=>'Period', 'path'=>'CommunicationRequest.occurrence[x]', 'min'=>0, 'max'=>1},
        'authoredOn' => {'type'=>'dateTime', 'path'=>'CommunicationRequest.authoredOn', 'min'=>0, 'max'=>1},
        'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'CommunicationRequest.requester', 'min'=>0, 'max'=>1},
        'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'CommunicationRequest.recipient', 'min'=>0, 'max'=>Float::INFINITY},
        'informationProvider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'CommunicationRequest.informationProvider', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'type'=>'CodeableReference', 'path'=>'CommunicationRequest.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'CommunicationRequest.note', 'min'=>0, 'max'=>Float::INFINITY}
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

      attr_accessor :id                  # 0-1 id
      attr_accessor :meta                # 0-1 Meta
      attr_accessor :implicitRules       # 0-1 uri
      attr_accessor :language            # 0-1 code
      attr_accessor :text                # 0-1 Narrative
      attr_accessor :contained           # 0-* [ Resource ]
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :identifier          # 0-* [ Identifier ]
      attr_accessor :basedOn             # 0-* [ Reference(Resource) ]
      attr_accessor :replaces            # 0-* [ Reference(CommunicationRequest) ]
      attr_accessor :groupIdentifier     # 0-1 Identifier
      attr_accessor :status              # 1-1 code
      attr_accessor :statusReason        # 0-1 CodeableConcept
      attr_accessor :intent              # 1-1 code
      attr_accessor :category            # 0-* [ CodeableConcept ]
      attr_accessor :priority            # 0-1 code
      attr_accessor :doNotPerform        # 0-1 boolean
      attr_accessor :medium              # 0-* [ CodeableConcept ]
      attr_accessor :subject             # 0-1 Reference(Patient|Group)
      attr_accessor :about               # 0-* [ Reference(Resource) ]
      attr_accessor :encounter           # 0-1 Reference(Encounter)
      attr_accessor :payload             # 0-* [ CommunicationRequest::Payload ]
      attr_accessor :occurrenceDateTime  # 0-1 dateTime
      attr_accessor :occurrencePeriod    # 0-1 Period
      attr_accessor :authoredOn          # 0-1 dateTime
      attr_accessor :requester           # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson|Device)
      attr_accessor :recipient           # 0-* [ Reference(Device|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson|Group|CareTeam|HealthcareService|Endpoint) ]
      attr_accessor :informationProvider # 0-* [ Reference(Device|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson|HealthcareService|Endpoint) ]
      attr_accessor :reason              # 0-* [ CodeableReference ]
      attr_accessor :note                # 0-* [ Annotation ]

      def resourceType
        'CommunicationRequest'
      end
    end
  end
end