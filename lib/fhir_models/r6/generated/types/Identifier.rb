module FHIR
  module R6
    class Identifier < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Identifier.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Identifier.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'use' => {'valid_codes'=>{'http://hl7.org/fhir/identifier-use'=>['usual', 'official', 'temp', 'secondary', 'old']}, 'type'=>'code', 'path'=>'Identifier.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/identifier-use'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0203'=>['DL', 'PPN', 'BRN', 'MR', 'MCN', 'EN', 'TAX', 'NIIP', 'PRN', 'MD', 'DR', 'ACSN', 'UDI', 'SNO', 'SB', 'PLAC', 'FILL', 'JHN']}, 'type'=>'CodeableConcept', 'path'=>'Identifier.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/identifier-type'}},
        'system' => {'type'=>'uri', 'path'=>'Identifier.system', 'min'=>0, 'max'=>1},
        'value' => {'type'=>'string', 'path'=>'Identifier.value', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Identifier.period', 'min'=>0, 'max'=>1},
        'assigner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Identifier.assigner', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :use       # 0-1 code
      attr_accessor :type      # 0-1 CodeableConcept
      attr_accessor :system    # 0-1 uri
      attr_accessor :value     # 0-1 string
      attr_accessor :period    # 0-1 Period
      attr_accessor :assigner  # 0-1 Reference(Organization)
    end
  end
end