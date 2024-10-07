module FHIR
  module R6
    class Expression < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'Expression.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'Expression.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'Expression.description', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'code', 'path'=>'Expression.name', 'min'=>0, 'max'=>1},
        'language' => {'valid_codes'=>{'urn:ietf:bcp:13'=>['text/cql', 'text/fhirpath', 'text/x-fhir-query', 'text/cql-identifier', 'text/cql-expression']}, 'type'=>'code', 'path'=>'Expression.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'additional'=>[{'purpose'=>'maximum', 'valueSet'=>'http://hl7.org/fhir/ValueSet/mimetypes'}], 'uri'=>'http://hl7.org/fhir/ValueSet/expression-language'}},
        'expression' => {'type'=>'string', 'path'=>'Expression.expression', 'min'=>0, 'max'=>1},
        'reference' => {'type'=>'uri', 'path'=>'Expression.reference', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id          # 0-1 string
      attr_accessor :extension   # 0-* [ Extension ]
      attr_accessor :description # 0-1 string
      attr_accessor :name        # 0-1 code
      attr_accessor :language    # 0-1 code
      attr_accessor :expression  # 0-1 string
      attr_accessor :reference   # 0-1 uri
    end
  end
end