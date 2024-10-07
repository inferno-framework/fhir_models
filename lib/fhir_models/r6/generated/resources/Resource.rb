module FHIR
  module build.fhir.org
    class Resource < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['_id', '_id', '_in', '_language', '_lastUpdated', '_profile', '_security', '_source', '_tag', 'administered-by', 'annunciator-concept', 'annunciator-device', 'code', 'contact-address', 'contact-address-city', 'contact-address-country', 'contact-address-postalcode', 'contact-address-state', 'contact-address-use', 'derived-from', 'endpoint', 'identifier', 'identifier', 'identifier', 'indication', 'manifestation', 'name', 'owned-by', 'patient', 'patient', 'phonetic', 'presence', 'priority', 'relationship', 'signal-presence', 'source', 'source', 'status', 'status', 'subject', 'target', 'timing', 'type', 'type', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Resource.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Resource.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Resource.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Resource.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}}
      }

      attr_accessor :id            # 0-1 id
      attr_accessor :meta          # 0-1 Meta
      attr_accessor :implicitRules # 0-1 uri
      attr_accessor :language      # 0-1 code

      def resourceType
        'Resource'
      end
    end
  end
end