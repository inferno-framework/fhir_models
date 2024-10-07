module FHIR
  module build.fhir.org
    class Attachment < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Attachment.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Attachment.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'contentType' => {'type'=>'code', 'path'=>'Attachment.contentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
        'language' => {'type'=>'code', 'path'=>'Attachment.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'data' => {'type'=>'base64Binary', 'path'=>'Attachment.data', 'min'=>0, 'max'=>1},
        'url' => {'type'=>'url', 'path'=>'Attachment.url', 'min'=>0, 'max'=>1},
        'size' => {'type'=>'integer64', 'path'=>'Attachment.size', 'min'=>0, 'max'=>1},
        'hash' => {'type'=>'base64Binary', 'path'=>'Attachment.hash', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'Attachment.title', 'min'=>0, 'max'=>1},
        'creation' => {'type'=>'dateTime', 'path'=>'Attachment.creation', 'min'=>0, 'max'=>1},
        'height' => {'type'=>'positiveInt', 'path'=>'Attachment.height', 'min'=>0, 'max'=>1},
        'width' => {'type'=>'positiveInt', 'path'=>'Attachment.width', 'min'=>0, 'max'=>1},
        'frames' => {'type'=>'positiveInt', 'path'=>'Attachment.frames', 'min'=>0, 'max'=>1},
        'duration' => {'type'=>'decimal', 'path'=>'Attachment.duration', 'min'=>0, 'max'=>1},
        'pages' => {'type'=>'positiveInt', 'path'=>'Attachment.pages', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id          # 0-1 string
      attr_accessor :extension   # 0-* [ Extension ]
      attr_accessor :contentType # 0-1 code
      attr_accessor :language    # 0-1 code
      attr_accessor :data        # 0-1 base64Binary
      attr_accessor :url         # 0-1 url
      attr_accessor :size        # 0-1 integer64
      attr_accessor :hash        # 0-1 base64Binary
      attr_accessor :title       # 0-1 string
      attr_accessor :creation    # 0-1 dateTime
      attr_accessor :height      # 0-1 positiveInt
      attr_accessor :width       # 0-1 positiveInt
      attr_accessor :frames      # 0-1 positiveInt
      attr_accessor :duration    # 0-1 decimal
      attr_accessor :pages       # 0-1 positiveInt
    end
  end
end