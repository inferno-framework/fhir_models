module FHIR
  module R6
    class MonetaryComponent < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'MonetaryComponent.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'MonetaryComponent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/price-component-type'=>['base', 'surcharge', 'discount', 'tax', 'informational']}, 'type'=>'code', 'path'=>'MonetaryComponent.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/price-component-type'}},
        'code' => {'type'=>'CodeableConcept', 'path'=>'MonetaryComponent.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example'}},
        'factor' => {'type'=>'decimal', 'path'=>'MonetaryComponent.factor', 'min'=>0, 'max'=>1},
        'amount' => {'type'=>'Money', 'path'=>'MonetaryComponent.amount', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :type      # 1-1 code
      attr_accessor :code      # 0-1 CodeableConcept
      attr_accessor :factor    # 0-1 decimal
      attr_accessor :amount    # 0-1 Money
    end
  end
end