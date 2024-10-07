module FHIR
  module R6
    class Account < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['guarantor', 'identifier', 'name', 'owner', 'patient', 'period', 'relatedaccount', 'status', 'subject', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Account.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Account.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Account.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Account.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Account.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Account.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Account.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Account.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Account.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/account-status'=>['active', 'inactive', 'entered-in-error', 'on-hold', 'unknown']}, 'type'=>'code', 'path'=>'Account.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/account-status'}},
        'billingStatus' => {'valid_codes'=>{'http://hl7.org/fhir/account-billing-status'=>['open', 'carecomplete-notbilled', 'billing', 'closed-baddebt', 'closed-voided', 'closed-completed', 'closed-combined']}, 'type'=>'CodeableConcept', 'path'=>'Account.billingStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/account-billing-status'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['_ActAccountCode', 'ACCTRECEIVABLE', 'CASH', 'CC', 'AE', 'DN', 'DV', 'MC', 'V', 'PBILLACCT', '_CreditCard']}, 'type'=>'CodeableConcept', 'path'=>'Account.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/account-type'}},
        'name' => {'type'=>'string', 'path'=>'Account.name', 'min'=>0, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Account.subject', 'min'=>0, 'max'=>Float::INFINITY},
        'servicePeriod' => {'type'=>'Period', 'path'=>'Account.servicePeriod', 'min'=>0, 'max'=>1},
        'covers' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter', 'http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'Account.covers', 'min'=>0, 'max'=>Float::INFINITY},
        'coverage' => {'type'=>'Account::Coverage', 'path'=>'Account.coverage', 'min'=>0, 'max'=>Float::INFINITY},
        'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Account.owner', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'markdown', 'path'=>'Account.description', 'min'=>0, 'max'=>1},
        'guarantor' => {'type'=>'Account::Guarantor', 'path'=>'Account.guarantor', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosis' => {'type'=>'Account::Diagnosis', 'path'=>'Account.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
        'procedure' => {'type'=>'Account::Procedure', 'path'=>'Account.procedure', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedAccount' => {'type'=>'Account::RelatedAccount', 'path'=>'Account.relatedAccount', 'min'=>0, 'max'=>Float::INFINITY},
        'currency' => {'valid_codes'=>{'urn:iso:std:iso:4217'=>['AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHE', 'CHF', 'CHW', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CUC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GGP', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'IMP', 'INR', 'IQD', 'IRR', 'ISK', 'JEP', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TVD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'UYI', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XDR', 'XOF', 'XPD', 'XPF', 'XPT', 'XSU', 'XTS', 'XUA', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWL']}, 'type'=>'CodeableConcept', 'path'=>'Account.currency', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/currencies'}},
        'balance' => {'type'=>'Account::Balance', 'path'=>'Account.balance', 'min'=>0, 'max'=>Float::INFINITY},
        'calculatedAt' => {'type'=>'instant', 'path'=>'Account.calculatedAt', 'min'=>0, 'max'=>1}
      }

      class Coverage < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Coverage.coverage', 'min'=>1, 'max'=>1},
          'priority' => {'type'=>'positiveInt', 'path'=>'Coverage.priority', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :coverage          # 1-1 Reference(Coverage)
        attr_accessor :priority          # 0-1 positiveInt
      end

      class Guarantor < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Guarantor.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Guarantor.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Guarantor.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Guarantor.party', 'min'=>1, 'max'=>1},
          'onHold' => {'type'=>'boolean', 'path'=>'Guarantor.onHold', 'min'=>0, 'max'=>1},
          'period' => {'type'=>'Period', 'path'=>'Guarantor.period', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :party             # 1-1 Reference(Patient|RelatedPerson|Organization)
        attr_accessor :onHold            # 0-1 boolean
        attr_accessor :period            # 0-1 Period
      end

      class Diagnosis < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Diagnosis.sequence', 'min'=>0, 'max'=>1},
          'condition' => {'type'=>'CodeableReference', 'path'=>'Diagnosis.condition', 'min'=>1, 'max'=>1},
          'dateOfDiagnosis' => {'type'=>'dateTime', 'path'=>'Diagnosis.dateOfDiagnosis', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-diagnosis-use'=>['working', 'final']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-diagnosis-use'}},
          'onAdmission' => {'type'=>'boolean', 'path'=>'Diagnosis.onAdmission', 'min'=>0, 'max'=>1},
          'packageCode' => {'type'=>'CodeableConcept', 'path'=>'Diagnosis.packageCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequence          # 0-1 positiveInt
        attr_accessor :condition         # 1-1 CodeableReference
        attr_accessor :dateOfDiagnosis   # 0-1 dateTime
        attr_accessor :type              # 0-* [ CodeableConcept ]
        attr_accessor :onAdmission       # 0-1 boolean
        attr_accessor :packageCode       # 0-* [ CodeableConcept ]
      end

      class Procedure < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Procedure.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Procedure.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Procedure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Procedure.sequence', 'min'=>0, 'max'=>1},
          'code' => {'type'=>'CodeableReference', 'path'=>'Procedure.code', 'min'=>1, 'max'=>1},
          'dateOfService' => {'type'=>'dateTime', 'path'=>'Procedure.dateOfService', 'min'=>0, 'max'=>1},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Procedure.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example'}},
          'packageCode' => {'type'=>'CodeableConcept', 'path'=>'Procedure.packageCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example'}},
          'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Procedure.device', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequence          # 0-1 positiveInt
        attr_accessor :code              # 1-1 CodeableReference
        attr_accessor :dateOfService     # 0-1 dateTime
        attr_accessor :type              # 0-* [ CodeableConcept ]
        attr_accessor :packageCode       # 0-* [ CodeableConcept ]
        attr_accessor :device            # 0-* [ Reference(Device) ]
      end

      class RelatedAccount < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'RelatedAccount.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'RelatedAccount.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedAccount.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/account-relationship'=>['parent', 'guarantor']}, 'type'=>'CodeableConcept', 'path'=>'RelatedAccount.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/account-relationship'}},
          'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'RelatedAccount.account', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :relationship      # 0-1 CodeableConcept
        attr_accessor :account           # 1-1 Reference(Account)
      end

      class Balance < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Balance.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Balance.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Balance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'aggregate' => {'valid_codes'=>{'http://hl7.org/fhir/account-aggregate'=>['patient', 'insurance', 'total']}, 'type'=>'CodeableConcept', 'path'=>'Balance.aggregate', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/account-aggregate'}},
          'term' => {'valid_codes'=>{'http://hl7.org/fhir/account-balance-term'=>['current', '30', '60', '90', '120']}, 'type'=>'CodeableConcept', 'path'=>'Balance.term', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/account-balance-term'}},
          'estimate' => {'type'=>'boolean', 'path'=>'Balance.estimate', 'min'=>0, 'max'=>1},
          'amount' => {'type'=>'Money', 'path'=>'Balance.amount', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :aggregate         # 0-1 CodeableConcept
        attr_accessor :term              # 0-1 CodeableConcept
        attr_accessor :estimate          # 0-1 boolean
        attr_accessor :amount            # 1-1 Money
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
      attr_accessor :billingStatus     # 0-1 CodeableConcept
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :name              # 0-1 string
      attr_accessor :subject           # 0-* [ Reference(Patient|Device|Practitioner|PractitionerRole|Location|HealthcareService|Organization) ]
      attr_accessor :servicePeriod     # 0-1 Period
      attr_accessor :covers            # 0-* [ Reference(Encounter|EpisodeOfCare) ]
      attr_accessor :coverage          # 0-* [ Account::Coverage ]
      attr_accessor :owner             # 0-1 Reference(Organization)
      attr_accessor :description       # 0-1 markdown
      attr_accessor :guarantor         # 0-* [ Account::Guarantor ]
      attr_accessor :diagnosis         # 0-* [ Account::Diagnosis ]
      attr_accessor :procedure         # 0-* [ Account::Procedure ]
      attr_accessor :relatedAccount    # 0-* [ Account::RelatedAccount ]
      attr_accessor :currency          # 0-1 CodeableConcept
      attr_accessor :balance           # 0-* [ Account::Balance ]
      attr_accessor :calculatedAt      # 0-1 instant

      def resourceType
        'Account'
      end
    end
  end
end