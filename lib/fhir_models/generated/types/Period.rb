module FHIR
  module build.fhir.org
    class Period < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Period.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Period.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'start' => {'type'=>'dateTime', 'path'=>'Period.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'dateTime', 'path'=>'Period.end', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :start     # 0-1 dateTime
      attr_accessor :end       # 0-1 dateTime
    end
  end
end