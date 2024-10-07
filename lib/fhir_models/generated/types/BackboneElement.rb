module FHIR
  module build.fhir.org
    class BackboneElement < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'BackboneElement.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'BackboneElement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'BackboneElement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
    end
  end
end