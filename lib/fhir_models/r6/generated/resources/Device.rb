module FHIR
  module R6
    class Device < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['biological-source-event', 'code', 'code-value-concept', 'definition', 'device-name', 'expiration-date', 'identifier', 'location', 'lot-number', 'manufacture-date', 'manufacturer', 'model', 'organization', 'parent', 'serial-number', 'specification', 'specification-version', 'status', 'type', 'udi-carrier-hrf', 'udi-di', 'url', 'version', 'version-type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Device.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Device.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Device.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Device.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Device.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Device.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Device.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Device.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Device.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'definition' => {'type'=>'CodeableReference', 'path'=>'Device.definition', 'min'=>0, 'max'=>1},
        'udiCarrier' => {'type'=>'Device::UdiCarrier', 'path'=>'Device.udiCarrier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/device-status'=>['active', 'inactive', 'entered-in-error']}, 'type'=>'code', 'path'=>'Device.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/device-status'}},
        'availabilityStatus' => {'valid_codes'=>{'http://hl7.org/fhir/device-availability-status'=>['lost', 'damaged', 'destroyed', 'available']}, 'type'=>'CodeableConcept', 'path'=>'Device.availabilityStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/device-availability-status'}},
        'biologicalSourceEvent' => {'type'=>'Identifier', 'path'=>'Device.biologicalSourceEvent', 'min'=>0, 'max'=>1},
        'manufacturer' => {'type'=>'string', 'path'=>'Device.manufacturer', 'min'=>0, 'max'=>1},
        'manufactureDate' => {'type'=>'dateTime', 'path'=>'Device.manufactureDate', 'min'=>0, 'max'=>1},
        'expirationDate' => {'type'=>'dateTime', 'path'=>'Device.expirationDate', 'min'=>0, 'max'=>1},
        'lotNumber' => {'type'=>'string', 'path'=>'Device.lotNumber', 'min'=>0, 'max'=>1},
        'serialNumber' => {'type'=>'string', 'path'=>'Device.serialNumber', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'Device::Name', 'path'=>'Device.name', 'min'=>0, 'max'=>Float::INFINITY},
        'modelNumber' => {'type'=>'string', 'path'=>'Device.modelNumber', 'min'=>0, 'max'=>1},
        'partNumber' => {'type'=>'string', 'path'=>'Device.partNumber', 'min'=>0, 'max'=>1},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/device-category'=>['active', 'communicating', 'dme', 'home-use', 'implantable', 'in-vitro', 'point-of-care', 'single-use', 'reusable', 'software']}, 'type'=>'CodeableConcept', 'path'=>'Device.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-category'}},
        'type' => {'valid_codes'=>{'urn:iso:std:iso:11073:10101'=>['528391', '528404', '528425', '528402', '528409', '528390', '528457', '528401', '528455', '528403', '528405', '528388', '528397', '528408', '528426', '528392', '528399'], 'urn:oid:2.16.840.1.113883.6.276'=>['38017', '38663', '42347', '46352', '47264', '62163', '62260', '62423', '62414', '64587', '64992']}, 'type'=>'CodeableConcept', 'path'=>'Device.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-type'}},
        'deviceVersion' => {'type'=>'Device::DeviceVersion', 'path'=>'Device.deviceVersion', 'min'=>0, 'max'=>Float::INFINITY},
        'conformsTo' => {'type'=>'Device::ConformsTo', 'path'=>'Device.conformsTo', 'min'=>0, 'max'=>Float::INFINITY},
        'property' => {'type'=>'Device::Property', 'path'=>'Device.property', 'min'=>0, 'max'=>Float::INFINITY},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/device-operation-mode'=>['normal', 'demo', 'service', 'maintenance', 'test']}, 'type'=>'CodeableConcept', 'path'=>'Device.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-operation-mode'}},
        'cycle' => {'type'=>'Count', 'path'=>'Device.cycle', 'min'=>0, 'max'=>1},
        'duration' => {'type'=>'Duration', 'path'=>'Device.duration', 'min'=>0, 'max'=>1},
        'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Device.owner', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactPoint', 'path'=>'Device.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Device.location', 'min'=>0, 'max'=>1},
        'url' => {'type'=>'uri', 'path'=>'Device.url', 'min'=>0, 'max'=>1},
        'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Device.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'gateway' => {'type'=>'CodeableReference', 'path'=>'Device.gateway', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'Device.note', 'min'=>0, 'max'=>Float::INFINITY},
        'safety' => {'valid_codes'=>{'urn:oid:2.16.840.1.113883.3.26.1.1'=>['C106046', 'C106045', 'C106047', 'C113844', 'C101673', 'C106038']}, 'type'=>'CodeableConcept', 'path'=>'Device.safety', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-safety'}},
        'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Device.parent', 'min'=>0, 'max'=>1}
      }

      class UdiCarrier < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'UdiCarrier.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'UdiCarrier.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'UdiCarrier.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'deviceIdentifier' => {'type'=>'string', 'path'=>'UdiCarrier.deviceIdentifier', 'min'=>1, 'max'=>1},
          'deviceIdentifierSystem' => {'type'=>'uri', 'path'=>'UdiCarrier.deviceIdentifierSystem', 'min'=>0, 'max'=>1},
          'issuer' => {'type'=>'uri', 'path'=>'UdiCarrier.issuer', 'min'=>1, 'max'=>1},
          'jurisdiction' => {'type'=>'uri', 'path'=>'UdiCarrier.jurisdiction', 'min'=>0, 'max'=>1},
          'carrierAIDC' => {'type'=>'base64Binary', 'path'=>'UdiCarrier.carrierAIDC', 'min'=>0, 'max'=>1},
          'carrierHRF' => {'type'=>'string', 'path'=>'UdiCarrier.carrierHRF', 'min'=>0, 'max'=>1},
          'entryType' => {'valid_codes'=>{'http://hl7.org/fhir/udi-entry-type'=>['barcode', 'rfid', 'manual', 'card', 'self-reported', 'electronic-transmission', 'unknown']}, 'type'=>'code', 'path'=>'UdiCarrier.entryType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/udi-entry-type'}}
        }

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :deviceIdentifier       # 1-1 string
        attr_accessor :deviceIdentifierSystem # 0-1 uri
        attr_accessor :issuer                 # 1-1 uri
        attr_accessor :jurisdiction           # 0-1 uri
        attr_accessor :carrierAIDC            # 0-1 base64Binary
        attr_accessor :carrierHRF             # 0-1 string
        attr_accessor :entryType              # 0-1 code
      end

      class Name < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Name.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Name.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Name.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'value' => {'type'=>'string', 'path'=>'Name.value', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/device-nametype'=>['registered-name', 'user-friendly-name', 'patient-reported-name']}, 'type'=>'CodeableConcept', 'path'=>'Name.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/device-nametype'}},
          'display' => {'type'=>'boolean', 'path'=>'Name.display', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :value             # 1-1 string
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :display           # 0-1 boolean
      end

      class DeviceVersion < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'DeviceVersion.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'DeviceVersion.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceVersion.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'urn:iso:std:iso:11073:10101'=>['531974', '531975', '531976', '531977', '532352']}, 'type'=>'CodeableConcept', 'path'=>'DeviceVersion.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-versiontype'}},
          'component' => {'type'=>'Identifier', 'path'=>'DeviceVersion.component', 'min'=>0, 'max'=>1},
          'installDate' => {'type'=>'dateTime', 'path'=>'DeviceVersion.installDate', 'min'=>0, 'max'=>1},
          'value' => {'type'=>'string', 'path'=>'DeviceVersion.value', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :component         # 0-1 Identifier
        attr_accessor :installDate       # 0-1 dateTime
        attr_accessor :value             # 1-1 string
      end

      class ConformsTo < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ConformsTo.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ConformsTo.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ConformsTo.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'category' => {'valid_codes'=>{'http://hl7.org/fhir/device-specification-category'=>['communication', 'performance', 'measurement', 'risk-class', 'electrical', 'material', 'exchange']}, 'type'=>'CodeableConcept', 'path'=>'ConformsTo.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-specification-category'}},
          'specification' => {'valid_codes'=>{'urn:iso:std:iso:11073:10101'=>['528391', '528404', '528425', '528402', '528409', '528390', '528457', '528401', '528455', '528403', '528405', '528388', '528397', '528408', '528426', '528392', '528399']}, 'type'=>'CodeableConcept', 'path'=>'ConformsTo.specification', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-specification-type'}},
          'version' => {'type'=>'string', 'path'=>'ConformsTo.version', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :category          # 0-1 CodeableConcept
        attr_accessor :specification     # 1-1 CodeableConcept
        attr_accessor :version           # 0-1 string
      end

      class Property < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['Quantity', 'CodeableConcept', 'string', 'boolean', 'integer', 'Range', 'Attachment']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'urn:iso:std:iso:11073:10101'=>['528391', '528404', '528425', '528402', '528409', '528390', '528457', '528401', '528455', '528403', '528405', '528388', '528397', '528408', '528426', '528392', '528399'], 'urn:oid:2.16.840.1.113883.6.276'=>['38017', '38663', '42347', '46352', '47264', '62163', '62260', '62423', '62414', '64587', '64992']}, 'type'=>'CodeableConcept', 'path'=>'Property.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/device-property-type'}},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueRange' => {'type'=>'Range', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :type                 # 1-1 CodeableConcept
        attr_accessor :valueQuantity        # 1-1 Quantity
        attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
        attr_accessor :valueString          # 1-1 string
        attr_accessor :valueBoolean         # 1-1 boolean
        attr_accessor :valueInteger         # 1-1 integer
        attr_accessor :valueRange           # 1-1 Range
        attr_accessor :valueAttachment      # 1-1 Attachment
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
      attr_accessor :definition            # 0-1 CodeableReference
      attr_accessor :udiCarrier            # 0-* [ Device::UdiCarrier ]
      attr_accessor :status                # 0-1 code
      attr_accessor :availabilityStatus    # 0-1 CodeableConcept
      attr_accessor :biologicalSourceEvent # 0-1 Identifier
      attr_accessor :manufacturer          # 0-1 string
      attr_accessor :manufactureDate       # 0-1 dateTime
      attr_accessor :expirationDate        # 0-1 dateTime
      attr_accessor :lotNumber             # 0-1 string
      attr_accessor :serialNumber          # 0-1 string
      attr_accessor :name                  # 0-* [ Device::Name ]
      attr_accessor :modelNumber           # 0-1 string
      attr_accessor :partNumber            # 0-1 string
      attr_accessor :category              # 0-* [ CodeableConcept ]
      attr_accessor :type                  # 0-* [ CodeableConcept ]
      attr_accessor :deviceVersion         # 0-* [ Device::DeviceVersion ]
      attr_accessor :conformsTo            # 0-* [ Device::ConformsTo ]
      attr_accessor :property              # 0-* [ Device::Property ]
      attr_accessor :mode                  # 0-1 CodeableConcept
      attr_accessor :cycle                 # 0-1 Count
      attr_accessor :duration              # 0-1 Duration
      attr_accessor :owner                 # 0-1 Reference(Organization)
      attr_accessor :contact               # 0-* [ ContactPoint ]
      attr_accessor :location              # 0-1 Reference(Location)
      attr_accessor :url                   # 0-1 uri
      attr_accessor :endpoint              # 0-* [ Reference(Endpoint) ]
      attr_accessor :gateway               # 0-* [ CodeableReference ]
      attr_accessor :note                  # 0-* [ Annotation ]
      attr_accessor :safety                # 0-* [ CodeableConcept ]
      attr_accessor :parent                # 0-1 Reference(Device)

      def resourceType
        'Device'
      end
    end
  end
end