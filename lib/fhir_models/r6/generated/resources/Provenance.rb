module FHIR
  module build.fhir.org
    class Provenance < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'occurred' => ['Period', 'dateTime']
      }
      SEARCH_PARAMS = ['activity', 'agent', 'agent-role', 'agent-type', 'based-on', 'encounter', 'entity', 'location', 'patient', 'recorded', 'signature-type', 'target', 'when']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Provenance.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Provenance.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Provenance.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Provenance.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Provenance.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Provenance.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Provenance.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Provenance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Provenance.target', 'min'=>1, 'max'=>Float::INFINITY},
        'occurredPeriod' => {'type'=>'Period', 'path'=>'Provenance.occurred[x]', 'min'=>0, 'max'=>1},
        'occurredDateTime' => {'type'=>'dateTime', 'path'=>'Provenance.occurred[x]', 'min'=>0, 'max'=>1},
        'recorded' => {'type'=>'instant', 'path'=>'Provenance.recorded', 'min'=>0, 'max'=>1},
        'policy' => {'type'=>'uri', 'path'=>'Provenance.policy', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Provenance.location', 'min'=>0, 'max'=>1},
        'authorization' => {'type'=>'CodeableReference', 'path'=>'Provenance.authorization', 'min'=>0, 'max'=>Float::INFINITY},
        'why' => {'type'=>'markdown', 'path'=>'Provenance.why', 'min'=>0, 'max'=>1},
        'activity' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/iso-21089-lifecycle'=>['amend', 'originate', 'merge', 'deidentify', 'receive', 'transform', 'verify']}, 'type'=>'CodeableConcept', 'path'=>'Provenance.activity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-activity-type'}},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Provenance.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Provenance.patient', 'min'=>0, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Provenance.encounter', 'min'=>0, 'max'=>1},
        'agent' => {'type'=>'Provenance::Agent', 'path'=>'Provenance.agent', 'min'=>1, 'max'=>Float::INFINITY},
        'entity' => {'type'=>'Provenance::Entity', 'path'=>'Provenance.entity', 'min'=>0, 'max'=>Float::INFINITY},
        'signature' => {'type'=>'Signature', 'path'=>'Provenance.signature', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Agent < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/provenance-participant-type'=>['enterer', 'performer', 'author', 'editor', 'verifier', 'legal', 'attester', 'informant', 'custodian', 'assembler', 'transformer', 'composer'], 'http://dicom.nema.org/resources/ontology/DCM'=>['110150', '110151', '110152', '110153', '110154', '110155'], 'http://terminology.hl7.org/CodeSystem/extra-security-role-type'=>['authserver', 'datacollector', 'dataprocessor', 'datasubject', 'humanuser']}, 'type'=>'CodeableConcept', 'path'=>'Agent.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/participation-role-type'}},
          'role' => {'valid_codes'=>{'http://hl7.org/fhir/sample-security-structural-roles'=>['regulated-health-professionals', 'general-medicine', 'general-nursing', 'dentist', 'veterinarian', 'pharmacy', 'dietician', 'pediatrics', 'non-regulated-health-professionals', 'receptionist', 'business-manager', 'transcriptionist', 'claims-adjudicator']}, 'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/security-role-type'}},
          'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Agent.who', 'min'=>1, 'max'=>1},
          'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Agent.onBehalfOf', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :role              # 0-* [ CodeableConcept ]
        attr_accessor :who               # 1-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Device|RelatedPerson|Group)
        attr_accessor :onBehalfOf        # 0-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Group)
      end

      class Entity < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Entity.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Entity.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Entity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'role' => {'valid_codes'=>{'http://hl7.org/fhir/provenance-entity-role'=>['revision', 'quotation', 'source', 'instantiates', 'removal']}, 'type'=>'code', 'path'=>'Entity.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/provenance-entity-role'}},
          'what' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Entity.what', 'min'=>1, 'max'=>1},
          'agent' => {'type'=>'Provenance::Agent', 'path'=>'Entity.agent', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :role              # 1-1 code
        attr_accessor :what              # 1-1 Reference(Resource)
        attr_accessor :agent             # 0-* [ Provenance::Agent ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :target            # 1-* [ Reference(Resource) ]
      attr_accessor :occurredPeriod    # 0-1 Period
      attr_accessor :occurredDateTime  # 0-1 dateTime
      attr_accessor :recorded          # 0-1 instant
      attr_accessor :policy            # 0-* [ uri ]
      attr_accessor :location          # 0-1 Reference(Location)
      attr_accessor :authorization     # 0-* [ CodeableReference ]
      attr_accessor :why               # 0-1 markdown
      attr_accessor :activity          # 0-1 CodeableConcept
      attr_accessor :basedOn           # 0-* [ Reference(Resource) ]
      attr_accessor :patient           # 0-1 Reference(Patient)
      attr_accessor :encounter         # 0-1 Reference(Encounter)
      attr_accessor :agent             # 1-* [ Provenance::Agent ]
      attr_accessor :entity            # 0-* [ Provenance::Entity ]
      attr_accessor :signature         # 0-* [ Signature ]

      def resourceType
        'Provenance'
      end
    end
  end
end