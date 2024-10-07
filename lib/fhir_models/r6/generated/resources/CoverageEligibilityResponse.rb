module FHIR
  module build.fhir.org
    class CoverageEligibilityResponse < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'serviced' => ['date', 'Period']
      }
      SEARCH_PARAMS = ['created', 'disposition', 'identifier', 'insurer', 'outcome', 'patient', 'request', 'requestor', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'CoverageEligibilityResponse.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'CoverageEligibilityResponse.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'CoverageEligibilityResponse.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'CoverageEligibilityResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'CoverageEligibilityResponse.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'CoverageEligibilityResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'CoverageEligibilityResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'CoverageEligibilityResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'CoverageEligibilityResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'CoverageEligibilityResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'purpose' => {'valid_codes'=>{'http://hl7.org/fhir/eligibilityresponse-purpose'=>['auth-requirements', 'benefits', 'discovery', 'validation']}, 'type'=>'code', 'path'=>'CoverageEligibilityResponse.purpose', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/eligibilityresponse-purpose'}},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'CoverageEligibilityResponse.patient', 'min'=>1, 'max'=>1},
        'event' => {'type'=>'CoverageEligibilityResponse::Event', 'path'=>'CoverageEligibilityResponse.event', 'min'=>0, 'max'=>Float::INFINITY},
        'servicedDate' => {'type'=>'date', 'path'=>'CoverageEligibilityResponse.serviced[x]', 'min'=>0, 'max'=>1},
        'servicedPeriod' => {'type'=>'Period', 'path'=>'CoverageEligibilityResponse.serviced[x]', 'min'=>0, 'max'=>1},
        'created' => {'type'=>'dateTime', 'path'=>'CoverageEligibilityResponse.created', 'min'=>1, 'max'=>1},
        'requestor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'CoverageEligibilityResponse.requestor', 'min'=>0, 'max'=>1},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CoverageEligibilityRequest'], 'type'=>'Reference', 'path'=>'CoverageEligibilityResponse.request', 'min'=>1, 'max'=>1},
        'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/eligibility-outcome'=>['queued', 'complete', 'error', 'partial']}, 'type'=>'code', 'path'=>'CoverageEligibilityResponse.outcome', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/eligibility-outcome'}},
        'disposition' => {'type'=>'string', 'path'=>'CoverageEligibilityResponse.disposition', 'min'=>0, 'max'=>1},
        'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'CoverageEligibilityResponse.insurer', 'min'=>1, 'max'=>1},
        'insurance' => {'type'=>'CoverageEligibilityResponse::Insurance', 'path'=>'CoverageEligibilityResponse.insurance', 'min'=>0, 'max'=>Float::INFINITY},
        'preAuthRef' => {'type'=>'string', 'path'=>'CoverageEligibilityResponse.preAuthRef', 'min'=>0, 'max'=>1},
        'form' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/forms-codes'=>['1', '2']}, 'type'=>'CodeableConcept', 'path'=>'CoverageEligibilityResponse.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
        'error' => {'type'=>'CoverageEligibilityResponse::Error', 'path'=>'CoverageEligibilityResponse.error', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Event < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'when' => ['dateTime', 'Period']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Event.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Event.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Event.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/datestype'=>['card-issued', 'claim-received', 'service-expected']}, 'type'=>'CodeableConcept', 'path'=>'Event.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/datestype'}},
          'whenDateTime' => {'type'=>'dateTime', 'path'=>'Event.when[x]', 'min'=>1, 'max'=>1},
          'whenPeriod' => {'type'=>'Period', 'path'=>'Event.when[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :whenDateTime      # 1-1 dateTime
        attr_accessor :whenPeriod        # 1-1 Period
      end

      class Insurance < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Insurance.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Insurance.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Insurance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Insurance.coverage', 'min'=>1, 'max'=>1},
          'inforce' => {'type'=>'boolean', 'path'=>'Insurance.inforce', 'min'=>0, 'max'=>1},
          'benefitPeriod' => {'type'=>'Period', 'path'=>'Insurance.benefitPeriod', 'min'=>0, 'max'=>1},
          'item' => {'type'=>'CoverageEligibilityResponse::Insurance::Item', 'path'=>'Insurance.item', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Item < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-benefitcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'Item.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory'}},
            'productOrService' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Item.productOrService', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'modifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/modifiers'=>['a', 'b', 'c', 'e', 'rooh', 'x']}, 'type'=>'CodeableConcept', 'path'=>'Item.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
            'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Item.provider', 'min'=>0, 'max'=>1},
            'excluded' => {'type'=>'boolean', 'path'=>'Item.excluded', 'min'=>0, 'max'=>1},
            'name' => {'type'=>'string', 'path'=>'Item.name', 'min'=>0, 'max'=>1},
            'description' => {'type'=>'string', 'path'=>'Item.description', 'min'=>0, 'max'=>1},
            'network' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/benefit-network'=>['in', 'out']}, 'type'=>'CodeableConcept', 'path'=>'Item.network', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-network'}},
            'unit' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/benefit-unit'=>['individual', 'family']}, 'type'=>'CodeableConcept', 'path'=>'Item.unit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-unit'}},
            'term' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/benefit-term'=>['annual', 'day', 'lifetime']}, 'type'=>'CodeableConcept', 'path'=>'Item.term', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-term'}},
            'benefit' => {'type'=>'CoverageEligibilityResponse::Insurance::Item::Benefit', 'path'=>'Item.benefit', 'min'=>0, 'max'=>Float::INFINITY},
            'authorizationRequired' => {'type'=>'boolean', 'path'=>'Item.authorizationRequired', 'min'=>0, 'max'=>1},
            'authorizationSupporting' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/coverageeligibilityresponse-ex-auth-support'=>['laborder', 'labreport', 'diagnosticimageorder', 'diagnosticimagereport', 'professionalreport', 'accidentreport', 'model', 'picture']}, 'type'=>'CodeableConcept', 'path'=>'Item.authorizationSupporting', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/coverageeligibilityresponse-ex-auth-support'}},
            'authorizationUrl' => {'type'=>'uri', 'path'=>'Item.authorizationUrl', 'min'=>0, 'max'=>1}
          }

          class Benefit < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'allowed' => ['unsignedInt', 'string', 'Money'],
              'used' => ['unsignedInt', 'string', 'Money']
            }
            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Benefit.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Benefit.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Benefit.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/benefit-type'=>['benefit', 'deductible', 'visit', 'room', 'copay', 'copay-percent', 'copay-maximum', 'vision-exam', 'vision-glasses', 'vision-contacts', 'medical-primarycare', 'pharmacy-dispense']}, 'type'=>'CodeableConcept', 'path'=>'Benefit.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/benefit-type'}},
              'allowedUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Benefit.allowed[x]', 'min'=>0, 'max'=>1},
              'allowedString' => {'type'=>'string', 'path'=>'Benefit.allowed[x]', 'min'=>0, 'max'=>1},
              'allowedMoney' => {'type'=>'Money', 'path'=>'Benefit.allowed[x]', 'min'=>0, 'max'=>1},
              'usedUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Benefit.used[x]', 'min'=>0, 'max'=>1},
              'usedString' => {'type'=>'string', 'path'=>'Benefit.used[x]', 'min'=>0, 'max'=>1},
              'usedMoney' => {'type'=>'Money', 'path'=>'Benefit.used[x]', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                 # 0-1 string
            attr_accessor :extension          # 0-* [ Extension ]
            attr_accessor :modifierExtension  # 0-* [ Extension ]
            attr_accessor :type               # 1-1 CodeableConcept
            attr_accessor :allowedUnsignedInt # 0-1 unsignedInt
            attr_accessor :allowedString      # 0-1 string
            attr_accessor :allowedMoney       # 0-1 Money
            attr_accessor :usedUnsignedInt    # 0-1 unsignedInt
            attr_accessor :usedString         # 0-1 string
            attr_accessor :usedMoney          # 0-1 Money
          end

          attr_accessor :id                      # 0-1 string
          attr_accessor :extension               # 0-* [ Extension ]
          attr_accessor :modifierExtension       # 0-* [ Extension ]
          attr_accessor :category                # 0-1 CodeableConcept
          attr_accessor :productOrService        # 0-1 CodeableConcept
          attr_accessor :modifier                # 0-* [ CodeableConcept ]
          attr_accessor :provider                # 0-1 Reference(Practitioner|PractitionerRole)
          attr_accessor :excluded                # 0-1 boolean
          attr_accessor :name                    # 0-1 string
          attr_accessor :description             # 0-1 string
          attr_accessor :network                 # 0-1 CodeableConcept
          attr_accessor :unit                    # 0-1 CodeableConcept
          attr_accessor :term                    # 0-1 CodeableConcept
          attr_accessor :benefit                 # 0-* [ CoverageEligibilityResponse::Insurance::Item::Benefit ]
          attr_accessor :authorizationRequired   # 0-1 boolean
          attr_accessor :authorizationSupporting # 0-* [ CodeableConcept ]
          attr_accessor :authorizationUrl        # 0-1 uri
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :coverage          # 1-1 Reference(Coverage)
        attr_accessor :inforce           # 0-1 boolean
        attr_accessor :benefitPeriod     # 0-1 Period
        attr_accessor :item              # 0-* [ CoverageEligibilityResponse::Insurance::Item ]
      end

      class Error < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Error.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Error.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Error.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adjudication-error'=>['a001', 'a002']}, 'type'=>'CodeableConcept', 'path'=>'Error.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-error'}},
          'expression' => {'type'=>'string', 'path'=>'Error.expression', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 CodeableConcept
        attr_accessor :expression        # 0-* [ string ]
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
      attr_accessor :purpose           # 1-* [ code ]
      attr_accessor :patient           # 1-1 Reference(Patient)
      attr_accessor :event             # 0-* [ CoverageEligibilityResponse::Event ]
      attr_accessor :servicedDate      # 0-1 date
      attr_accessor :servicedPeriod    # 0-1 Period
      attr_accessor :created           # 1-1 dateTime
      attr_accessor :requestor         # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :request           # 1-1 Reference(CoverageEligibilityRequest)
      attr_accessor :outcome           # 1-1 code
      attr_accessor :disposition       # 0-1 string
      attr_accessor :insurer           # 1-1 Reference(Organization)
      attr_accessor :insurance         # 0-* [ CoverageEligibilityResponse::Insurance ]
      attr_accessor :preAuthRef        # 0-1 string
      attr_accessor :form              # 0-1 CodeableConcept
      attr_accessor :error             # 0-* [ CoverageEligibilityResponse::Error ]

      def resourceType
        'CoverageEligibilityResponse'
      end
    end
  end
end