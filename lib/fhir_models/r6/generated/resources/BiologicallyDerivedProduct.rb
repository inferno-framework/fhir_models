module FHIR
  module R6
    class BiologicallyDerivedProduct < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['biological-source-event', 'code', 'collector', 'identifier', 'product-category', 'product-status', 'request', 'serial-number']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'BiologicallyDerivedProduct.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'BiologicallyDerivedProduct.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'BiologicallyDerivedProduct.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'BiologicallyDerivedProduct.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'BiologicallyDerivedProduct.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'BiologicallyDerivedProduct.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'BiologicallyDerivedProduct.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'BiologicallyDerivedProduct.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'productCategory' => {'valid_codes'=>{'http://hl7.org/fhir/product-category'=>['organ', 'tissue', 'fluid', 'cells', 'biological-agent', 'mpho']}, 'type'=>'CodeableConcept', 'path'=>'BiologicallyDerivedProduct.productCategory', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/product-category'}},
        'productCode' => {'valid_codes'=>{'http://hl7.org/fhir/biologicallyderived-productcodes'=>['e0398', 's1128', 's1194', 's1195', 's1310', 's1398', 's2598', 'e4377', 't1396']}, 'type'=>'CodeableConcept', 'path'=>'BiologicallyDerivedProduct.productCode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/biologicallyderived-productcodes'}},
        'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProduct.parent', 'min'=>0, 'max'=>Float::INFINITY},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProduct.request', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'BiologicallyDerivedProduct.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'biologicalSourceEvent' => {'type'=>'Identifier', 'path'=>'BiologicallyDerivedProduct.biologicalSourceEvent', 'min'=>0, 'max'=>1},
        'processingFacility' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProduct.processingFacility', 'min'=>0, 'max'=>Float::INFINITY},
        'division' => {'type'=>'string', 'path'=>'BiologicallyDerivedProduct.division', 'min'=>0, 'max'=>1},
        'productStatus' => {'valid_codes'=>{'http://hl7.org/fhir/biologicallyderived-product-status'=>['available', 'unavailable', 'processed', 'applied', 'Discarded']}, 'type'=>'Coding', 'path'=>'BiologicallyDerivedProduct.productStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/biologicallyderived-product-status'}},
        'expirationDate' => {'type'=>'dateTime', 'path'=>'BiologicallyDerivedProduct.expirationDate', 'min'=>0, 'max'=>1},
        'collection' => {'type'=>'BiologicallyDerivedProduct::Collection', 'path'=>'BiologicallyDerivedProduct.collection', 'min'=>0, 'max'=>1},
        'storageTempRequirements' => {'type'=>'Range', 'path'=>'BiologicallyDerivedProduct.storageTempRequirements', 'min'=>0, 'max'=>1},
        'property' => {'type'=>'BiologicallyDerivedProduct::Property', 'path'=>'BiologicallyDerivedProduct.property', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Collection < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'collected' => ['dateTime', 'Period']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Collection.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Collection.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Collection.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'collector' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Collection.collector', 'min'=>0, 'max'=>1},
          'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Collection.source', 'min'=>0, 'max'=>1},
          'collectedDateTime' => {'type'=>'dateTime', 'path'=>'Collection.collected[x]', 'min'=>0, 'max'=>1},
          'collectedPeriod' => {'type'=>'Period', 'path'=>'Collection.collected[x]', 'min'=>0, 'max'=>1},
          'procedure' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Collection.procedure', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :collector         # 0-1 Reference(Practitioner|PractitionerRole)
        attr_accessor :source            # 0-1 Reference(Patient|Organization)
        attr_accessor :collectedDateTime # 0-1 dateTime
        attr_accessor :collectedPeriod   # 0-1 Period
        attr_accessor :procedure         # 0-1 Reference(Procedure)
      end

      class Property < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['boolean', 'integer', 'CodeableConcept', 'Period', 'Quantity', 'Range', 'Ratio', 'string', 'Attachment']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/biologicallyderived-product-property-type-codes'=>['collectiontype', 'aborhd', 'singleeuropeancode', 'redcellantigen']}, 'type'=>'CodeableConcept', 'path'=>'Property.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/biologicallyderived-product-property-type-codes'}},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valuePeriod' => {'type'=>'Period', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueRange' => {'type'=>'Range', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueRatio' => {'type'=>'Ratio', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :type                 # 1-1 CodeableConcept
        attr_accessor :valueBoolean         # 1-1 boolean
        attr_accessor :valueInteger         # 1-1 integer
        attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
        attr_accessor :valuePeriod          # 1-1 Period
        attr_accessor :valueQuantity        # 1-1 Quantity
        attr_accessor :valueRange           # 1-1 Range
        attr_accessor :valueRatio           # 1-1 Ratio
        attr_accessor :valueString          # 1-1 string
        attr_accessor :valueAttachment      # 1-1 Attachment
      end

      attr_accessor :id                      # 0-1 id
      attr_accessor :meta                    # 0-1 Meta
      attr_accessor :implicitRules           # 0-1 uri
      attr_accessor :language                # 0-1 code
      attr_accessor :text                    # 0-1 Narrative
      attr_accessor :contained               # 0-* [ Resource ]
      attr_accessor :extension               # 0-* [ Extension ]
      attr_accessor :modifierExtension       # 0-* [ Extension ]
      attr_accessor :productCategory         # 0-* [ CodeableConcept ]
      attr_accessor :productCode             # 0-1 CodeableConcept
      attr_accessor :parent                  # 0-* [ Reference(BiologicallyDerivedProduct) ]
      attr_accessor :request                 # 0-* [ Reference(ServiceRequest) ]
      attr_accessor :identifier              # 0-* [ Identifier ]
      attr_accessor :biologicalSourceEvent   # 0-1 Identifier
      attr_accessor :processingFacility      # 0-* [ Reference(Organization) ]
      attr_accessor :division                # 0-1 string
      attr_accessor :productStatus           # 0-1 Coding
      attr_accessor :expirationDate          # 0-1 dateTime
      attr_accessor :collection              # 0-1 BiologicallyDerivedProduct::Collection
      attr_accessor :storageTempRequirements # 0-1 Range
      attr_accessor :property                # 0-* [ BiologicallyDerivedProduct::Property ]

      def resourceType
        'BiologicallyDerivedProduct'
      end
    end
  end
end