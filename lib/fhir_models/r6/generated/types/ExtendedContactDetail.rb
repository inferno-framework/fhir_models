module FHIR
  module R6
    class ExtendedContactDetail < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ExtendedContactDetail.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ExtendedContactDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'purpose' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/contactentity-type'=>['BILL', 'ADMIN', 'HR', 'PAYOR', 'PATINF', 'PRESS']}, 'type'=>'CodeableConcept', 'path'=>'ExtendedContactDetail.purpose', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/contactentity-type'}},
        'name' => {'type'=>'HumanName', 'path'=>'ExtendedContactDetail.name', 'min'=>0, 'max'=>Float::INFINITY},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'ExtendedContactDetail.telecom', 'min'=>0, 'max'=>Float::INFINITY},
        'address' => {'type'=>'Address', 'path'=>'ExtendedContactDetail.address', 'min'=>0, 'max'=>1},
        'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ExtendedContactDetail.organization', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'ExtendedContactDetail.period', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id           # 0-1 string
      attr_accessor :extension    # 0-* [ Extension ]
      attr_accessor :purpose      # 0-1 CodeableConcept
      attr_accessor :name         # 0-* [ HumanName ]
      attr_accessor :telecom      # 0-* [ ContactPoint ]
      attr_accessor :address      # 0-1 Address
      attr_accessor :organization # 0-1 Reference(Organization)
      attr_accessor :period       # 0-1 Period
    end
  end
end