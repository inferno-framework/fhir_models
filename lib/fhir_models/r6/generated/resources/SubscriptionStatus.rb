module FHIR
  module R6
    class SubscriptionStatus < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SubscriptionStatus.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SubscriptionStatus.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SubscriptionStatus.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SubscriptionStatus.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SubscriptionStatus.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SubscriptionStatus.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SubscriptionStatus.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SubscriptionStatus.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/subscription-status'=>['requested', 'active', 'error', 'off', 'entered-in-error']}, 'type'=>'code', 'path'=>'SubscriptionStatus.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-status'}},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/subscription-notification-type'=>['handshake', 'heartbeat', 'event-notification', 'query-status', 'query-event']}, 'type'=>'code', 'path'=>'SubscriptionStatus.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-notification-type'}},
        'eventsSinceSubscriptionStart' => {'type'=>'integer64', 'path'=>'SubscriptionStatus.eventsSinceSubscriptionStart', 'min'=>0, 'max'=>1},
        'notificationEvent' => {'type'=>'SubscriptionStatus::NotificationEvent', 'path'=>'SubscriptionStatus.notificationEvent', 'min'=>0, 'max'=>Float::INFINITY},
        'subscription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Subscription'], 'type'=>'Reference', 'path'=>'SubscriptionStatus.subscription', 'min'=>1, 'max'=>1},
        'topic' => {'type'=>'canonical', 'path'=>'SubscriptionStatus.topic', 'min'=>0, 'max'=>1},
        'error' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/subscription-error'=>['dns-resolution-error', 'no-response', 'error-response']}, 'type'=>'CodeableConcept', 'path'=>'SubscriptionStatus.error', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-error'}}
      }

      class NotificationEvent < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'NotificationEvent.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'NotificationEvent.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'NotificationEvent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'eventNumber' => {'type'=>'integer64', 'path'=>'NotificationEvent.eventNumber', 'min'=>1, 'max'=>1},
          'triggerEvent' => {'type'=>'CodeableConcept', 'path'=>'NotificationEvent.triggerEvent', 'min'=>0, 'max'=>Float::INFINITY},
          'timestamp' => {'type'=>'instant', 'path'=>'NotificationEvent.timestamp', 'min'=>0, 'max'=>1},
          'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'NotificationEvent.focus', 'min'=>0, 'max'=>1},
          'additionalContext' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'NotificationEvent.additionalContext', 'min'=>0, 'max'=>Float::INFINITY},
          'relatedQuery' => {'type'=>'SubscriptionStatus::NotificationEvent::RelatedQuery', 'path'=>'NotificationEvent.relatedQuery', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class RelatedQuery < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'RelatedQuery.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'RelatedQuery.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedQuery.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'queryType' => {'type'=>'Coding', 'path'=>'RelatedQuery.queryType', 'min'=>0, 'max'=>1},
            'query' => {'type'=>'string', 'path'=>'RelatedQuery.query', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :queryType         # 0-1 Coding
          attr_accessor :query             # 1-1 string
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :eventNumber       # 1-1 integer64
        attr_accessor :triggerEvent      # 0-* [ CodeableConcept ]
        attr_accessor :timestamp         # 0-1 instant
        attr_accessor :focus             # 0-1 Reference(Resource)
        attr_accessor :additionalContext # 0-* [ Reference(Resource) ]
        attr_accessor :relatedQuery      # 0-* [ SubscriptionStatus::NotificationEvent::RelatedQuery ]
      end

      attr_accessor :id                           # 0-1 id
      attr_accessor :meta                         # 0-1 Meta
      attr_accessor :implicitRules                # 0-1 uri
      attr_accessor :language                     # 0-1 code
      attr_accessor :text                         # 0-1 Narrative
      attr_accessor :contained                    # 0-* [ Resource ]
      attr_accessor :extension                    # 0-* [ Extension ]
      attr_accessor :modifierExtension            # 0-* [ Extension ]
      attr_accessor :status                       # 0-1 code
      attr_accessor :type                         # 1-1 code
      attr_accessor :eventsSinceSubscriptionStart # 0-1 integer64
      attr_accessor :notificationEvent            # 0-* [ SubscriptionStatus::NotificationEvent ]
      attr_accessor :subscription                 # 1-1 Reference(Subscription)
      attr_accessor :topic                        # 0-1 canonical
      attr_accessor :error                        # 0-* [ CodeableConcept ]

      def resourceType
        'SubscriptionStatus'
      end
    end
  end
end