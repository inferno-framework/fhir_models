module FHIR
  module R6
    class Permission < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['identifier', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Permission.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Permission.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Permission.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Permission.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Permission.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Permission.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Permission.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Permission.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Permission.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/permission-status'=>['active', 'entered-in-error', 'draft', 'rejected']}, 'type'=>'code', 'path'=>'Permission.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/permission-status'}},
        'asserter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'Permission.asserter', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'Permission.date', 'min'=>0, 'max'=>Float::INFINITY},
        'validity' => {'type'=>'Period', 'path'=>'Permission.validity', 'min'=>0, 'max'=>1},
        'justification' => {'type'=>'Permission::Justification', 'path'=>'Permission.justification', 'min'=>0, 'max'=>1},
        'combining' => {'valid_codes'=>{'http://hl7.org/fhir/permission-rule-combining'=>['deny-overrides', 'permit-overrides', 'ordered-deny-overrides', 'ordered-permit-overrides', 'deny-unless-permit', 'permit-unless-deny']}, 'type'=>'code', 'path'=>'Permission.combining', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/permission-rule-combining'}},
        'rule' => {'type'=>'Permission::Rule', 'path'=>'Permission.rule', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Justification < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Justification.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Justification.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Justification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'basis' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/consentpolicycodes'=>['cric', 'illinois-minor-procedure', 'hipaa-auth', 'hipaa-npp', 'hipaa-restrictions', 'hipaa-research', 'hipaa-self-pay', 'mdhhs-5515', 'nyssipp', 'va-10-0484', 'va-10-0485', 'va-10-5345', 'va-10-5345a', 'va-10-5345a-mhv', 'va-10-10116', 'va-21-4142', 'ssa-827', 'dch-3927', 'squaxin', 'nl-lsp', 'at-elga', 'nih-hipaa', 'nci', 'nih-grdr', 'nih-527', 'ga4gh', 'ch-epr']}, 'type'=>'CodeableConcept', 'path'=>'Justification.basis', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-policy'}},
          'evidence' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Justification.evidence', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :basis             # 0-* [ CodeableConcept ]
        attr_accessor :evidence          # 0-* [ Reference(Resource) ]
      end

      class Rule < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/consent-provision-type'=>['deny', 'permit']}, 'type'=>'code', 'path'=>'Rule.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-provision-type'}},
          'data' => {'type'=>'Permission::Rule::Data', 'path'=>'Rule.data', 'min'=>0, 'max'=>Float::INFINITY},
          'activity' => {'type'=>'Permission::Rule::Activity', 'path'=>'Rule.activity', 'min'=>0, 'max'=>Float::INFINITY},
          'limit' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['TREAT', 'HPAYMT', 'ETREAT'], 'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['NOAUTH', 'DELAU', 'NORDSCLCD']}, 'type'=>'CodeableConcept', 'path'=>'Rule.limit', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/security-label-event-examples'}}
        }

        class Data < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Data.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Data.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Data.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'resource' => {'type'=>'Permission::Rule::Data::Resource', 'path'=>'Data.resource', 'min'=>0, 'max'=>Float::INFINITY},
            'security' => {'type'=>'Coding', 'path'=>'Data.security', 'min'=>0, 'max'=>Float::INFINITY},
            'period' => {'type'=>'Period', 'path'=>'Data.period', 'min'=>0, 'max'=>1},
            'expression' => {'type'=>'Expression', 'path'=>'Data.expression', 'min'=>0, 'max'=>1}
          }

          class Resource < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Resource.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Resource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'meaning' => {'valid_codes'=>{'http://hl7.org/fhir/consent-data-meaning'=>['instance', 'related', 'dependents', 'authoredby']}, 'type'=>'code', 'path'=>'Resource.meaning', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-data-meaning'}},
              'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Resource.reference', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :meaning           # 1-1 code
            attr_accessor :reference         # 1-1 Reference(Resource)
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :resource          # 0-* [ Permission::Rule::Data::Resource ]
          attr_accessor :security          # 0-* [ Coding ]
          attr_accessor :period            # 0-1 Period
          attr_accessor :expression        # 0-1 Expression
        end

        class Activity < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Activity.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Activity.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Activity.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Activity.actor', 'min'=>0, 'max'=>Float::INFINITY},
            'action' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/consentaction'=>['collect', 'access', 'use', 'disclose', 'correct']}, 'type'=>'CodeableConcept', 'path'=>'Activity.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-action'}},
            'purpose' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'CAREMGT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HDM', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'LABELING', 'METAMGT', 'MEMADMIN', 'MILCDM', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'SYSDEV', 'HTEST', 'TRAIN', 'MLTRAINING', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'MILDCRG', 'REMITADV', 'PMTDS', 'HRESCH', 'BIORCH', 'CLINTRCH', 'CLINTRCHNPC', 'CLINTRCHPC', 'PRECLINTRCH', 'DSRCH', 'POARCH', 'TRANSRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CLINTRL', 'COC', 'ETREAT', 'BTG', 'ERTREAT', 'POPHLTH', 'TREATDS']}, 'type'=>'CodeableConcept', 'path'=>'Activity.purpose', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-PurposeOfUse'}}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :actor             # 0-* [ Reference(Device|Group|CareTeam|Organization|Patient|Practitioner|RelatedPerson|PractitionerRole) ]
          attr_accessor :action            # 0-* [ CodeableConcept ]
          attr_accessor :purpose           # 0-* [ CodeableConcept ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 code
        attr_accessor :data              # 0-* [ Permission::Rule::Data ]
        attr_accessor :activity          # 0-* [ Permission::Rule::Activity ]
        attr_accessor :limit             # 0-* [ CodeableConcept ]
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
      attr_accessor :status            # 1-1 code
      attr_accessor :asserter          # 0-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|RelatedPerson|HealthcareService)
      attr_accessor :date              # 0-* [ dateTime ]
      attr_accessor :validity          # 0-1 Period
      attr_accessor :justification     # 0-1 Permission::Justification
      attr_accessor :combining         # 1-1 code
      attr_accessor :rule              # 0-* [ Permission::Rule ]

      def resourceType
        'Permission'
      end
    end
  end
end