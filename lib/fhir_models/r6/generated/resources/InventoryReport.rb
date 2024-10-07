module FHIR
  module R6
    class InventoryReport < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['identifier', 'item', 'item-reference', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'InventoryReport.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'InventoryReport.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'InventoryReport.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'InventoryReport.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'InventoryReport.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'InventoryReport.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'InventoryReport.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'InventoryReport.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'InventoryReport.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/inventoryreport-status'=>['draft', 'requested', 'active', 'entered-in-error']}, 'type'=>'code', 'path'=>'InventoryReport.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/inventoryreport-status'}},
        'countType' => {'valid_codes'=>{'http://hl7.org/fhir/inventoryreport-counttype'=>['snapshot', 'difference']}, 'type'=>'code', 'path'=>'InventoryReport.countType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/inventoryreport-counttype'}},
        'operationType' => {'type'=>'CodeableConcept', 'path'=>'InventoryReport.operationType', 'min'=>0, 'max'=>1},
        'operationTypeReason' => {'type'=>'CodeableConcept', 'path'=>'InventoryReport.operationTypeReason', 'min'=>0, 'max'=>1},
        'reportedDateTime' => {'type'=>'dateTime', 'path'=>'InventoryReport.reportedDateTime', 'min'=>1, 'max'=>1},
        'reporter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'InventoryReport.reporter', 'min'=>0, 'max'=>1},
        'reportingPeriod' => {'type'=>'Period', 'path'=>'InventoryReport.reportingPeriod', 'min'=>0, 'max'=>1},
        'inventoryListing' => {'type'=>'InventoryReport::InventoryListing', 'path'=>'InventoryReport.inventoryListing', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'InventoryReport.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class InventoryListing < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'InventoryListing.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'InventoryListing.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'InventoryListing.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'InventoryListing.location', 'min'=>0, 'max'=>1},
          'itemStatus' => {'type'=>'CodeableConcept', 'path'=>'InventoryListing.itemStatus', 'min'=>0, 'max'=>1},
          'countingDateTime' => {'type'=>'dateTime', 'path'=>'InventoryListing.countingDateTime', 'min'=>0, 'max'=>1},
          'item' => {'type'=>'InventoryReport::InventoryListing::Item', 'path'=>'InventoryListing.item', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Item < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'category' => {'type'=>'CodeableConcept', 'path'=>'Item.category', 'min'=>0, 'max'=>1},
            'quantity' => {'type'=>'Quantity', 'path'=>'Item.quantity', 'min'=>1, 'max'=>1},
            'item' => {'type'=>'CodeableReference', 'path'=>'Item.item', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :category          # 0-1 CodeableConcept
          attr_accessor :quantity          # 1-1 Quantity
          attr_accessor :item              # 1-1 CodeableReference
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :location          # 0-1 Reference(Location)
        attr_accessor :itemStatus        # 0-1 CodeableConcept
        attr_accessor :countingDateTime  # 0-1 dateTime
        attr_accessor :item              # 0-* [ InventoryReport::InventoryListing::Item ]
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
      attr_accessor :countType           # 1-1 code
      attr_accessor :operationType       # 0-1 CodeableConcept
      attr_accessor :operationTypeReason # 0-1 CodeableConcept
      attr_accessor :reportedDateTime    # 1-1 dateTime
      attr_accessor :reporter            # 0-1 Reference(Practitioner|Patient|RelatedPerson|Device)
      attr_accessor :reportingPeriod     # 0-1 Period
      attr_accessor :inventoryListing    # 0-* [ InventoryReport::InventoryListing ]
      attr_accessor :note                # 0-* [ Annotation ]

      def resourceType
        'InventoryReport'
      end
    end
  end
end