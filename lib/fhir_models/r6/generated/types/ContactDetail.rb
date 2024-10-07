module FHIR
  module build.fhir.org
    class ContactDetail < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ContactDetail.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ContactDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'ContactDetail.name', 'min'=>0, 'max'=>1},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'ContactDetail.telecom', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :name      # 0-1 string
      attr_accessor :telecom   # 0-* [ ContactPoint ]
    end
  end
end