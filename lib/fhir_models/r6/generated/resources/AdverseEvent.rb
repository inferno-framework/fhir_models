module FHIR
  module build.fhir.org
    class AdverseEvent < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'cause' => ['dateTime', 'Period'],
        'effect' => ['dateTime', 'Period']
      }
      SEARCH_PARAMS = ['actuality', 'category', 'cause', 'code', 'effect', 'identifier', 'location', 'patient', 'recorder', 'resultingeffect', 'seriousness', 'status', 'study', 'subject', 'substance']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'AdverseEvent.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'AdverseEvent.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'AdverseEvent.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'AdverseEvent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'AdverseEvent.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'AdverseEvent.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'AdverseEvent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AdverseEvent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'AdverseEvent.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/event-status'=>['in-progress', 'completed', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'AdverseEvent.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-status'}},
        'actuality' => {'valid_codes'=>{'http://hl7.org/fhir/adverse-event-actuality'=>['actual', 'potential']}, 'type'=>'code', 'path'=>'AdverseEvent.actuality', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-actuality'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adverse-event-category'=>['wrong-patient', 'procedure-mishap', 'medication-mishap', 'device', 'unsafe-physical-environment', 'hospital-aquired-infection', 'wrong-body-site']}, 'type'=>'CodeableConcept', 'path'=>'AdverseEvent.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-category'}},
        'code' => {'valid_codes'=>{'http://snomed.info/sct'=>['370894009', '5331006', '13234002', '49380000', '52136000', '370895005', '370896006', '370897002', '370898007', '370899004', '370900009', '370901008', '370902001', '370903006', '370904000', '370905004', '370906003', '370907007', '370908002', '370909005', '370910000', '370911001', '370912008', '370913003', '370914009', '370915005', '370916006', '370917002', '370918007', '370919004', '370920005', '370921009', '370922002', '370923007', '370924001', '370925000', '370926004', '370927008', '397866006', '398226000', '405644001', '415169009', '424522003', '426106009', '427513009', '844579007', '1912002']}, 'type'=>'CodeableConcept', 'path'=>'AdverseEvent.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-type'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'AdverseEvent.subject', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'AdverseEvent.encounter', 'min'=>0, 'max'=>1},
        'causeDateTime' => {'type'=>'dateTime', 'path'=>'AdverseEvent.cause[x]', 'min'=>0, 'max'=>1},
        'causePeriod' => {'type'=>'Period', 'path'=>'AdverseEvent.cause[x]', 'min'=>0, 'max'=>1},
        'effectDateTime' => {'type'=>'dateTime', 'path'=>'AdverseEvent.effect[x]', 'min'=>0, 'max'=>1},
        'effectPeriod' => {'type'=>'Period', 'path'=>'AdverseEvent.effect[x]', 'min'=>0, 'max'=>1},
        'detected' => {'type'=>'dateTime', 'path'=>'AdverseEvent.detected', 'min'=>0, 'max'=>1},
        'recordedDate' => {'type'=>'dateTime', 'path'=>'AdverseEvent.recordedDate', 'min'=>0, 'max'=>1},
        'resultingEffect' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'AdverseEvent.resultingEffect', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'AdverseEvent.location', 'min'=>0, 'max'=>1},
        'seriousness' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adverse-event-seriousness'=>['non-serious', 'serious']}, 'type'=>'CodeableConcept', 'path'=>'AdverseEvent.seriousness', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-seriousness'}},
        'outcome' => {'valid_codes'=>{'http://snomed.info/sct'=>['397882007', '398056004', '405531001', '405532008', '405535005']}, 'type'=>'CodeableConcept', 'path'=>'AdverseEvent.outcome', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-outcome'}},
        'recorder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'AdverseEvent.recorder', 'min'=>0, 'max'=>1},
        'participant' => {'type'=>'AdverseEvent::Participant', 'path'=>'AdverseEvent.participant', 'min'=>0, 'max'=>Float::INFINITY},
        'study' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ResearchStudy'], 'type'=>'Reference', 'path'=>'AdverseEvent.study', 'min'=>0, 'max'=>Float::INFINITY},
        'expectedInResearchStudy' => {'type'=>'boolean', 'path'=>'AdverseEvent.expectedInResearchStudy', 'min'=>0, 'max'=>1},
        'suspectEntity' => {'type'=>'AdverseEvent::SuspectEntity', 'path'=>'AdverseEvent.suspectEntity', 'min'=>0, 'max'=>Float::INFINITY},
        'contributingFactor' => {'type'=>'CodeableReference', 'path'=>'AdverseEvent.contributingFactor', 'min'=>0, 'max'=>Float::INFINITY},
        'preventiveAction' => {'type'=>'CodeableReference', 'path'=>'AdverseEvent.preventiveAction', 'min'=>0, 'max'=>Float::INFINITY},
        'mitigatingAction' => {'type'=>'CodeableReference', 'path'=>'AdverseEvent.mitigatingAction', 'min'=>0, 'max'=>Float::INFINITY},
        'supportingInfo' => {'type'=>'CodeableReference', 'path'=>'AdverseEvent.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'AdverseEvent.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Participant < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Participant.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Participant.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Participant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'function' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationType'=>['INF', 'PART', 'WIT', 'AUT']}, 'type'=>'CodeableConcept', 'path'=>'Participant.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-participant-function'}},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Participant.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Device|RelatedPerson)
      end

      class SuspectEntity < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'SuspectEntity.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'SuspectEntity.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'SuspectEntity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'instance' => {'type'=>'CodeableReference', 'path'=>'SuspectEntity.instance', 'min'=>1, 'max'=>1},
          'causality' => {'type'=>'AdverseEvent::SuspectEntity::Causality', 'path'=>'SuspectEntity.causality', 'min'=>0, 'max'=>1}
        }

        class Causality < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Causality.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Causality.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Causality.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'assessmentMethod' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adverse-event-causality-method'=>['probability-scale', 'bayesian', 'checklist']}, 'type'=>'CodeableConcept', 'path'=>'Causality.assessmentMethod', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-causality-method'}},
            'entityRelatedness' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adverse-event-causality-assess'=>['certain', 'probably-likely', 'possible', 'unlikely', 'conditional-classified', 'unassessable-unclassifiable']}, 'type'=>'CodeableConcept', 'path'=>'Causality.entityRelatedness', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adverse-event-causality-assess'}},
            'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Causality.author', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :assessmentMethod  # 0-1 CodeableConcept
          attr_accessor :entityRelatedness # 0-1 CodeableConcept
          attr_accessor :author            # 0-1 Reference(Practitioner|PractitionerRole|Patient|RelatedPerson)
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :instance          # 1-1 CodeableReference
        attr_accessor :causality         # 0-1 AdverseEvent::SuspectEntity::Causality
      end

      attr_accessor :id                      # 0-1 id
      attr_accessor :meta                    # 0-1 Meta
      attr_accessor :implicitRules           # 0-1 uri
      attr_accessor :language                # 0-1 code
      attr_accessor :text                    # 0-1 Narrative
      attr_accessor :contained               # 0-* [ Resource ]
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :identifier              # 0-* [ Identifier ]
      attr_accessor :status                  # 1-1 code
      attr_accessor :actuality               # 1-1 code
      attr_accessor :category                # 0-* [ CodeableConcept ]
      attr_accessor :code                    # 0-1 CodeableConcept
      attr_accessor :subject                 # 1-1 Reference(Patient|Group|Practitioner|RelatedPerson)
      attr_accessor :encounter               # 0-1 Reference(Encounter)
      attr_accessor :causeDateTime           # 0-1 dateTime
      attr_accessor :causePeriod             # 0-1 Period
      attr_accessor :effectDateTime          # 0-1 dateTime
      attr_accessor :effectPeriod            # 0-1 Period
      attr_accessor :detected                # 0-1 dateTime
      attr_accessor :recordedDate            # 0-1 dateTime
      attr_accessor :resultingEffect         # 0-* [ Reference(Condition|Observation) ]
      attr_accessor :location                # 0-1 Reference(Location)
      attr_accessor :seriousness             # 0-1 CodeableConcept
      attr_accessor :outcome                 # 0-* [ CodeableConcept ]
      attr_accessor :recorder                # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson)
      attr_accessor :participant             # 0-* [ AdverseEvent::Participant ]
      attr_accessor :study                   # 0-* [ Reference(ResearchStudy) ]
      attr_accessor :expectedInResearchStudy # 0-1 boolean
      attr_accessor :suspectEntity           # 0-* [ AdverseEvent::SuspectEntity ]
      attr_accessor :contributingFactor      # 0-* [ CodeableReference ]
      attr_accessor :preventiveAction        # 0-* [ CodeableReference ]
      attr_accessor :mitigatingAction        # 0-* [ CodeableReference ]
      attr_accessor :supportingInfo          # 0-* [ CodeableReference ]
      attr_accessor :note                    # 0-* [ Annotation ]

      def resourceType
        'AdverseEvent'
      end
    end
  end
end