module FHIR
  module R6
    class Coverage < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['beneficiary', 'class-type', 'class-value', 'dependent', 'identifier', 'insurer', 'patient', 'paymentby-party', 'policy-holder', 'status', 'subscriber', 'subscriberid', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Coverage.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Coverage.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Coverage.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Coverage.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Coverage.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Coverage.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'Coverage.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'kind' => {'valid_codes'=>{'http://hl7.org/fhir/coverage-kind'=>['insurance', 'self-pay', 'other']}, 'type'=>'code', 'path'=>'Coverage.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-kind'}},
        'paymentBy' => {'type'=>'Coverage::PaymentBy', 'path'=>'Coverage.paymentBy', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/coverage-selfpay'=>['pay', 'payconc'], 'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['_ActCoverageTypeCode', '_ActInsurancePolicyCode', 'EHCPOL', 'HSAPOL', 'AUTOPOL', 'COL', 'UNINSMOT', 'PUBLICPOL', 'DENTPRG', 'DISEASEPRG', 'CANPRG', 'ENDRENAL', 'HIVAIDS', 'MANDPOL', 'MENTPRG', 'SAFNET', 'SUBPRG', 'SUBSIDIZ', 'SUBSIDMC', 'SUBSUPP', 'WCBPOL', '_ActInsuranceTypeCode', '_ActHealthInsuranceTypeCode', 'DENTAL', 'DISEASE', 'DRUGPOL', 'HIP', 'LTC', 'MCPOL', 'POS', 'HMO', 'PPO', 'MENTPOL', 'SUBPOL', 'VISPOL', 'DIS', 'EWB', 'FLEXP', 'LIFE', 'ANNU', 'TLIFE', 'ULIFE', 'PNC', 'REI', 'SURPL', 'UMBRL', '_ActProgramTypeCode', 'CHAR', 'CRIME', 'EAP', 'GOVEMP', 'HIRISK', 'IND', 'MILITARY', 'RETIRE', 'SOCIAL', 'VET']}, 'type'=>'CodeableConcept', 'path'=>'Coverage.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-type'}},
        'policyHolder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Coverage.policyHolder', 'min'=>0, 'max'=>1},
        'subscriber' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Coverage.subscriber', 'min'=>0, 'max'=>1},
        'subscriberId' => {'type'=>'Identifier', 'path'=>'Coverage.subscriberId', 'min'=>0, 'max'=>Float::INFINITY},
        'beneficiary' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Coverage.beneficiary', 'min'=>1, 'max'=>1},
        'dependent' => {'type'=>'string', 'path'=>'Coverage.dependent', 'min'=>0, 'max'=>1},
        'relationship' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/subscriber-relationship'=>['child', 'parent', 'spouse', 'common', 'other', 'self', 'injured']}, 'type'=>'CodeableConcept', 'path'=>'Coverage.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/subscriber-relationship'}},
        'period' => {'type'=>'Period', 'path'=>'Coverage.period', 'min'=>0, 'max'=>1},
        'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Coverage.insurer', 'min'=>0, 'max'=>1},
        'class' => {'local_name'=>'local_class', 'type'=>'Coverage::Class', 'path'=>'Coverage.class', 'min'=>0, 'max'=>Float::INFINITY},
        'order' => {'type'=>'positiveInt', 'path'=>'Coverage.order', 'min'=>0, 'max'=>1},
        'network' => {'type'=>'string', 'path'=>'Coverage.network', 'min'=>0, 'max'=>1},
        'costToBeneficiary' => {'type'=>'Coverage::CostToBeneficiary', 'path'=>'Coverage.costToBeneficiary', 'min'=>0, 'max'=>Float::INFINITY},
        'subrogation' => {'type'=>'boolean', 'path'=>'Coverage.subrogation', 'min'=>0, 'max'=>1},
        'contract' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'Coverage.contract', 'min'=>0, 'max'=>Float::INFINITY},
        'insurancePlan' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/InsurancePlan'], 'type'=>'Reference', 'path'=>'Coverage.insurancePlan', 'min'=>0, 'max'=>1}
      }

      class PaymentBy < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'PaymentBy.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'PaymentBy.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'PaymentBy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentBy.party', 'min'=>1, 'max'=>1},
          'responsibility' => {'type'=>'string', 'path'=>'PaymentBy.responsibility', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :party             # 1-1 Reference(Patient|RelatedPerson|Organization)
        attr_accessor :responsibility    # 0-1 string
      end

      class Class < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Class.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Class.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Class.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/coverage-class'=>['group', 'subgroup', 'plan', 'subplan', 'class', 'subclass', 'sequence', 'rxbin', 'rxpcn', 'rxid', 'rxgroup']}, 'type'=>'CodeableConcept', 'path'=>'Class.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-class'}},
          'value' => {'type'=>'Identifier', 'path'=>'Class.value', 'min'=>1, 'max'=>1},
          'name' => {'type'=>'string', 'path'=>'Class.name', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :value             # 1-1 Identifier
        attr_accessor :name              # 0-1 string
      end

      class CostToBeneficiary < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['Quantity', 'Money']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'CostToBeneficiary.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CostToBeneficiary.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'CostToBeneficiary.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/coverage-copay-type'=>['gpvisit', 'spvisit', 'emergency', 'inpthosp', 'televisit', 'urgentcare', 'copaypct', 'copay', 'deductible', 'maxoutofpocket']}, 'type'=>'CodeableConcept', 'path'=>'CostToBeneficiary.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-copay-type'}},
          'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-benefitcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'CostToBeneficiary.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory'}},
          'network' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/benefit-network'=>['in', 'out']}, 'type'=>'CodeableConcept', 'path'=>'CostToBeneficiary.network', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-network'}},
          'unit' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/benefit-unit'=>['individual', 'family']}, 'type'=>'CodeableConcept', 'path'=>'CostToBeneficiary.unit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-unit'}},
          'term' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/benefit-term'=>['annual', 'day', 'lifetime']}, 'type'=>'CodeableConcept', 'path'=>'CostToBeneficiary.term', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-term'}},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'CostToBeneficiary.value[x]', 'min'=>0, 'max'=>1},
          'valueMoney' => {'type'=>'Money', 'path'=>'CostToBeneficiary.value[x]', 'min'=>0, 'max'=>1},
          'exception' => {'type'=>'Coverage::CostToBeneficiary::Exception', 'path'=>'CostToBeneficiary.exception', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Exception < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Exception.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Exception.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Exception.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-coverage-financial-exception'=>['retired', 'foster']}, 'type'=>'CodeableConcept', 'path'=>'Exception.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/coverage-financial-exception'}},
            'period' => {'type'=>'Period', 'path'=>'Exception.period', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 1-1 CodeableConcept
          attr_accessor :period            # 0-1 Period
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :category          # 0-1 CodeableConcept
        attr_accessor :network           # 0-1 CodeableConcept
        attr_accessor :unit              # 0-1 CodeableConcept
        attr_accessor :term              # 0-1 CodeableConcept
        attr_accessor :valueQuantity     # 0-1 Quantity
        attr_accessor :valueMoney        # 0-1 Money
        attr_accessor :exception         # 0-* [ Coverage::CostToBeneficiary::Exception ]
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
      attr_accessor :kind              # 1-1 code
      attr_accessor :paymentBy         # 0-* [ Coverage::PaymentBy ]
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :policyHolder      # 0-1 Reference(Patient|RelatedPerson|Organization)
      attr_accessor :subscriber        # 0-1 Reference(Patient|RelatedPerson)
      attr_accessor :subscriberId      # 0-* [ Identifier ]
      attr_accessor :beneficiary       # 1-1 Reference(Patient)
      attr_accessor :dependent         # 0-1 string
      attr_accessor :relationship      # 0-1 CodeableConcept
      attr_accessor :period            # 0-1 Period
      attr_accessor :insurer           # 0-1 Reference(Organization)
      attr_accessor :local_class       # 0-* [ Coverage::Class ]
      attr_accessor :order             # 0-1 positiveInt
      attr_accessor :network           # 0-1 string
      attr_accessor :costToBeneficiary # 0-* [ Coverage::CostToBeneficiary ]
      attr_accessor :subrogation       # 0-1 boolean
      attr_accessor :contract          # 0-* [ Reference(Contract) ]
      attr_accessor :insurancePlan     # 0-1 Reference(InsurancePlan)

      def resourceType
        'Coverage'
      end
    end
  end
end