module FHIR
  module R6
    class Bundle < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['composition', 'example-constraint', 'identifier', 'message', 'timestamp', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Bundle.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Bundle.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Bundle.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Bundle.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'identifier' => {'type'=>'Identifier', 'path'=>'Bundle.identifier', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/bundle-type'=>['document', 'message', 'transaction', 'transaction-response', 'batch', 'batch-response', 'history', 'searchset', 'collection', 'subscription-notification']}, 'type'=>'code', 'path'=>'Bundle.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/bundle-type'}},
        'timestamp' => {'type'=>'instant', 'path'=>'Bundle.timestamp', 'min'=>0, 'max'=>1},
        'total' => {'type'=>'unsignedInt', 'path'=>'Bundle.total', 'min'=>0, 'max'=>1},
        'link' => {'type'=>'Bundle::Link', 'path'=>'Bundle.link', 'min'=>0, 'max'=>Float::INFINITY},
        'entry' => {'type'=>'Bundle::Entry', 'path'=>'Bundle.entry', 'min'=>0, 'max'=>Float::INFINITY},
        'signature' => {'type'=>'Signature', 'path'=>'Bundle.signature', 'min'=>0, 'max'=>1},
        'issues' => {'type'=>'Resource', 'path'=>'Bundle.issues', 'min'=>0, 'max'=>1}
      }

      class Link < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Link.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Link.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Link.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'relation' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/iana-link-relations'=>['about', 'acl', 'alternate', 'amphtml', 'appendix', 'apple-touch-icon', 'apple-touch-startup-image', 'archives', 'author', 'blocked-by', 'bookmark', 'canonical', 'chapter', 'cite-as', 'collection', 'contents', 'convertedFrom', 'copyright', 'create-form', 'current', 'describedby', 'describes', 'disclosure', 'dns-prefetch', 'duplicate', 'edit', 'edit-form', 'edit-media', 'enclosure', 'external', 'first', 'glossary', 'help', 'hosts', 'hub', 'icon', 'index', 'intervalAfter', 'intervalBefore', 'intervalContains', 'intervalDisjoint', 'intervalDuring', 'intervalEquals', 'intervalFinishedBy', 'intervalFinishes', 'intervalIn', 'intervalMeets', 'intervalMetBy', 'intervalOverlappedBy', 'intervalOverlaps', 'intervalStartedBy', 'intervalStarts', 'item', 'last', 'latest-version', 'license', 'linkset', 'lrdd', 'manifest', 'mask-icon', 'media-feed', 'memento', 'micropub', 'modulepreload', 'monitor', 'monitor-group', 'next', 'next-archive', 'nofollow', 'noopener', 'noreferrer', 'opener', 'openid2.local_id', 'openid2.provider', 'original', 'P3Pv1', 'payment', 'pingback', 'preconnect', 'predecessor-version', 'prefetch', 'preload', 'prerender', 'prev', 'preview', 'previous', 'prev-archive', 'privacy-policy', 'profile', 'publication', 'related', 'restconf', 'replies', 'ruleinput', 'search', 'section', 'self', 'service', 'service-desc', 'service-doc', 'service-meta', 'sponsored', 'start', 'status', 'stylesheet', 'subsection', 'successor-version', 'sunset', 'tag', 'terms-of-service', 'timegate', 'timemap', 'type', 'ugc', 'up', 'version-history', 'via', 'webmention', 'working-copy', 'working-copy-of']}, 'type'=>'code', 'path'=>'Link.relation', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/iana-link-relations'}},
          'url' => {'type'=>'uri', 'path'=>'Link.url', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :relation          # 1-1 code
        attr_accessor :url               # 1-1 uri
      end

      class Entry < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Entry.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Entry.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Entry.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'link' => {'type'=>'Bundle::Link', 'path'=>'Entry.link', 'min'=>0, 'max'=>Float::INFINITY},
          'fullUrl' => {'type'=>'uri', 'path'=>'Entry.fullUrl', 'min'=>0, 'max'=>1},
          'resource' => {'type'=>'Resource', 'path'=>'Entry.resource', 'min'=>0, 'max'=>1},
          'search' => {'type'=>'Bundle::Entry::Search', 'path'=>'Entry.search', 'min'=>0, 'max'=>1},
          'request' => {'type'=>'Bundle::Entry::Request', 'path'=>'Entry.request', 'min'=>0, 'max'=>1},
          'response' => {'type'=>'Bundle::Entry::Response', 'path'=>'Entry.response', 'min'=>0, 'max'=>1}
        }

        class Search < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Search.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Search.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Search.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'mode' => {'valid_codes'=>{'http://hl7.org/fhir/search-entry-mode'=>['match', 'include', 'outcome']}, 'type'=>'code', 'path'=>'Search.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-entry-mode'}},
            'score' => {'type'=>'decimal', 'path'=>'Search.score', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :mode              # 0-1 code
          attr_accessor :score             # 0-1 decimal
        end

        class Request < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Request.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Request.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Request.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'method' => {'local_name'=>'local_method', 'valid_codes'=>{'http://hl7.org/fhir/http-verb'=>['GET', 'HEAD', 'POST', 'PUT', 'DELETE', 'PATCH']}, 'type'=>'code', 'path'=>'Request.method', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/http-verb'}},
            'url' => {'type'=>'uri', 'path'=>'Request.url', 'min'=>1, 'max'=>1},
            'ifNoneMatch' => {'type'=>'string', 'path'=>'Request.ifNoneMatch', 'min'=>0, 'max'=>1},
            'ifModifiedSince' => {'type'=>'instant', 'path'=>'Request.ifModifiedSince', 'min'=>0, 'max'=>1},
            'ifMatch' => {'type'=>'string', 'path'=>'Request.ifMatch', 'min'=>0, 'max'=>1},
            'ifNoneExist' => {'type'=>'string', 'path'=>'Request.ifNoneExist', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :local_method      # 1-1 code
          attr_accessor :url               # 1-1 uri
          attr_accessor :ifNoneMatch       # 0-1 string
          attr_accessor :ifModifiedSince   # 0-1 instant
          attr_accessor :ifMatch           # 0-1 string
          attr_accessor :ifNoneExist       # 0-1 string
        end

        class Response < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Response.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Response.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Response.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'status' => {'type'=>'string', 'path'=>'Response.status', 'min'=>1, 'max'=>1},
            'location' => {'type'=>'uri', 'path'=>'Response.location', 'min'=>0, 'max'=>1},
            'etag' => {'type'=>'string', 'path'=>'Response.etag', 'min'=>0, 'max'=>1},
            'lastModified' => {'type'=>'instant', 'path'=>'Response.lastModified', 'min'=>0, 'max'=>1},
            'outcome' => {'type'=>'Resource', 'path'=>'Response.outcome', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :status            # 1-1 string
          attr_accessor :location          # 0-1 uri
          attr_accessor :etag              # 0-1 string
          attr_accessor :lastModified      # 0-1 instant
          attr_accessor :outcome           # 0-1 Resource
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :link              # 0-* [ Bundle::Link ]
        attr_accessor :fullUrl           # 0-1 uri
        attr_accessor :resource          # 0-1 Resource
        attr_accessor :search            # 0-1 Bundle::Entry::Search
        attr_accessor :request           # 0-1 Bundle::Entry::Request
        attr_accessor :response          # 0-1 Bundle::Entry::Response
      end

      attr_accessor :id            # 0-1 id
      attr_accessor :meta          # 0-1 Meta
      attr_accessor :implicitRules # 0-1 uri
      attr_accessor :language      # 0-1 code
      attr_accessor :identifier    # 0-1 Identifier
      attr_accessor :type          # 1-1 code
      attr_accessor :timestamp     # 0-1 instant
      attr_accessor :total         # 0-1 unsignedInt
      attr_accessor :link          # 0-* [ Bundle::Link ]
      attr_accessor :entry         # 0-* [ Bundle::Entry ]
      attr_accessor :signature     # 0-1 Signature
      attr_accessor :issues        # 0-1 Resource

      def resourceType
        'Bundle'
      end
    end
  end
end