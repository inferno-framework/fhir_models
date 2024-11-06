module FHIR
  module R6
    class Contributor < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Contributor.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Contributor.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/contributor-type'=>['author', 'editor', 'reviewer', 'endorser']}, 'type'=>'code', 'path'=>'Contributor.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/contributor-type'}},
        'name' => {'type'=>'string', 'path'=>'Contributor.name', 'min'=>1, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'Contributor.contact', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id        # 0-1 string
      attr_accessor :extension # 0-* [ Extension ]
      attr_accessor :type      # 1-1 code
      attr_accessor :name      # 1-1 string
      attr_accessor :contact   # 0-* [ ContactDetail ]
    end
  end
end