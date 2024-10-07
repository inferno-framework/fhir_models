module FHIR
  module build.fhir.org
    class Range < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Range.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Range.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'low' => {'type'=>'Quantity', 'path'=>'Range.low', 'min'=>0, 'max'=>1},
        'high' => {'type'=>'Quantity', 'path'=>'Range.high', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :low       # 0-1 Quantity
      attr_accessor :high      # 0-1 Quantity
    end
  end
end