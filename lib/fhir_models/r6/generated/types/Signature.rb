module FHIR
  module R6
    class Signature < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Signature.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Signature.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://uri.etsi.org/01903/v1.2.2'=>['ProofOfOrigin', 'ProofOfReceipt', 'ProofOfDelivery', 'ProofOfSender', 'ProofOfapproval', 'ProofOfCreation'], 'urn:iso-astm:E1762-95:2013'=>['1.2.840.10065.1.12.1.1', '1.2.840.10065.1.12.1.2', '1.2.840.10065.1.12.1.3', '1.2.840.10065.1.12.1.4', '1.2.840.10065.1.12.1.5', '1.2.840.10065.1.12.1.6', '1.2.840.10065.1.12.1.7', '1.2.840.10065.1.12.1.8', '1.2.840.10065.1.12.1.9', '1.2.840.10065.1.12.1.10', '1.2.840.10065.1.12.1.11', '1.2.840.10065.1.12.1.12', '1.2.840.10065.1.12.1.13', '1.2.840.10065.1.12.1.14', '1.2.840.10065.1.12.1.15', '1.2.840.10065.1.12.1.16', '1.2.840.10065.1.12.1.17', '1.2.840.10065.1.12.1.18']}, 'type'=>'Coding', 'path'=>'Signature.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/signature-type'}},
        'when' => {'type'=>'instant', 'path'=>'Signature.when', 'min'=>0, 'max'=>1},
        'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Signature.who', 'min'=>0, 'max'=>1},
        'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Signature.onBehalfOf', 'min'=>0, 'max'=>1},
        'targetFormat' => {'type'=>'code', 'path'=>'Signature.targetFormat', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
        'sigFormat' => {'type'=>'code', 'path'=>'Signature.sigFormat', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
        'data' => {'type'=>'base64Binary', 'path'=>'Signature.data', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id           # 0-1 string
      attr_accessor :extension    # 0-* [ Extension ]
      attr_accessor :type         # 0-* [ Coding ]
      attr_accessor :when         # 0-1 instant
      attr_accessor :who          # 0-1 Reference(Practitioner|PractitionerRole|RelatedPerson|Patient|Device|Organization)
      attr_accessor :onBehalfOf   # 0-1 Reference(Practitioner|PractitionerRole|RelatedPerson|Patient|Device|Organization)
      attr_accessor :targetFormat # 0-1 code
      attr_accessor :sigFormat    # 0-1 code
      attr_accessor :data         # 0-1 base64Binary
    end
  end
end