module FHIR
  module R6
    class SupplyDelivery < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'occurrence' => ['dateTime', 'Period', 'Timing']
      }
      SEARCH_PARAMS = ['identifier', 'patient', 'receiver', 'status', 'supplier']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SupplyDelivery.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SupplyDelivery.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SupplyDelivery.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SupplyDelivery.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SupplyDelivery.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SupplyDelivery.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SupplyDelivery.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SupplyDelivery.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'SupplyDelivery.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/SupplyRequest'], 'type'=>'Reference', 'path'=>'SupplyDelivery.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/SupplyDelivery', 'http://hl7.org/fhir/StructureDefinition/Contract'], 'type'=>'Reference', 'path'=>'SupplyDelivery.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/supplydelivery-status'=>['in-progress', 'completed', 'abandoned', 'entered-in-error']}, 'type'=>'code', 'path'=>'SupplyDelivery.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/supplydelivery-status'}},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'SupplyDelivery.patient', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/supplydelivery-supplyitemtype'=>['medication', 'device', 'biologicallyderivedproduct']}, 'type'=>'CodeableConcept', 'path'=>'SupplyDelivery.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/supplydelivery-supplyitemtype'}},
        'stage' => {'valid_codes'=>{'http://hl7.org/fhir/supplydelivery-stage'=>['dispatch', 'reception']}, 'type'=>'CodeableConcept', 'path'=>'SupplyDelivery.stage', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/supplydelivery-stage'}},
        'suppliedItem' => {'type'=>'SupplyDelivery::SuppliedItem', 'path'=>'SupplyDelivery.suppliedItem', 'min'=>0, 'max'=>Float::INFINITY},
        'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'SupplyDelivery.occurrence[x]', 'min'=>0, 'max'=>1},
        'occurrencePeriod' => {'type'=>'Period', 'path'=>'SupplyDelivery.occurrence[x]', 'min'=>0, 'max'=>1},
        'occurrenceTiming' => {'type'=>'Timing', 'path'=>'SupplyDelivery.occurrence[x]', 'min'=>0, 'max'=>1},
        'supplier' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'SupplyDelivery.supplier', 'min'=>0, 'max'=>1},
        'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'SupplyDelivery.destination', 'min'=>0, 'max'=>1},
        'receiver' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'SupplyDelivery.receiver', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class SuppliedItem < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'item' => ['CodeableConcept', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'SuppliedItem.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'SuppliedItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'SuppliedItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'quantity' => {'type'=>'Quantity', 'path'=>'SuppliedItem.quantity', 'min'=>0, 'max'=>1},
          'condition' => {'valid_codes'=>{'http://hl7.org/fhir/supplydelivery-supplyitemcondition'=>['normal', 'damaged']}, 'type'=>'CodeableConcept', 'path'=>'SuppliedItem.condition', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/supplydelivery-supplyitemcondition'}},
          'itemCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/supplydelivery-supplyitemtype'=>['medication', 'device', 'biologicallyderivedproduct']}, 'type'=>'CodeableConcept', 'path'=>'SuppliedItem.item[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/supplydelivery-supplyitemtype'}},
          'itemReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct', 'http://hl7.org/fhir/StructureDefinition/NutritionProduct', 'http://hl7.org/fhir/StructureDefinition/InventoryItem'], 'type'=>'Reference', 'path'=>'SuppliedItem.item[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                  # 0-1 string
        attr_accessor :extension           # 0-* [ Extension ]
        attr_accessor :modifierExtension   # 0-* [ Extension ]
        attr_accessor :quantity            # 0-1 Quantity
        attr_accessor :condition           # 0-1 CodeableConcept
        attr_accessor :itemCodeableConcept # 0-1 CodeableConcept
        attr_accessor :itemReference       # 0-1 Reference(Medication|Substance|Device|BiologicallyDerivedProduct|NutritionProduct|InventoryItem)
      end

      attr_accessor :id                 # 0-1 id
      attr_accessor :meta               # 0-1 Meta
      attr_accessor :implicitRules      # 0-1 uri
      attr_accessor :language           # 0-1 code
      attr_accessor :text               # 0-1 Narrative
      attr_accessor :contained          # 0-* [ Resource ]
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :identifier         # 0-* [ Identifier ]
      attr_accessor :basedOn            # 0-* [ Reference(SupplyRequest) ]
      attr_accessor :partOf             # 0-* [ Reference(SupplyDelivery|Contract) ]
      attr_accessor :status             # 1-1 code
      attr_accessor :patient            # 0-1 Reference(Patient)
      attr_accessor :type               # 0-1 CodeableConcept
      attr_accessor :stage              # 1-1 CodeableConcept
      attr_accessor :suppliedItem       # 0-* [ SupplyDelivery::SuppliedItem ]
      attr_accessor :occurrenceDateTime # 0-1 dateTime
      attr_accessor :occurrencePeriod   # 0-1 Period
      attr_accessor :occurrenceTiming   # 0-1 Timing
      attr_accessor :supplier           # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :destination        # 0-1 Reference(Location|Practitioner|PractitionerRole|Organization)
      attr_accessor :receiver           # 0-* [ Reference(Practitioner|PractitionerRole|Organization) ]

      def resourceType
        'SupplyDelivery'
      end
    end
  end
end