module FHIR
  module R6
    class AuditEvent < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'occurred' => ['Period', 'dateTime']
      }
      SEARCH_PARAMS = ['action', 'agent', 'agent-role', 'based-on', 'date', 'encounter', 'entity', 'entity-role', 'outcome', 'patient', 'policy', 'purpose', 'source', 'subtype', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'AuditEvent.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'AuditEvent.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'AuditEvent.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'AuditEvent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'AuditEvent.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'AuditEvent.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'AuditEvent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AuditEvent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://dicom.nema.org/resources/ontology/DCM'=>['110100', '110101', '110102', '110103', '110104', '110105', '110106', '110107', '110108', '110109', '110110', '110111', '110112', '110113', '110114'], 'http://terminology.hl7.org/CodeSystem/audit-event-type'=>['rest', 'hl7-v2', 'hl7-v3', 'document', 'object']}, 'type'=>'CodeableConcept', 'path'=>'AuditEvent.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-type'}},
        'subtype' => {'valid_codes'=>{'http://dicom.nema.org/resources/ontology/DCM'=>['110120', '110121', '110122', '110123', '110124', '110125', '110126', '110127', '110128', '110129', '110130', '110131', '110132', '110133', '110134', '110135', '110136', '110137', '110138', '110139', '110140', '110141', '110142', '110143', '110144', '110145', '110146', '110147'], 'http://hl7.org/fhir/restful-interaction'=>['read', 'vread', 'update', 'update-conditional', 'patch', 'patch-conditional', 'delete', 'delete-conditional-single', 'delete-conditional-multiple', 'delete-history', 'delete-history-version', 'history', 'history-instance', 'history-type', 'history-system', 'create', 'create-conditional', 'search', 'search-type', 'search-system', 'search-compartment', 'capabilities', 'transaction', 'batch', 'operation']}, 'type'=>'CodeableConcept', 'path'=>'AuditEvent.subtype', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-sub-type'}},
        'action' => {'valid_codes'=>{'http://hl7.org/fhir/audit-event-action'=>['C', 'R', 'U', 'D', 'E']}, 'type'=>'code', 'path'=>'AuditEvent.action', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-action'}},
        'severity' => {'valid_codes'=>{'http://hl7.org/fhir/audit-event-severity'=>['emergency', 'alert', 'critical', 'error', 'warning', 'notice', 'informational', 'debug']}, 'type'=>'code', 'path'=>'AuditEvent.severity', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-severity'}},
        'occurredPeriod' => {'type'=>'Period', 'path'=>'AuditEvent.occurred[x]', 'min'=>0, 'max'=>1},
        'occurredDateTime' => {'type'=>'dateTime', 'path'=>'AuditEvent.occurred[x]', 'min'=>0, 'max'=>1},
        'recorded' => {'type'=>'instant', 'path'=>'AuditEvent.recorded', 'min'=>1, 'max'=>1},
        'outcome' => {'type'=>'AuditEvent::Outcome', 'path'=>'AuditEvent.outcome', 'min'=>0, 'max'=>1},
        'authorization' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'CAREMGT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HDM', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'LABELING', 'METAMGT', 'MEMADMIN', 'MILCDM', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'SYSDEV', 'HTEST', 'TRAIN', 'MLTRAINING', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'MILDCRG', 'REMITADV', 'PMTDS', 'HRESCH', 'BIORCH', 'CLINTRCH', 'CLINTRCHNPC', 'CLINTRCHPC', 'PRECLINTRCH', 'DSRCH', 'POARCH', 'TRANSRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CLINTRL', 'COC', 'ETREAT', 'BTG', 'ERTREAT', 'POPHLTH', 'TREATDS']}, 'type'=>'CodeableConcept', 'path'=>'AuditEvent.authorization', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-PurposeOfUse'}},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'AuditEvent.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'AuditEvent.patient', 'min'=>0, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'AuditEvent.encounter', 'min'=>0, 'max'=>1},
        'agent' => {'type'=>'AuditEvent::Agent', 'path'=>'AuditEvent.agent', 'min'=>1, 'max'=>Float::INFINITY},
        'source' => {'type'=>'AuditEvent::Source', 'path'=>'AuditEvent.source', 'min'=>1, 'max'=>1},
        'entity' => {'type'=>'AuditEvent::Entity', 'path'=>'AuditEvent.entity', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Outcome < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Outcome.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Outcome.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Outcome.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/issue-severity'=>['fatal', 'error', 'warning', 'information', 'success']}, 'type'=>'Coding', 'path'=>'Outcome.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-outcome'}},
          'detail' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/operation-outcome'=>['DELETE_MULTIPLE_MATCHES', 'MSG_AUTH_REQUIRED', 'MSG_BAD_FORMAT', 'MSG_BAD_SYNTAX', 'MSG_CANT_PARSE_CONTENT', 'MSG_CANT_PARSE_ROOT', 'MSG_CREATED', 'MSG_DATE_FORMAT', 'MSG_DELETED', 'MSG_DELETED_DONE', 'MSG_DELETED_ID', 'MSG_DUPLICATE_ID', 'MSG_ERROR_PARSING', 'MSG_EXTERNAL_FAIL', 'MSG_ID_INVALID', 'MSG_ID_TOO_LONG', 'MSG_INVALID_ID', 'MSG_JSON_OBJECT', 'MSG_LOCAL_FAIL', 'MSG_NO_EXIST', 'MSG_NO_MATCH', 'MSG_NO_MODULE', 'MSG_NO_SUMMARY', 'MSG_OP_NOT_ALLOWED', 'MSG_PARAM_CHAINED', 'MSG_PARAM_INVALID', 'MSG_PARAM_MODIFIER_INVALID', 'MSG_PARAM_NO_REPEAT', 'MSG_PARAM_UNKNOWN', 'MSG_RESOURCE_EXAMPLE_PROTECTED', 'MSG_RESOURCE_ID_FAIL', 'MSG_RESOURCE_ID_MISMATCH', 'MSG_RESOURCE_ID_MISSING', 'MSG_RESOURCE_NOT_ALLOWED', 'MSG_RESOURCE_REQUIRED', 'MSG_RESOURCE_TYPE_MISMATCH', 'MSG_SORT_UNKNOWN', 'MSG_TRANSACTION_DUPLICATE_ID', 'MSG_TRANSACTION_MISSING_ID', 'MSG_UNHANDLED_NODE_TYPE', 'MSG_UNKNOWN_CONTENT', 'MSG_UNKNOWN_OPERATION', 'MSG_UNKNOWN_TYPE', 'MSG_UPDATED', 'MSG_VERSION_AWARE', 'MSG_VERSION_AWARE_CONFLICT', 'MSG_VERSION_AWARE_URL', 'MSG_WRONG_NS', 'SEARCH_MULTIPLE', 'SEARCH_NONE', 'UPDATE_MULTIPLE_MATCHES']}, 'type'=>'CodeableConcept', 'path'=>'Outcome.detail', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-event-outcome-detail'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 Coding
        attr_accessor :detail            # 0-* [ CodeableConcept ]
      end

      class Agent < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'network' => ['Reference', 'uri', 'string']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Agent.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Agent.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Agent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/provenance-participant-type'=>['enterer', 'performer', 'author', 'editor', 'verifier', 'legal', 'attester', 'informant', 'custodian', 'assembler', 'transformer', 'composer'], 'http://dicom.nema.org/resources/ontology/DCM'=>['110150', '110151', '110152', '110153', '110154', '110155'], 'http://terminology.hl7.org/CodeSystem/extra-security-role-type'=>['authserver', 'datacollector', 'dataprocessor', 'datasubject', 'humanuser']}, 'type'=>'CodeableConcept', 'path'=>'Agent.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/participation-role-type'}},
          'role' => {'valid_codes'=>{'http://hl7.org/fhir/sample-security-structural-roles'=>['regulated-health-professionals', 'general-medicine', 'general-nursing', 'dentist', 'veterinarian', 'pharmacy', 'dietician', 'pediatrics', 'non-regulated-health-professionals', 'receptionist', 'business-manager', 'transcriptionist', 'claims-adjudicator']}, 'type'=>'CodeableConcept', 'path'=>'Agent.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/security-role-type'}},
          'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Agent.who', 'min'=>1, 'max'=>1},
          'requestor' => {'type'=>'boolean', 'path'=>'Agent.requestor', 'min'=>0, 'max'=>1},
          'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Agent.location', 'min'=>0, 'max'=>1},
          'policy' => {'type'=>'uri', 'path'=>'Agent.policy', 'min'=>0, 'max'=>Float::INFINITY},
          'networkReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Agent.network[x]', 'min'=>0, 'max'=>1},
          'networkUri' => {'type'=>'uri', 'path'=>'Agent.network[x]', 'min'=>0, 'max'=>1},
          'networkString' => {'type'=>'string', 'path'=>'Agent.network[x]', 'min'=>0, 'max'=>1},
          'authorization' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'CAREMGT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HDM', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'LABELING', 'METAMGT', 'MEMADMIN', 'MILCDM', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'SYSDEV', 'HTEST', 'TRAIN', 'MLTRAINING', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'MILDCRG', 'REMITADV', 'PMTDS', 'HRESCH', 'BIORCH', 'CLINTRCH', 'CLINTRCHNPC', 'CLINTRCHPC', 'PRECLINTRCH', 'DSRCH', 'POARCH', 'TRANSRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CLINTRL', 'COC', 'ETREAT', 'BTG', 'ERTREAT', 'POPHLTH', 'TREATDS']}, 'type'=>'CodeableConcept', 'path'=>'Agent.authorization', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-PurposeOfUse'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :role              # 0-* [ CodeableConcept ]
        attr_accessor :who               # 1-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Device|RelatedPerson)
        attr_accessor :requestor         # 0-1 boolean
        attr_accessor :location          # 0-1 Reference(Location)
        attr_accessor :policy            # 0-* [ uri ]
        attr_accessor :networkReference  # 0-1 Reference(Endpoint)
        attr_accessor :networkUri        # 0-1 uri
        attr_accessor :networkString     # 0-1 string
        attr_accessor :authorization     # 0-* [ CodeableConcept ]
      end

      class Source < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Source.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Source.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Source.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'site' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Source.site', 'min'=>0, 'max'=>1},
          'observer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Source.observer', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/security-source-type'=>['1', '2', '3', '4', '5', '6', '7', '8']}, 'type'=>'CodeableConcept', 'path'=>'Source.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/security-source-type'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :site              # 0-1 Reference(Location)
        attr_accessor :observer          # 1-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Device|RelatedPerson)
        attr_accessor :type              # 0-* [ CodeableConcept ]
      end

      class Entity < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Entity.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Entity.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Entity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'what' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Entity.what', 'min'=>0, 'max'=>1},
          'role' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/object-role'=>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24']}, 'type'=>'CodeableConcept', 'path'=>'Entity.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/object-role'}},
          'securityLabel' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-Confidentiality'=>['N', 'R'], 'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['ETH', 'PSY', 'STD', 'NOAUTH', 'DELAU', 'NORDSCLCD'], 'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['TREAT', 'HPAYMT', 'ETREAT']}, 'type'=>'CodeableConcept', 'path'=>'Entity.securityLabel', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/security-label-examples'}},
          'query' => {'type'=>'base64Binary', 'path'=>'Entity.query', 'min'=>0, 'max'=>1},
          'detail' => {'type'=>'AuditEvent::Entity::Detail', 'path'=>'Entity.detail', 'min'=>0, 'max'=>Float::INFINITY},
          'agent' => {'type'=>'AuditEvent::Agent', 'path'=>'Entity.agent', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Detail < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'value' => ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Ratio', 'time', 'dateTime', 'Period', 'base64Binary']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/audit-entity-detail-type'=>['orientation', 'spin']}, 'type'=>'CodeableConcept', 'path'=>'Detail.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/audit-entity-detail-type'}},
            'valueQuantity' => {'type'=>'Quantity', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueString' => {'type'=>'string', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueBoolean' => {'type'=>'boolean', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueInteger' => {'type'=>'integer', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueRange' => {'type'=>'Range', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueRatio' => {'type'=>'Ratio', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueTime' => {'type'=>'time', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueDateTime' => {'type'=>'dateTime', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valuePeriod' => {'type'=>'Period', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1},
            'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Detail.value[x]', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :type                 # 1-1 CodeableConcept
          attr_accessor :valueQuantity        # 1-1 Quantity
          attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
          attr_accessor :valueString          # 1-1 string
          attr_accessor :valueBoolean         # 1-1 boolean
          attr_accessor :valueInteger         # 1-1 integer
          attr_accessor :valueRange           # 1-1 Range
          attr_accessor :valueRatio           # 1-1 Ratio
          attr_accessor :valueTime            # 1-1 time
          attr_accessor :valueDateTime        # 1-1 dateTime
          attr_accessor :valuePeriod          # 1-1 Period
          attr_accessor :valueBase64Binary    # 1-1 base64Binary
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :what              # 0-1 Reference(Resource)
        attr_accessor :role              # 0-1 CodeableConcept
        attr_accessor :securityLabel     # 0-* [ CodeableConcept ]
        attr_accessor :query             # 0-1 base64Binary
        attr_accessor :detail            # 0-* [ AuditEvent::Entity::Detail ]
        attr_accessor :agent             # 0-* [ AuditEvent::Agent ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :subtype           # 0-* [ CodeableConcept ]
      attr_accessor :action            # 0-1 code
      attr_accessor :severity          # 0-1 code
      attr_accessor :occurredPeriod    # 0-1 Period
      attr_accessor :occurredDateTime  # 0-1 dateTime
      attr_accessor :recorded          # 1-1 instant
      attr_accessor :outcome           # 0-1 AuditEvent::Outcome
      attr_accessor :authorization     # 0-* [ CodeableConcept ]
      attr_accessor :basedOn           # 0-* [ Reference(Resource) ]
      attr_accessor :patient           # 0-1 Reference(Patient)
      attr_accessor :encounter         # 0-1 Reference(Encounter)
      attr_accessor :agent             # 1-* [ AuditEvent::Agent ]
      attr_accessor :source            # 1-1 AuditEvent::Source
      attr_accessor :entity            # 0-* [ AuditEvent::Entity ]

      def resourceType
        'AuditEvent'
      end
    end
  end
end