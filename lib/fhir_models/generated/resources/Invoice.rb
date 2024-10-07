module FHIR
  module build.fhir.org
    class Invoice < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'period' => ['date', 'Period']
      }
      SEARCH_PARAMS = ['account', 'date', 'identifier', 'issuer', 'participant', 'participant-role', 'patient', 'recipient', 'status', 'subject', 'totalgross', 'totalnet', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Invoice.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Invoice.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Invoice.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Invoice.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Invoice.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Invoice.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Invoice.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Invoice.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Invoice.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/invoice-status'=>['draft', 'issued', 'balanced', 'cancelled', 'entered-in-error']}, 'type'=>'code', 'path'=>'Invoice.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/invoice-status'}},
        'cancelledReason' => {'type'=>'string', 'path'=>'Invoice.cancelledReason', 'min'=>0, 'max'=>1},
        'type' => {'type'=>'CodeableConcept', 'path'=>'Invoice.type', 'min'=>0, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Invoice.subject', 'min'=>0, 'max'=>1},
        'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Invoice.recipient', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'Invoice.date', 'min'=>0, 'max'=>1},
        'creation' => {'type'=>'dateTime', 'path'=>'Invoice.creation', 'min'=>0, 'max'=>1},
        'periodDate' => {'type'=>'date', 'path'=>'Invoice.period[x]', 'min'=>0, 'max'=>1},
        'periodPeriod' => {'type'=>'Period', 'path'=>'Invoice.period[x]', 'min'=>0, 'max'=>1},
        'participant' => {'type'=>'Invoice::Participant', 'path'=>'Invoice.participant', 'min'=>0, 'max'=>Float::INFINITY},
        'issuer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Invoice.issuer', 'min'=>0, 'max'=>1},
        'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'Invoice.account', 'min'=>0, 'max'=>1},
        'lineItem' => {'type'=>'Invoice::LineItem', 'path'=>'Invoice.lineItem', 'min'=>0, 'max'=>Float::INFINITY},
        'totalPriceComponent' => {'type'=>'MonetaryComponent', 'path'=>'Invoice.totalPriceComponent', 'min'=>0, 'max'=>Float::INFINITY},
        'totalNet' => {'type'=>'Money', 'path'=>'Invoice.totalNet', 'min'=>0, 'max'=>1},
        'totalGross' => {'type'=>'Money', 'path'=>'Invoice.totalGross', 'min'=>0, 'max'=>1},
        'paymentTerms' => {'type'=>'markdown', 'path'=>'Invoice.paymentTerms', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'Invoice.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Participant < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Participant.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Participant.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Participant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'role' => {'type'=>'CodeableConcept', 'path'=>'Participant.role', 'min'=>0, 'max'=>1},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Participant.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :role              # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 Reference(Practitioner|Organization|Patient|PractitionerRole|Device|RelatedPerson)
      end

      class LineItem < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'serviced' => ['date', 'Period'],
          'chargeItem' => ['Reference', 'CodeableConcept']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'LineItem.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'LineItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'LineItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'LineItem.sequence', 'min'=>0, 'max'=>1},
          'servicedDate' => {'type'=>'date', 'path'=>'LineItem.serviced[x]', 'min'=>0, 'max'=>1},
          'servicedPeriod' => {'type'=>'Period', 'path'=>'LineItem.serviced[x]', 'min'=>0, 'max'=>1},
          'chargeItemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ChargeItem'], 'type'=>'Reference', 'path'=>'LineItem.chargeItem[x]', 'min'=>1, 'max'=>1},
          'chargeItemCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'LineItem.chargeItem[x]', 'min'=>1, 'max'=>1},
          'priceComponent' => {'type'=>'MonetaryComponent', 'path'=>'LineItem.priceComponent', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                        # 0-1 string
        attr_accessor :extension                 # 0-* [ Extension ]
        attr_accessor :modifierExtension         # 0-* [ Extension ]
        attr_accessor :sequence                  # 0-1 positiveInt
        attr_accessor :servicedDate              # 0-1 date
        attr_accessor :servicedPeriod            # 0-1 Period
        attr_accessor :chargeItemReference       # 1-1 Reference(ChargeItem)
        attr_accessor :chargeItemCodeableConcept # 1-1 CodeableConcept
        attr_accessor :priceComponent            # 0-* [ MonetaryComponent ]
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
      attr_accessor :status              # 1-1 code
      attr_accessor :cancelledReason     # 0-1 string
      attr_accessor :type                # 0-1 CodeableConcept
      attr_accessor :subject             # 0-1 Reference(Patient|Group)
      attr_accessor :recipient           # 0-1 Reference(Organization|Patient|RelatedPerson)
      attr_accessor :date                # 0-1 dateTime
      attr_accessor :creation            # 0-1 dateTime
      attr_accessor :periodDate          # 0-1 date
      attr_accessor :periodPeriod        # 0-1 Period
      attr_accessor :participant         # 0-* [ Invoice::Participant ]
      attr_accessor :issuer              # 0-1 Reference(Organization)
      attr_accessor :account             # 0-1 Reference(Account)
      attr_accessor :lineItem            # 0-* [ Invoice::LineItem ]
      attr_accessor :totalPriceComponent # 0-* [ MonetaryComponent ]
      attr_accessor :totalNet            # 0-1 Money
      attr_accessor :totalGross          # 0-1 Money
      attr_accessor :paymentTerms        # 0-1 markdown
      attr_accessor :note                # 0-* [ Annotation ]

      def resourceType
        'Invoice'
      end
    end
  end
end