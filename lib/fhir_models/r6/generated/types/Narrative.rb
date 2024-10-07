module FHIR
  module build.fhir.org
    class Narrative < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Narrative.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Narrative.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/narrative-status'=>['generated', 'extensions', 'additional', 'empty']}, 'type'=>'code', 'path'=>'Narrative.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/narrative-status'}},
        'div' => {'type'=>'xhtml', 'path'=>'Narrative.div', 'min'=>1, 'max'=>1}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :status    # 1-1 code
      attr_accessor :div       # 1-1 xhtml
    end
  end
end