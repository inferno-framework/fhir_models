module FHIR
  module R6
    class ClaimResponse < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['created', 'disposition', 'identifier', 'insurer', 'outcome', 'patient', 'payment-date', 'request', 'requestor', 'status', 'use']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ClaimResponse.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ClaimResponse.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ClaimResponse.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ClaimResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ClaimResponse.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ClaimResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ClaimResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ClaimResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'ClaimResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'traceNumber' => {'type'=>'Identifier', 'path'=>'ClaimResponse.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'ClaimResponse.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/claim-type'=>['institutional', 'oral', 'pharmacy', 'professional', 'vision']}, 'type'=>'CodeableConcept', 'path'=>'ClaimResponse.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-type'}},
        'subType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-claimsubtype'=>['ortho', 'emergency']}, 'type'=>'CodeableConcept', 'path'=>'ClaimResponse.subType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-subtype'}},
        'use' => {'valid_codes'=>{'http://hl7.org/fhir/claim-use'=>['claim', 'preauthorization', 'predetermination']}, 'type'=>'code', 'path'=>'ClaimResponse.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-use'}},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ClaimResponse.patient', 'min'=>1, 'max'=>1},
        'created' => {'type'=>'dateTime', 'path'=>'ClaimResponse.created', 'min'=>1, 'max'=>1},
        'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ClaimResponse.insurer', 'min'=>0, 'max'=>1},
        'requestor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ClaimResponse.requestor', 'min'=>0, 'max'=>1},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'ClaimResponse.request', 'min'=>0, 'max'=>1},
        'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/claim-outcome'=>['queued', 'complete', 'error', 'partial']}, 'type'=>'code', 'path'=>'ClaimResponse.outcome', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-outcome'}},
        'decision' => {'valid_codes'=>{'http://hl7.org/fhir/claim-decision'=>['denied', 'approved', 'partial', 'pending']}, 'type'=>'CodeableConcept', 'path'=>'ClaimResponse.decision', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-decision'}},
        'disposition' => {'type'=>'string', 'path'=>'ClaimResponse.disposition', 'min'=>0, 'max'=>1},
        'preAuthRef' => {'type'=>'string', 'path'=>'ClaimResponse.preAuthRef', 'min'=>0, 'max'=>1},
        'preAuthPeriod' => {'type'=>'Period', 'path'=>'ClaimResponse.preAuthPeriod', 'min'=>0, 'max'=>1},
        'event' => {'type'=>'ClaimResponse::Event', 'path'=>'ClaimResponse.event', 'min'=>0, 'max'=>Float::INFINITY},
        'payeeType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/payeetype'=>['subscriber', 'provider', 'beneficiary', 'other']}, 'type'=>'CodeableConcept', 'path'=>'ClaimResponse.payeeType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payeetype'}},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'ClaimResponse.encounter', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosisRelatedGroup' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup'=>['100', '101', '300', '400']}, 'type'=>'CodeableConcept', 'path'=>'ClaimResponse.diagnosisRelatedGroup', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosisrelatedgroup'}},
        'item' => {'type'=>'ClaimResponse::Item', 'path'=>'ClaimResponse.item', 'min'=>0, 'max'=>Float::INFINITY},
        'addItem' => {'type'=>'ClaimResponse::AddItem', 'path'=>'ClaimResponse.addItem', 'min'=>0, 'max'=>Float::INFINITY},
        'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'ClaimResponse.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
        'total' => {'type'=>'ClaimResponse::Total', 'path'=>'ClaimResponse.total', 'min'=>0, 'max'=>Float::INFINITY},
        'payment' => {'type'=>'ClaimResponse::Payment', 'path'=>'ClaimResponse.payment', 'min'=>0, 'max'=>1},
        'fundsReserve' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/fundsreserve'=>['patient', 'provider', 'none']}, 'type'=>'CodeableConcept', 'path'=>'ClaimResponse.fundsReserve', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/fundsreserve'}},
        'formCode' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/forms-codes'=>['1', '2']}, 'type'=>'CodeableConcept', 'path'=>'ClaimResponse.formCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/forms'}},
        'form' => {'type'=>'Attachment', 'path'=>'ClaimResponse.form', 'min'=>0, 'max'=>1},
        'processNote' => {'type'=>'ClaimResponse::ProcessNote', 'path'=>'ClaimResponse.processNote', 'min'=>0, 'max'=>Float::INFINITY},
        'communicationRequest' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CommunicationRequest'], 'type'=>'Reference', 'path'=>'ClaimResponse.communicationRequest', 'min'=>0, 'max'=>Float::INFINITY},
        'insurance' => {'type'=>'ClaimResponse::Insurance', 'path'=>'ClaimResponse.insurance', 'min'=>0, 'max'=>Float::INFINITY},
        'error' => {'type'=>'ClaimResponse::Error', 'path'=>'ClaimResponse.error', 'min'=>0, 'max'=>Float::INFINITY}
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

      class Item < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'itemSequence' => {'type'=>'positiveInt', 'path'=>'Item.itemSequence', 'min'=>1, 'max'=>1},
          'traceNumber' => {'type'=>'Identifier', 'path'=>'Item.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'noteNumber' => {'type'=>'positiveInt', 'path'=>'Item.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'reviewOutcome' => {'type'=>'ClaimResponse::Item::ReviewOutcome', 'path'=>'Item.reviewOutcome', 'min'=>0, 'max'=>1},
          'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Item.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
          'detail' => {'type'=>'ClaimResponse::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class ReviewOutcome < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'ReviewOutcome.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'ReviewOutcome.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'ReviewOutcome.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'decision' => {'valid_codes'=>{'http://hl7.org/fhir/claim-decision'=>['denied', 'approved', 'partial', 'pending']}, 'type'=>'CodeableConcept', 'path'=>'ReviewOutcome.decision', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-decision'}},
            'reason' => {'valid_codes'=>{'http://hl7.org/fhir/claim-decision-reason'=>['0001', '0002', '0003', '0004', '0005']}, 'type'=>'CodeableConcept', 'path'=>'ReviewOutcome.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-decision-reason'}},
            'preAuthRef' => {'type'=>'string', 'path'=>'ReviewOutcome.preAuthRef', 'min'=>0, 'max'=>1},
            'preAuthPeriod' => {'type'=>'Period', 'path'=>'ReviewOutcome.preAuthPeriod', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :decision          # 0-1 CodeableConcept
          attr_accessor :reason            # 0-* [ CodeableConcept ]
          attr_accessor :preAuthRef        # 0-1 string
          attr_accessor :preAuthPeriod     # 0-1 Period
        end

        class Adjudication < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Adjudication.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Adjudication.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Adjudication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adjudication'=>['submitted', 'copay', 'eligible', 'deductible', 'unallocdeduct', 'eligpercent', 'tax', 'benefit']}, 'type'=>'CodeableConcept', 'path'=>'Adjudication.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication'}},
            'reason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adjudication-reason'=>['ar001', 'ar002']}, 'type'=>'CodeableConcept', 'path'=>'Adjudication.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-reason'}},
            'amount' => {'type'=>'Money', 'path'=>'Adjudication.amount', 'min'=>0, 'max'=>1},
            'quantity' => {'type'=>'Quantity', 'path'=>'Adjudication.quantity', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :category          # 1-1 CodeableConcept
          attr_accessor :reason            # 0-1 CodeableConcept
          attr_accessor :amount            # 0-1 Money
          attr_accessor :quantity          # 0-1 Quantity
        end

        class Detail < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'detailSequence' => {'type'=>'positiveInt', 'path'=>'Detail.detailSequence', 'min'=>1, 'max'=>1},
            'traceNumber' => {'type'=>'Identifier', 'path'=>'Detail.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'noteNumber' => {'type'=>'positiveInt', 'path'=>'Detail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'reviewOutcome' => {'type'=>'ClaimResponse::Item::ReviewOutcome', 'path'=>'Detail.reviewOutcome', 'min'=>0, 'max'=>1},
            'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
            'subDetail' => {'type'=>'ClaimResponse::Item::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class SubDetail < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'subDetailSequence' => {'type'=>'positiveInt', 'path'=>'SubDetail.subDetailSequence', 'min'=>1, 'max'=>1},
              'traceNumber' => {'type'=>'Identifier', 'path'=>'SubDetail.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
              'noteNumber' => {'type'=>'positiveInt', 'path'=>'SubDetail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
              'reviewOutcome' => {'type'=>'ClaimResponse::Item::ReviewOutcome', 'path'=>'SubDetail.reviewOutcome', 'min'=>0, 'max'=>1},
              'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'SubDetail.adjudication', 'min'=>0, 'max'=>Float::INFINITY}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :subDetailSequence # 1-1 positiveInt
            attr_accessor :traceNumber       # 0-* [ Identifier ]
            attr_accessor :noteNumber        # 0-* [ positiveInt ]
            attr_accessor :reviewOutcome     # 0-1 ClaimResponse::Item::ReviewOutcome
            attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :detailSequence    # 1-1 positiveInt
          attr_accessor :traceNumber       # 0-* [ Identifier ]
          attr_accessor :noteNumber        # 0-* [ positiveInt ]
          attr_accessor :reviewOutcome     # 0-1 ClaimResponse::Item::ReviewOutcome
          attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
          attr_accessor :subDetail         # 0-* [ ClaimResponse::Item::Detail::SubDetail ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :itemSequence      # 1-1 positiveInt
        attr_accessor :traceNumber       # 0-* [ Identifier ]
        attr_accessor :noteNumber        # 0-* [ positiveInt ]
        attr_accessor :reviewOutcome     # 0-1 ClaimResponse::Item::ReviewOutcome
        attr_accessor :adjudication      # 0-* [ ClaimResponse::Item::Adjudication ]
        attr_accessor :detail            # 0-* [ ClaimResponse::Item::Detail ]
      end

      class AddItem < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'serviced' => ['date', 'Period'],
          'location' => ['CodeableConcept', 'Address', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'AddItem.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'AddItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'AddItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'itemSequence' => {'type'=>'positiveInt', 'path'=>'AddItem.itemSequence', 'min'=>0, 'max'=>Float::INFINITY},
          'detailSequence' => {'type'=>'positiveInt', 'path'=>'AddItem.detailSequence', 'min'=>0, 'max'=>Float::INFINITY},
          'subdetailSequence' => {'type'=>'positiveInt', 'path'=>'AddItem.subdetailSequence', 'min'=>0, 'max'=>Float::INFINITY},
          'traceNumber' => {'type'=>'Identifier', 'path'=>'AddItem.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'AddItem.provider', 'min'=>0, 'max'=>Float::INFINITY},
          'revenue' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-revenue-center'=>['0010', '0011', '1001']}, 'type'=>'CodeableConcept', 'path'=>'AddItem.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
          'productOrService' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'AddItem.productOrService', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'productOrServiceEnd' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'AddItem.productOrServiceEnd', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/SupplyRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'AddItem.request', 'min'=>0, 'max'=>Float::INFINITY},
          'modifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/modifiers'=>['a', 'b', 'c', 'e', 'rooh', 'x']}, 'type'=>'CodeableConcept', 'path'=>'AddItem.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
          'programCode' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-programcode'=>['as', 'hd', 'auscr', 'none']}, 'type'=>'CodeableConcept', 'path'=>'AddItem.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
          'servicedDate' => {'type'=>'date', 'path'=>'AddItem.serviced[x]', 'min'=>0, 'max'=>1},
          'servicedPeriod' => {'type'=>'Period', 'path'=>'AddItem.serviced[x]', 'min'=>0, 'max'=>1},
          'locationCodeableConcept' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-serviceplace'=>['01', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '19', '20', '21', '41']}, 'type'=>'CodeableConcept', 'path'=>'AddItem.location[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-place'}},
          'locationAddress' => {'type'=>'Address', 'path'=>'AddItem.location[x]', 'min'=>0, 'max'=>1},
          'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'AddItem.location[x]', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'AddItem.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Money', 'path'=>'AddItem.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'AddItem.factor', 'min'=>0, 'max'=>1},
          'tax' => {'type'=>'Money', 'path'=>'AddItem.tax', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Money', 'path'=>'AddItem.net', 'min'=>0, 'max'=>1},
          'bodySite' => {'type'=>'ClaimResponse::AddItem::BodySite', 'path'=>'AddItem.bodySite', 'min'=>0, 'max'=>Float::INFINITY},
          'noteNumber' => {'type'=>'positiveInt', 'path'=>'AddItem.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'reviewOutcome' => {'type'=>'ClaimResponse::Item::ReviewOutcome', 'path'=>'AddItem.reviewOutcome', 'min'=>0, 'max'=>1},
          'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'AddItem.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
          'detail' => {'type'=>'ClaimResponse::AddItem::Detail', 'path'=>'AddItem.detail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class BodySite < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'BodySite.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'BodySite.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'BodySite.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'site' => {'type'=>'CodeableReference', 'path'=>'BodySite.site', 'min'=>1, 'max'=>Float::INFINITY},
            'subSite' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/FDI-surface'=>['M', 'O', 'I', 'D', 'B', 'V', 'L', 'MO', 'DO', 'DI', 'MOD']}, 'type'=>'CodeableConcept', 'path'=>'BodySite.subSite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/surface'}}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :site              # 1-* [ CodeableReference ]
          attr_accessor :subSite           # 0-* [ CodeableConcept ]
        end

        class Detail < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'traceNumber' => {'type'=>'Identifier', 'path'=>'Detail.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'revenue' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-revenue-center'=>['0010', '0011', '1001']}, 'type'=>'CodeableConcept', 'path'=>'Detail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
            'productOrService' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Detail.productOrService', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'productOrServiceEnd' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Detail.productOrServiceEnd', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'modifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/modifiers'=>['a', 'b', 'c', 'e', 'rooh', 'x']}, 'type'=>'CodeableConcept', 'path'=>'Detail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
            'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Money', 'path'=>'Detail.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'Detail.factor', 'min'=>0, 'max'=>1},
            'tax' => {'type'=>'Money', 'path'=>'Detail.tax', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Money', 'path'=>'Detail.net', 'min'=>0, 'max'=>1},
            'noteNumber' => {'type'=>'positiveInt', 'path'=>'Detail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'reviewOutcome' => {'type'=>'ClaimResponse::Item::ReviewOutcome', 'path'=>'Detail.reviewOutcome', 'min'=>0, 'max'=>1},
            'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'Detail.adjudication', 'min'=>0, 'max'=>Float::INFINITY},
            'subDetail' => {'type'=>'ClaimResponse::AddItem::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class SubDetail < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'traceNumber' => {'type'=>'Identifier', 'path'=>'SubDetail.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
              'revenue' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-revenue-center'=>['0010', '0011', '1001']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
              'productOrService' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.productOrService', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
              'productOrServiceEnd' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.productOrServiceEnd', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
              'modifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/modifiers'=>['a', 'b', 'c', 'e', 'rooh', 'x']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
              'quantity' => {'type'=>'Quantity', 'path'=>'SubDetail.quantity', 'min'=>0, 'max'=>1},
              'unitPrice' => {'type'=>'Money', 'path'=>'SubDetail.unitPrice', 'min'=>0, 'max'=>1},
              'factor' => {'type'=>'decimal', 'path'=>'SubDetail.factor', 'min'=>0, 'max'=>1},
              'tax' => {'type'=>'Money', 'path'=>'SubDetail.tax', 'min'=>0, 'max'=>1},
              'net' => {'type'=>'Money', 'path'=>'SubDetail.net', 'min'=>0, 'max'=>1},
              'noteNumber' => {'type'=>'positiveInt', 'path'=>'SubDetail.noteNumber', 'min'=>0, 'max'=>Float::INFINITY},
              'reviewOutcome' => {'type'=>'ClaimResponse::Item::ReviewOutcome', 'path'=>'SubDetail.reviewOutcome', 'min'=>0, 'max'=>1},
              'adjudication' => {'type'=>'ClaimResponse::Item::Adjudication', 'path'=>'SubDetail.adjudication', 'min'=>0, 'max'=>Float::INFINITY}
            }

            attr_accessor :id                  # 0-1 string
            attr_accessor :extension           # 0-* [ Extension ]
            attr_accessor :modifierExtension   # 0-* [ Extension ]
            attr_accessor :traceNumber         # 0-* [ Identifier ]
            attr_accessor :revenue             # 0-1 CodeableConcept
            attr_accessor :productOrService    # 0-1 CodeableConcept
            attr_accessor :productOrServiceEnd # 0-1 CodeableConcept
            attr_accessor :modifier            # 0-* [ CodeableConcept ]
            attr_accessor :quantity            # 0-1 Quantity
            attr_accessor :unitPrice           # 0-1 Money
            attr_accessor :factor              # 0-1 decimal
            attr_accessor :tax                 # 0-1 Money
            attr_accessor :net                 # 0-1 Money
            attr_accessor :noteNumber          # 0-* [ positiveInt ]
            attr_accessor :reviewOutcome       # 0-1 ClaimResponse::Item::ReviewOutcome
            attr_accessor :adjudication        # 0-* [ ClaimResponse::Item::Adjudication ]
          end

          attr_accessor :id                  # 0-1 string
          attr_accessor :extension           # 0-* [ Extension ]
          attr_accessor :modifierExtension   # 0-* [ Extension ]
          attr_accessor :traceNumber         # 0-* [ Identifier ]
          attr_accessor :revenue             # 0-1 CodeableConcept
          attr_accessor :productOrService    # 0-1 CodeableConcept
          attr_accessor :productOrServiceEnd # 0-1 CodeableConcept
          attr_accessor :modifier            # 0-* [ CodeableConcept ]
          attr_accessor :quantity            # 0-1 Quantity
          attr_accessor :unitPrice           # 0-1 Money
          attr_accessor :factor              # 0-1 decimal
          attr_accessor :tax                 # 0-1 Money
          attr_accessor :net                 # 0-1 Money
          attr_accessor :noteNumber          # 0-* [ positiveInt ]
          attr_accessor :reviewOutcome       # 0-1 ClaimResponse::Item::ReviewOutcome
          attr_accessor :adjudication        # 0-* [ ClaimResponse::Item::Adjudication ]
          attr_accessor :subDetail           # 0-* [ ClaimResponse::AddItem::Detail::SubDetail ]
        end

        attr_accessor :id                      # 0-1 string
        attr_accessor :extension               # 0-* [ Extension ]
        attr_accessor :modifierExtension       # 0-* [ Extension ]
        attr_accessor :itemSequence            # 0-* [ positiveInt ]
        attr_accessor :detailSequence          # 0-* [ positiveInt ]
        attr_accessor :subdetailSequence       # 0-* [ positiveInt ]
        attr_accessor :traceNumber             # 0-* [ Identifier ]
        attr_accessor :provider                # 0-* [ Reference(Practitioner|PractitionerRole|Organization) ]
        attr_accessor :revenue                 # 0-1 CodeableConcept
        attr_accessor :productOrService        # 0-1 CodeableConcept
        attr_accessor :productOrServiceEnd     # 0-1 CodeableConcept
        attr_accessor :request                 # 0-* [ Reference(DeviceRequest|MedicationRequest|NutritionOrder|ServiceRequest|SupplyRequest|VisionPrescription) ]
        attr_accessor :modifier                # 0-* [ CodeableConcept ]
        attr_accessor :programCode             # 0-* [ CodeableConcept ]
        attr_accessor :servicedDate            # 0-1 date
        attr_accessor :servicedPeriod          # 0-1 Period
        attr_accessor :locationCodeableConcept # 0-1 CodeableConcept
        attr_accessor :locationAddress         # 0-1 Address
        attr_accessor :locationReference       # 0-1 Reference(Location)
        attr_accessor :quantity                # 0-1 Quantity
        attr_accessor :unitPrice               # 0-1 Money
        attr_accessor :factor                  # 0-1 decimal
        attr_accessor :tax                     # 0-1 Money
        attr_accessor :net                     # 0-1 Money
        attr_accessor :bodySite                # 0-* [ ClaimResponse::AddItem::BodySite ]
        attr_accessor :noteNumber              # 0-* [ positiveInt ]
        attr_accessor :reviewOutcome           # 0-1 ClaimResponse::Item::ReviewOutcome
        attr_accessor :adjudication            # 0-* [ ClaimResponse::Item::Adjudication ]
        attr_accessor :detail                  # 0-* [ ClaimResponse::AddItem::Detail ]
      end

      class Total < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Total.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Total.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Total.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adjudication'=>['submitted', 'copay', 'eligible', 'deductible', 'unallocdeduct', 'eligpercent', 'tax', 'benefit']}, 'type'=>'CodeableConcept', 'path'=>'Total.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication'}},
          'amount' => {'type'=>'Money', 'path'=>'Total.amount', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :category          # 1-1 CodeableConcept
        attr_accessor :amount            # 1-1 Money
      end

      class Payment < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Payment.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Payment.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Payment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-paymenttype'=>['complete', 'partial']}, 'type'=>'CodeableConcept', 'path'=>'Payment.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-paymenttype'}},
          'adjustment' => {'type'=>'Money', 'path'=>'Payment.adjustment', 'min'=>0, 'max'=>1},
          'adjustmentReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/payment-adjustment-reason'=>['a001', 'a002']}, 'type'=>'CodeableConcept', 'path'=>'Payment.adjustmentReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payment-adjustment-reason'}},
          'date' => {'type'=>'date', 'path'=>'Payment.date', 'min'=>0, 'max'=>1},
          'amount' => {'type'=>'Money', 'path'=>'Payment.amount', 'min'=>1, 'max'=>1},
          'identifier' => {'type'=>'Identifier', 'path'=>'Payment.identifier', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :adjustment        # 0-1 Money
        attr_accessor :adjustmentReason  # 0-1 CodeableConcept
        attr_accessor :date              # 0-1 date
        attr_accessor :amount            # 1-1 Money
        attr_accessor :identifier        # 0-1 Identifier
      end

      class ProcessNote < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ProcessNote.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ProcessNote.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ProcessNote.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'number' => {'type'=>'positiveInt', 'path'=>'ProcessNote.number', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/note-type'=>['display', 'print', 'printoper']}, 'type'=>'CodeableConcept', 'path'=>'ProcessNote.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/note-type'}},
          'text' => {'type'=>'string', 'path'=>'ProcessNote.text', 'min'=>1, 'max'=>1},
          'language' => {'type'=>'CodeableConcept', 'path'=>'ProcessNote.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :number            # 0-1 positiveInt
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :text              # 1-1 string
        attr_accessor :language          # 0-1 CodeableConcept
      end

      class Insurance < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Insurance.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Insurance.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Insurance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Insurance.sequence', 'min'=>1, 'max'=>1},
          'focal' => {'type'=>'boolean', 'path'=>'Insurance.focal', 'min'=>1, 'max'=>1},
          'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Insurance.coverage', 'min'=>1, 'max'=>1},
          'businessArrangement' => {'type'=>'string', 'path'=>'Insurance.businessArrangement', 'min'=>0, 'max'=>1},
          'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Insurance.claimResponse', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                  # 0-1 string
        attr_accessor :extension           # 0-* [ Extension ]
        attr_accessor :modifierExtension   # 0-* [ Extension ]
        attr_accessor :sequence            # 1-1 positiveInt
        attr_accessor :focal               # 1-1 boolean
        attr_accessor :coverage            # 1-1 Reference(Coverage)
        attr_accessor :businessArrangement # 0-1 string
        attr_accessor :claimResponse       # 0-1 Reference(ClaimResponse)
      end

      class Error < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Error.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Error.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Error.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'itemSequence' => {'type'=>'positiveInt', 'path'=>'Error.itemSequence', 'min'=>0, 'max'=>1},
          'detailSequence' => {'type'=>'positiveInt', 'path'=>'Error.detailSequence', 'min'=>0, 'max'=>1},
          'subDetailSequence' => {'type'=>'positiveInt', 'path'=>'Error.subDetailSequence', 'min'=>0, 'max'=>1},
          'code' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/adjudication-error'=>['a001', 'a002']}, 'type'=>'CodeableConcept', 'path'=>'Error.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/adjudication-error'}},
          'expression' => {'type'=>'string', 'path'=>'Error.expression', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :itemSequence      # 0-1 positiveInt
        attr_accessor :detailSequence    # 0-1 positiveInt
        attr_accessor :subDetailSequence # 0-1 positiveInt
        attr_accessor :code              # 1-1 CodeableConcept
        attr_accessor :expression        # 0-* [ string ]
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
      attr_accessor :traceNumber           # 0-* [ Identifier ]
      attr_accessor :status                # 1-1 code
      attr_accessor :type                  # 1-1 CodeableConcept
      attr_accessor :subType               # 0-1 CodeableConcept
      attr_accessor :use                   # 1-1 code
      attr_accessor :patient               # 1-1 Reference(Patient)
      attr_accessor :created               # 1-1 dateTime
      attr_accessor :insurer               # 0-1 Reference(Organization)
      attr_accessor :requestor             # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :request               # 0-1 Reference(Claim)
      attr_accessor :outcome               # 1-1 code
      attr_accessor :decision              # 0-1 CodeableConcept
      attr_accessor :disposition           # 0-1 string
      attr_accessor :preAuthRef            # 0-1 string
      attr_accessor :preAuthPeriod         # 0-1 Period
      attr_accessor :event                 # 0-* [ ClaimResponse::Event ]
      attr_accessor :payeeType             # 0-1 CodeableConcept
      attr_accessor :encounter             # 0-* [ Reference(Encounter) ]
      attr_accessor :diagnosisRelatedGroup # 0-1 CodeableConcept
      attr_accessor :item                  # 0-* [ ClaimResponse::Item ]
      attr_accessor :addItem               # 0-* [ ClaimResponse::AddItem ]
      attr_accessor :adjudication          # 0-* [ ClaimResponse::Item::Adjudication ]
      attr_accessor :total                 # 0-* [ ClaimResponse::Total ]
      attr_accessor :payment               # 0-1 ClaimResponse::Payment
      attr_accessor :fundsReserve          # 0-1 CodeableConcept
      attr_accessor :formCode              # 0-1 CodeableConcept
      attr_accessor :form                  # 0-1 Attachment
      attr_accessor :processNote           # 0-* [ ClaimResponse::ProcessNote ]
      attr_accessor :communicationRequest  # 0-* [ Reference(CommunicationRequest) ]
      attr_accessor :insurance             # 0-* [ ClaimResponse::Insurance ]
      attr_accessor :error                 # 0-* [ ClaimResponse::Error ]

      def resourceType
        'ClaimResponse'
      end
    end
  end
end