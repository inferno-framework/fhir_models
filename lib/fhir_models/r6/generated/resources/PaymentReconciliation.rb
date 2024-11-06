module FHIR
  module R6
    class PaymentReconciliation < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['allocation-account', 'allocation-encounter', 'created', 'disposition', 'identifier', 'outcome', 'payment-issuer', 'request', 'requestor', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'PaymentReconciliation.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'PaymentReconciliation.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'PaymentReconciliation.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'PaymentReconciliation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'PaymentReconciliation.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'PaymentReconciliation.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'PaymentReconciliation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/payment-type'=>['payment', 'adjustment', 'advance']}, 'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-type'}},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'PaymentReconciliation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'kind' => {'valid_codes'=>{'http://hl7.org/fhir/payment-kind'=>['deposit', 'periodic-payment', 'online', 'kiosk']}, 'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.kind', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-kind'}},
        'period' => {'type'=>'Period', 'path'=>'PaymentReconciliation.period', 'min'=>0, 'max'=>1},
        'created' => {'type'=>'dateTime', 'path'=>'PaymentReconciliation.created', 'min'=>1, 'max'=>1},
        'enterer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.enterer', 'min'=>0, 'max'=>1},
        'issuerType' => {'valid_codes'=>{'http://hl7.org/fhir/payment-issuertype'=>['patient', 'insurance']}, 'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.issuerType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-issuertype'}},
        'paymentIssuer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.paymentIssuer', 'min'=>0, 'max'=>1},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.request', 'min'=>0, 'max'=>1},
        'requestor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.requestor', 'min'=>0, 'max'=>1},
        'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/payment-outcome'=>['queued', 'complete', 'error', 'partial']}, 'type'=>'code', 'path'=>'PaymentReconciliation.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-outcome'}},
        'disposition' => {'type'=>'string', 'path'=>'PaymentReconciliation.disposition', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'date', 'path'=>'PaymentReconciliation.date', 'min'=>1, 'max'=>1},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'PaymentReconciliation.location', 'min'=>0, 'max'=>1},
        'method' => {'local_name'=>'local_method', 'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0570'=>['CASH', 'CCCA', 'CCHK', 'CDAC', 'CHCK', 'DDPO', 'DEBC', 'SWFT', 'TRAC', 'VISN']}, 'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0570'}},
        'cardBrand' => {'type'=>'string', 'path'=>'PaymentReconciliation.cardBrand', 'min'=>0, 'max'=>1},
        'accountNumber' => {'type'=>'string', 'path'=>'PaymentReconciliation.accountNumber', 'min'=>0, 'max'=>1},
        'expirationDate' => {'type'=>'date', 'path'=>'PaymentReconciliation.expirationDate', 'min'=>0, 'max'=>1},
        'processor' => {'type'=>'string', 'path'=>'PaymentReconciliation.processor', 'min'=>0, 'max'=>1},
        'referenceNumber' => {'type'=>'string', 'path'=>'PaymentReconciliation.referenceNumber', 'min'=>0, 'max'=>1},
        'authorization' => {'type'=>'string', 'path'=>'PaymentReconciliation.authorization', 'min'=>0, 'max'=>1},
        'tenderedAmount' => {'type'=>'Money', 'path'=>'PaymentReconciliation.tenderedAmount', 'min'=>0, 'max'=>1},
        'returnedAmount' => {'type'=>'Money', 'path'=>'PaymentReconciliation.returnedAmount', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Money', 'path'=>'PaymentReconciliation.amount', 'min'=>1, 'max'=>1},
        'paymentIdentifier' => {'type'=>'Identifier', 'path'=>'PaymentReconciliation.paymentIdentifier', 'min'=>0, 'max'=>1},
        'allocation' => {'type'=>'PaymentReconciliation::Allocation', 'path'=>'PaymentReconciliation.allocation', 'min'=>0, 'max'=>Float::INFINITY},
        'formCode' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/forms-codes'=>['1', '2']}, 'type'=>'CodeableConcept', 'path'=>'PaymentReconciliation.formCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
        'processNote' => {'type'=>'PaymentReconciliation::ProcessNote', 'path'=>'PaymentReconciliation.processNote', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Allocation < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'targetItem' => ['string', 'Identifier', 'positiveInt']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Allocation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Allocation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Allocation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Allocation.identifier', 'min'=>0, 'max'=>1},
          'predecessor' => {'type'=>'Identifier', 'path'=>'Allocation.predecessor', 'min'=>0, 'max'=>1},
          'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim', 'http://hl7.org/fhir/StructureDefinition/Account', 'http://hl7.org/fhir/StructureDefinition/Invoice', 'http://hl7.org/fhir/StructureDefinition/ChargeItem', 'http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'Allocation.target', 'min'=>0, 'max'=>1},
          'targetItemString' => {'type'=>'string', 'path'=>'Allocation.targetItem[x]', 'min'=>0, 'max'=>1},
          'targetItemIdentifier' => {'type'=>'Identifier', 'path'=>'Allocation.targetItem[x]', 'min'=>0, 'max'=>1},
          'targetItemPositiveInt' => {'type'=>'positiveInt', 'path'=>'Allocation.targetItem[x]', 'min'=>0, 'max'=>1},
          'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Allocation.encounter', 'min'=>0, 'max'=>1},
          'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'Allocation.account', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/payment-type'=>['payment', 'adjustment', 'advance']}, 'type'=>'CodeableConcept', 'path'=>'Allocation.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-type'}},
          'submitter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Allocation.submitter', 'min'=>0, 'max'=>1},
          'response' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Allocation.response', 'min'=>0, 'max'=>1},
          'date' => {'type'=>'date', 'path'=>'Allocation.date', 'min'=>0, 'max'=>1},
          'responsible' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Allocation.responsible', 'min'=>0, 'max'=>1},
          'payee' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Allocation.payee', 'min'=>0, 'max'=>1},
          'amount' => {'type'=>'Money', 'path'=>'Allocation.amount', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                    # 0-1 string
        attr_accessor :extension             # 0-* [ Extension ]
        attr_accessor :modifierExtension     # 0-* [ Extension ]
        attr_accessor :identifier            # 0-1 Identifier
        attr_accessor :predecessor           # 0-1 Identifier
        attr_accessor :target                # 0-1 Reference(Claim|Account|Invoice|ChargeItem|Encounter|Contract)
        attr_accessor :targetItemString      # 0-1 string
        attr_accessor :targetItemIdentifier  # 0-1 Identifier
        attr_accessor :targetItemPositiveInt # 0-1 positiveInt
        attr_accessor :encounter             # 0-1 Reference(Encounter)
        attr_accessor :account               # 0-1 Reference(Account)
        attr_accessor :type                  # 0-1 CodeableConcept
        attr_accessor :submitter             # 0-1 Reference(Practitioner|PractitionerRole|Organization)
        attr_accessor :response              # 0-1 Reference(ClaimResponse)
        attr_accessor :date                  # 0-1 date
        attr_accessor :responsible           # 0-1 Reference(PractitionerRole)
        attr_accessor :payee                 # 0-1 Reference(Practitioner|PractitionerRole|Organization)
        attr_accessor :amount                # 0-1 Money
      end

      class ProcessNote < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ProcessNote.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ProcessNote.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ProcessNote.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/note-type'=>['display', 'print', 'printoper']}, 'type'=>'code', 'path'=>'ProcessNote.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/note-type'}},
          'text' => {'type'=>'string', 'path'=>'ProcessNote.text', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 code
        attr_accessor :text              # 0-1 string
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
      attr_accessor :type              # 1-1 CodeableConcept
      attr_accessor :status            # 1-1 code
      attr_accessor :kind              # 0-1 CodeableConcept
      attr_accessor :period            # 0-1 Period
      attr_accessor :created           # 1-1 dateTime
      attr_accessor :enterer           # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :issuerType        # 0-1 CodeableConcept
      attr_accessor :paymentIssuer     # 0-1 Reference(Organization|Patient|RelatedPerson)
      attr_accessor :request           # 0-1 Reference(Task)
      attr_accessor :requestor         # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :outcome           # 0-1 code
      attr_accessor :disposition       # 0-1 string
      attr_accessor :date              # 1-1 date
      attr_accessor :location          # 0-1 Reference(Location)
      attr_accessor :local_method      # 0-1 CodeableConcept
      attr_accessor :cardBrand         # 0-1 string
      attr_accessor :accountNumber     # 0-1 string
      attr_accessor :expirationDate    # 0-1 date
      attr_accessor :processor         # 0-1 string
      attr_accessor :referenceNumber   # 0-1 string
      attr_accessor :authorization     # 0-1 string
      attr_accessor :tenderedAmount    # 0-1 Money
      attr_accessor :returnedAmount    # 0-1 Money
      attr_accessor :amount            # 1-1 Money
      attr_accessor :paymentIdentifier # 0-1 Identifier
      attr_accessor :allocation        # 0-* [ PaymentReconciliation::Allocation ]
      attr_accessor :formCode          # 0-1 CodeableConcept
      attr_accessor :processNote       # 0-* [ PaymentReconciliation::ProcessNote ]

      def resourceType
        'PaymentReconciliation'
      end
    end
  end
end