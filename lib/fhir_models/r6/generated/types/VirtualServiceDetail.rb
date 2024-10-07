module FHIR
  module build.fhir.org
    class VirtualServiceDetail < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'address' => ['url', 'string', 'ContactPoint', 'ExtendedContactDetail']
      }
      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'VirtualServiceDetail.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'VirtualServiceDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'channelType' => {'valid_codes'=>{'http://hl7.org/fhir/virtual-service-type'=>['zoom', 'ms-teams', 'whatsapp']}, 'type'=>'Coding', 'path'=>'VirtualServiceDetail.channelType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/virtual-service-type'}},
        'addressUrl' => {'type'=>'url', 'path'=>'VirtualServiceDetail.address[x]', 'min'=>0, 'max'=>1},
        'addressString' => {'type'=>'string', 'path'=>'VirtualServiceDetail.address[x]', 'min'=>0, 'max'=>1},
        'addressContactPoint' => {'type'=>'ContactPoint', 'path'=>'VirtualServiceDetail.address[x]', 'min'=>0, 'max'=>1},
        'addressExtendedContactDetail' => {'type'=>'ExtendedContactDetail', 'path'=>'VirtualServiceDetail.address[x]', 'min'=>0, 'max'=>1},
        'additionalInfo' => {'type'=>'url', 'path'=>'VirtualServiceDetail.additionalInfo', 'min'=>0, 'max'=>Float::INFINITY},
        'maxParticipants' => {'type'=>'positiveInt', 'path'=>'VirtualServiceDetail.maxParticipants', 'min'=>0, 'max'=>1},
        'sessionKey' => {'type'=>'string', 'path'=>'VirtualServiceDetail.sessionKey', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                           # 0-1 string
      attr_accessor :extension                    # 0-* [ Extension ]
      attr_accessor :channelType                  # 0-1 Coding
      attr_accessor :addressUrl                   # 0-1 url
      attr_accessor :addressString                # 0-1 string
      attr_accessor :addressContactPoint          # 0-1 ContactPoint
      attr_accessor :addressExtendedContactDetail # 0-1 ExtendedContactDetail
      attr_accessor :additionalInfo               # 0-* [ url ]
      attr_accessor :maxParticipants              # 0-1 positiveInt
      attr_accessor :sessionKey                   # 0-1 string
    end
  end
end