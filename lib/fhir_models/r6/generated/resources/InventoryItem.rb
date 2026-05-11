module FHIR
  module R6
    class InventoryItem < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['code', 'identifier', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'InventoryItem.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'InventoryItem.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'InventoryItem.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'InventoryItem.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'InventoryItem.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'InventoryItem.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'InventoryItem.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'InventoryItem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'InventoryItem.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/inventoryitem-status'=>['active', 'inactive', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'InventoryItem.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/inventoryitem-status'}},
        'category' => {'type'=>'CodeableConcept', 'path'=>'InventoryItem.category', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'type'=>'CodeableConcept', 'path'=>'InventoryItem.code', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'InventoryItem::Name', 'path'=>'InventoryItem.name', 'min'=>0, 'max'=>Float::INFINITY},
        'responsibleOrganization' => {'type'=>'InventoryItem::ResponsibleOrganization', 'path'=>'InventoryItem.responsibleOrganization', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'InventoryItem::Description', 'path'=>'InventoryItem.description', 'min'=>0, 'max'=>1},
        'inventoryStatus' => {'type'=>'CodeableConcept', 'path'=>'InventoryItem.inventoryStatus', 'min'=>0, 'max'=>Float::INFINITY},
        'baseUnit' => {'type'=>'CodeableConcept', 'path'=>'InventoryItem.baseUnit', 'min'=>0, 'max'=>1},
        'netContent' => {'type'=>'Quantity', 'path'=>'InventoryItem.netContent', 'min'=>0, 'max'=>1},
        'association' => {'type'=>'InventoryItem::Association', 'path'=>'InventoryItem.association', 'min'=>0, 'max'=>Float::INFINITY},
        'characteristic' => {'type'=>'InventoryItem::Characteristic', 'path'=>'InventoryItem.characteristic', 'min'=>0, 'max'=>Float::INFINITY},
        'instance' => {'type'=>'InventoryItem::Instance', 'path'=>'InventoryItem.instance', 'min'=>0, 'max'=>1},
        'productReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/NutritionProduct', 'http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct'], 'type'=>'Reference', 'path'=>'InventoryItem.productReference', 'min'=>0, 'max'=>1}
      }

      class Name < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Name.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Name.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Name.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'nameType' => {'valid_codes'=>{'http://hl7.org/fhir/inventoryitem-nametype'=>['trade-name', 'alias', 'original-name', 'preferred']}, 'type'=>'Coding', 'path'=>'Name.nameType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/inventoryitem-nametype'}},
          'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bg', 'bg-BG', 'bn', 'cs', 'cs-CZ', 'bs', 'bs-BA', 'da', 'da-DK', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'el-GR', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'et', 'et-EE', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fi-FI', 'fr-CA', 'fy', 'fy-NL', 'hi', 'hr', 'hr-HR', 'is', 'is-IS', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'lt', 'lt-LT', 'lv', 'lv-LV', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pl-PL', 'pt', 'pt-PT', 'pt-BR', 'ro', 'ro-RO', 'ru', 'ru-RU', 'sk', 'sk-SK', 'sl', 'sl-SI', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Name.language', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
          'name' => {'type'=>'string', 'path'=>'Name.name', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :nameType          # 1-1 Coding
        attr_accessor :language          # 1-1 code
        attr_accessor :name              # 1-1 string
      end

      class ResponsibleOrganization < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ResponsibleOrganization.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ResponsibleOrganization.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ResponsibleOrganization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'role' => {'type'=>'CodeableConcept', 'path'=>'ResponsibleOrganization.role', 'min'=>1, 'max'=>1},
          'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ResponsibleOrganization.organization', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :role              # 1-1 CodeableConcept
        attr_accessor :organization      # 1-1 Reference(Organization)
      end

      class Description < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Description.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Description.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Description.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'language' => {'valid_codes'=>{'urn:ietf:bcp:47'=>['ar', 'bg', 'bg-BG', 'bn', 'cs', 'cs-CZ', 'bs', 'bs-BA', 'da', 'da-DK', 'de', 'de-AT', 'de-CH', 'de-DE', 'el', 'el-GR', 'en', 'en-AU', 'en-CA', 'en-GB', 'en-IN', 'en-NZ', 'en-SG', 'en-US', 'es', 'es-AR', 'es-ES', 'es-UY', 'et', 'et-EE', 'fi', 'fr', 'fr-BE', 'fr-CH', 'fr-FR', 'fi-FI', 'fr-CA', 'fy', 'fy-NL', 'hi', 'hr', 'hr-HR', 'is', 'is-IS', 'it', 'it-CH', 'it-IT', 'ja', 'ko', 'lt', 'lt-LT', 'lv', 'lv-LV', 'nl', 'nl-BE', 'nl-NL', 'no', 'no-NO', 'pa', 'pl', 'pl-PL', 'pt', 'pt-PT', 'pt-BR', 'ro', 'ro-RO', 'ru', 'ru-RU', 'sk', 'sk-SK', 'sl', 'sl-SI', 'sr', 'sr-RS', 'sv', 'sv-SE', 'te', 'zh', 'zh-CN', 'zh-HK', 'zh-SG', 'zh-TW']}, 'type'=>'code', 'path'=>'Description.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/languages'}},
          'description' => {'type'=>'string', 'path'=>'Description.description', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :language          # 0-1 code
        attr_accessor :description       # 0-1 string
      end

      class Association < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Association.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Association.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Association.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'associationType' => {'type'=>'CodeableConcept', 'path'=>'Association.associationType', 'min'=>1, 'max'=>1},
          'relatedItem' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/InventoryItem', 'http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/MedicationKnowledge', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/DeviceDefinition', 'http://hl7.org/fhir/StructureDefinition/NutritionProduct', 'http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct'], 'type'=>'Reference', 'path'=>'Association.relatedItem', 'min'=>1, 'max'=>1},
          'quantity' => {'type'=>'Ratio', 'path'=>'Association.quantity', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :associationType   # 1-1 CodeableConcept
        attr_accessor :relatedItem       # 1-1 Reference(InventoryItem|Medication|MedicationKnowledge|Device|DeviceDefinition|NutritionProduct|BiologicallyDerivedProduct)
        attr_accessor :quantity          # 1-1 Ratio
      end

      class Characteristic < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['string', 'integer', 'decimal', 'boolean', 'url', 'dateTime', 'Quantity', 'Range', 'Ratio', 'Annotation', 'Address', 'Duration', 'CodeableConcept']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Characteristic.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Characteristic.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Characteristic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'characteristicType' => {'type'=>'CodeableConcept', 'path'=>'Characteristic.characteristicType', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueDecimal' => {'type'=>'decimal', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueUrl' => {'type'=>'url', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueRange' => {'type'=>'Range', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueRatio' => {'type'=>'Ratio', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueAddress' => {'type'=>'Address', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueDuration' => {'type'=>'Duration', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :characteristicType   # 1-1 CodeableConcept
        attr_accessor :valueString          # 1-1 string
        attr_accessor :valueInteger         # 1-1 integer
        attr_accessor :valueDecimal         # 1-1 decimal
        attr_accessor :valueBoolean         # 1-1 boolean
        attr_accessor :valueUrl             # 1-1 url
        attr_accessor :valueDateTime        # 1-1 dateTime
        attr_accessor :valueQuantity        # 1-1 Quantity
        attr_accessor :valueRange           # 1-1 Range
        attr_accessor :valueRatio           # 1-1 Ratio
        attr_accessor :valueAnnotation      # 1-1 Annotation
        attr_accessor :valueAddress         # 1-1 Address
        attr_accessor :valueDuration        # 1-1 Duration
        attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
      end

      class Instance < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Instance.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Instance.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Instance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Instance.identifier', 'min'=>0, 'max'=>Float::INFINITY},
          'lotNumber' => {'type'=>'string', 'path'=>'Instance.lotNumber', 'min'=>0, 'max'=>1},
          'expiry' => {'type'=>'dateTime', 'path'=>'Instance.expiry', 'min'=>0, 'max'=>1},
          'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Instance.subject', 'min'=>0, 'max'=>1},
          'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Instance.location', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 0-* [ Identifier ]
        attr_accessor :lotNumber         # 0-1 string
        attr_accessor :expiry            # 0-1 dateTime
        attr_accessor :subject           # 0-1 Reference(Patient|Organization)
        attr_accessor :location          # 0-1 Reference(Location)
      end

      attr_accessor :id                      # 0-1 id
      attr_accessor :meta                    # 0-1 Meta
      attr_accessor :implicitRules           # 0-1 uri
      attr_accessor :language                # 0-1 code
      attr_accessor :text                    # 0-1 Narrative
      attr_accessor :contained               # 0-* [ Resource ]
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :identifier              # 0-* [ Identifier ]
      attr_accessor :status                  # 1-1 code
      attr_accessor :category                # 0-* [ CodeableConcept ]
      attr_accessor :code                    # 0-* [ CodeableConcept ]
      attr_accessor :name                    # 0-* [ InventoryItem::Name ]
      attr_accessor :responsibleOrganization # 0-* [ InventoryItem::ResponsibleOrganization ]
      attr_accessor :description             # 0-1 InventoryItem::Description
      attr_accessor :inventoryStatus         # 0-* [ CodeableConcept ]
      attr_accessor :baseUnit                # 0-1 CodeableConcept
      attr_accessor :netContent              # 0-1 Quantity
      attr_accessor :association             # 0-* [ InventoryItem::Association ]
      attr_accessor :characteristic          # 0-* [ InventoryItem::Characteristic ]
      attr_accessor :instance                # 0-1 InventoryItem::Instance
      attr_accessor :productReference        # 0-1 Reference(Medication|Device|NutritionProduct|BiologicallyDerivedProduct)

      def resourceType
        'InventoryItem'
      end
    end
  end
end