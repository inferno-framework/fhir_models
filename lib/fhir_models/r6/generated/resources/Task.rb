module FHIR
  module R6
    class Task < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['actor', 'authored-on', 'based-on', 'business-status', 'code', 'encounter', 'focus', 'group-identifier', 'identifier', 'input', 'intent', 'modified', 'output', 'owner', 'part-of', 'patient', 'performer', 'period', 'priority', 'requestedperformer-reference', 'requester', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Task.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Task.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Task.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Task.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Task.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Task.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Task.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Task.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Task.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'Task.instantiatesCanonical', 'min'=>0, 'max'=>1},
        'instantiatesUri' => {'type'=>'uri', 'path'=>'Task.instantiatesUri', 'min'=>0, 'max'=>1},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'groupIdentifier' => {'type'=>'Identifier', 'path'=>'Task.groupIdentifier', 'min'=>0, 'max'=>1},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'Task.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/task-status'=>['draft', 'requested', 'received', 'accepted', 'rejected', 'ready', 'cancelled', 'in-progress', 'on-hold', 'failed', 'completed', 'entered-in-error']}, 'type'=>'code', 'path'=>'Task.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/task-status'}},
        'statusReason' => {'type'=>'CodeableReference', 'path'=>'Task.statusReason', 'min'=>0, 'max'=>1},
        'businessStatus' => {'type'=>'CodeableConcept', 'path'=>'Task.businessStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example'}},
        'intent' => {'valid_codes'=>{'http://hl7.org/fhir/task-intent'=>['unknown'], 'http://hl7.org/fhir/request-intent'=>['proposal', 'plan', 'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order', 'option']}, 'type'=>'code', 'path'=>'Task.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/task-intent'}},
        'priority' => {'valid_codes'=>{'http://hl7.org/fhir/request-priority'=>['routine', 'urgent', 'asap', 'stat']}, 'type'=>'code', 'path'=>'Task.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-priority'}},
        'doNotPerform' => {'type'=>'boolean', 'path'=>'Task.doNotPerform', 'min'=>0, 'max'=>1},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/task-code'=>['approve', 'fulfill', 'instantiate', 'abort', 'replace', 'change', 'suspend', 'resume']}, 'type'=>'CodeableConcept', 'path'=>'Task.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/task-code'}},
        'description' => {'type'=>'markdown', 'path'=>'Task.description', 'min'=>0, 'max'=>1},
        'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.focus', 'min'=>0, 'max'=>1},
        'for' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Task.for', 'min'=>0, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Task.encounter', 'min'=>0, 'max'=>1},
        'requestedPeriod' => {'type'=>'Period', 'path'=>'Task.requestedPeriod', 'min'=>0, 'max'=>1},
        'executionPeriod' => {'type'=>'Period', 'path'=>'Task.executionPeriod', 'min'=>0, 'max'=>1},
        'authoredOn' => {'type'=>'dateTime', 'path'=>'Task.authoredOn', 'min'=>0, 'max'=>1},
        'lastModified' => {'type'=>'dateTime', 'path'=>'Task.lastModified', 'min'=>0, 'max'=>1},
        'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Task.requester', 'min'=>0, 'max'=>1},
        'requestedPerformer' => {'type'=>'CodeableReference', 'path'=>'Task.requestedPerformer', 'min'=>0, 'max'=>Float::INFINITY},
        'owner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Task.owner', 'min'=>0, 'max'=>1},
        'performer' => {'type'=>'Task::Performer', 'path'=>'Task.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Task.location', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'CodeableReference', 'path'=>'Task.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'insurance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage', 'http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Task.insurance', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'Task.note', 'min'=>0, 'max'=>Float::INFINITY},
        'relevantHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'Task.relevantHistory', 'min'=>0, 'max'=>Float::INFINITY},
        'restriction' => {'type'=>'Task::Restriction', 'path'=>'Task.restriction', 'min'=>0, 'max'=>1},
        'input' => {'type'=>'Task::Input', 'path'=>'Task.input', 'min'=>0, 'max'=>Float::INFINITY},
        'output' => {'type'=>'Task::Output', 'path'=>'Task.output', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Performer < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'function' => {'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example'}},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|RelatedPerson)
      end

      class Restriction < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Restriction.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Restriction.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Restriction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'repetitions' => {'type'=>'positiveInt', 'path'=>'Restriction.repetitions', 'min'=>0, 'max'=>1},
          'period' => {'type'=>'Period', 'path'=>'Restriction.period', 'min'=>0, 'max'=>1},
          'recipient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Restriction.recipient', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :repetitions       # 0-1 positiveInt
        attr_accessor :period            # 0-1 Period
        attr_accessor :recipient         # 0-* [ Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Group|Organization) ]
      end

      class Input < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['base64Binary', 'boolean', 'canonical', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'integer64', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'url', 'uuid', 'Address', 'Age', 'Annotation', 'Attachment', 'CodeableConcept', 'CodeableReference', 'Coding', 'ContactPoint', 'Count', 'Distance', 'Duration', 'HumanName', 'Identifier', 'Money', 'Period', 'Quantity', 'Range', 'Ratio', 'RatioRange', 'Reference', 'SampledData', 'Signature', 'Timing', 'ContactDetail', 'DataRequirement', 'Expression', 'ParameterDefinition', 'RelatedArtifact', 'TriggerDefinition', 'UsageContext', 'Availability', 'ExtendedContactDetail', 'Dosage', 'Meta']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Input.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example'}},
          'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueCanonical' => {'type'=>'canonical', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueCode' => {'type'=>'code', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueDecimal' => {'type'=>'decimal', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueId' => {'type'=>'id', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueInstant' => {'type'=>'instant', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger64' => {'type'=>'integer64', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueMarkdown' => {'type'=>'markdown', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueOid' => {'type'=>'oid', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueUri' => {'type'=>'uri', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueUrl' => {'type'=>'url', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueUuid' => {'type'=>'uuid', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueAddress' => {'type'=>'Address', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueAge' => {'type'=>'Age', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueCodeableReference' => {'type'=>'CodeableReference', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueCount' => {'type'=>'Count', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueDistance' => {'type'=>'Distance', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueDuration' => {'type'=>'Duration', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueHumanName' => {'type'=>'HumanName', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueMoney' => {'type'=>'Money', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valuePeriod' => {'type'=>'Period', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueRange' => {'type'=>'Range', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueRatio' => {'type'=>'Ratio', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueRatioRange' => {'type'=>'RatioRange', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueReference' => {'type'=>'Reference', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueSampledData' => {'type'=>'SampledData', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueSignature' => {'type'=>'Signature', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueTiming' => {'type'=>'Timing', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueContactDetail' => {'type'=>'ContactDetail', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueDataRequirement' => {'type'=>'DataRequirement', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueExpression' => {'type'=>'Expression', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueParameterDefinition' => {'type'=>'ParameterDefinition', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueRelatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueTriggerDefinition' => {'type'=>'TriggerDefinition', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueUsageContext' => {'type'=>'UsageContext', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueAvailability' => {'type'=>'Availability', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueExtendedContactDetail' => {'type'=>'ExtendedContactDetail', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueDosage' => {'type'=>'Dosage', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1},
          'valueMeta' => {'type'=>'Meta', 'path'=>'Input.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                         # 0-1 string
        attr_accessor :extension                  # 0-* [ Extension ]
        attr_accessor :modifierExtension          # 0-* [ Extension ]
        attr_accessor :type                       # 1-1 CodeableConcept
        attr_accessor :valueBase64Binary          # 1-1 base64Binary
        attr_accessor :valueBoolean               # 1-1 boolean
        attr_accessor :valueCanonical             # 1-1 canonical
        attr_accessor :valueCode                  # 1-1 code
        attr_accessor :valueDate                  # 1-1 date
        attr_accessor :valueDateTime              # 1-1 dateTime
        attr_accessor :valueDecimal               # 1-1 decimal
        attr_accessor :valueId                    # 1-1 id
        attr_accessor :valueInstant               # 1-1 instant
        attr_accessor :valueInteger               # 1-1 integer
        attr_accessor :valueInteger64             # 1-1 integer64
        attr_accessor :valueMarkdown              # 1-1 markdown
        attr_accessor :valueOid                   # 1-1 oid
        attr_accessor :valuePositiveInt           # 1-1 positiveInt
        attr_accessor :valueString                # 1-1 string
        attr_accessor :valueTime                  # 1-1 time
        attr_accessor :valueUnsignedInt           # 1-1 unsignedInt
        attr_accessor :valueUri                   # 1-1 uri
        attr_accessor :valueUrl                   # 1-1 url
        attr_accessor :valueUuid                  # 1-1 uuid
        attr_accessor :valueAddress               # 1-1 Address
        attr_accessor :valueAge                   # 1-1 Age
        attr_accessor :valueAnnotation            # 1-1 Annotation
        attr_accessor :valueAttachment            # 1-1 Attachment
        attr_accessor :valueCodeableConcept       # 1-1 CodeableConcept
        attr_accessor :valueCodeableReference     # 1-1 CodeableReference
        attr_accessor :valueCoding                # 1-1 Coding
        attr_accessor :valueContactPoint          # 1-1 ContactPoint
        attr_accessor :valueCount                 # 1-1 Count
        attr_accessor :valueDistance              # 1-1 Distance
        attr_accessor :valueDuration              # 1-1 Duration
        attr_accessor :valueHumanName             # 1-1 HumanName
        attr_accessor :valueIdentifier            # 1-1 Identifier
        attr_accessor :valueMoney                 # 1-1 Money
        attr_accessor :valuePeriod                # 1-1 Period
        attr_accessor :valueQuantity              # 1-1 Quantity
        attr_accessor :valueRange                 # 1-1 Range
        attr_accessor :valueRatio                 # 1-1 Ratio
        attr_accessor :valueRatioRange            # 1-1 RatioRange
        attr_accessor :valueReference             # 1-1 Reference()
        attr_accessor :valueSampledData           # 1-1 SampledData
        attr_accessor :valueSignature             # 1-1 Signature
        attr_accessor :valueTiming                # 1-1 Timing
        attr_accessor :valueContactDetail         # 1-1 ContactDetail
        attr_accessor :valueDataRequirement       # 1-1 DataRequirement
        attr_accessor :valueExpression            # 1-1 Expression
        attr_accessor :valueParameterDefinition   # 1-1 ParameterDefinition
        attr_accessor :valueRelatedArtifact       # 1-1 RelatedArtifact
        attr_accessor :valueTriggerDefinition     # 1-1 TriggerDefinition
        attr_accessor :valueUsageContext          # 1-1 UsageContext
        attr_accessor :valueAvailability          # 1-1 Availability
        attr_accessor :valueExtendedContactDetail # 1-1 ExtendedContactDetail
        attr_accessor :valueDosage                # 1-1 Dosage
        attr_accessor :valueMeta                  # 1-1 Meta
      end

      class Output < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['base64Binary', 'boolean', 'canonical', 'code', 'date', 'dateTime', 'decimal', 'id', 'instant', 'integer', 'integer64', 'markdown', 'oid', 'positiveInt', 'string', 'time', 'unsignedInt', 'uri', 'url', 'uuid', 'Address', 'Age', 'Annotation', 'Attachment', 'CodeableConcept', 'CodeableReference', 'Coding', 'ContactPoint', 'Count', 'Distance', 'Duration', 'HumanName', 'Identifier', 'Money', 'Period', 'Quantity', 'Range', 'Ratio', 'RatioRange', 'Reference', 'SampledData', 'Signature', 'Timing', 'ContactDetail', 'DataRequirement', 'Expression', 'ParameterDefinition', 'RelatedArtifact', 'TriggerDefinition', 'UsageContext', 'Availability', 'ExtendedContactDetail', 'Dosage', 'Meta']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Output.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Output.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Output.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Output.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example'}},
          'valueBase64Binary' => {'type'=>'base64Binary', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueCanonical' => {'type'=>'canonical', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueCode' => {'type'=>'code', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueDate' => {'type'=>'date', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueDecimal' => {'type'=>'decimal', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueId' => {'type'=>'id', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueInstant' => {'type'=>'instant', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger' => {'type'=>'integer', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueInteger64' => {'type'=>'integer64', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueMarkdown' => {'type'=>'markdown', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueOid' => {'type'=>'oid', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valuePositiveInt' => {'type'=>'positiveInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueTime' => {'type'=>'time', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueUnsignedInt' => {'type'=>'unsignedInt', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueUri' => {'type'=>'uri', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueUrl' => {'type'=>'url', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueUuid' => {'type'=>'uuid', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueAddress' => {'type'=>'Address', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueAge' => {'type'=>'Age', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueAnnotation' => {'type'=>'Annotation', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueCodeableReference' => {'type'=>'CodeableReference', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueCoding' => {'type'=>'Coding', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueContactPoint' => {'type'=>'ContactPoint', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueCount' => {'type'=>'Count', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueDistance' => {'type'=>'Distance', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueDuration' => {'type'=>'Duration', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueHumanName' => {'type'=>'HumanName', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueIdentifier' => {'type'=>'Identifier', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueMoney' => {'type'=>'Money', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valuePeriod' => {'type'=>'Period', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueRange' => {'type'=>'Range', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueRatio' => {'type'=>'Ratio', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueRatioRange' => {'type'=>'RatioRange', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueReference' => {'type'=>'Reference', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueSampledData' => {'type'=>'SampledData', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueSignature' => {'type'=>'Signature', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueTiming' => {'type'=>'Timing', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueContactDetail' => {'type'=>'ContactDetail', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueDataRequirement' => {'type'=>'DataRequirement', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueExpression' => {'type'=>'Expression', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueParameterDefinition' => {'type'=>'ParameterDefinition', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueRelatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueTriggerDefinition' => {'type'=>'TriggerDefinition', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueUsageContext' => {'type'=>'UsageContext', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueAvailability' => {'type'=>'Availability', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueExtendedContactDetail' => {'type'=>'ExtendedContactDetail', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueDosage' => {'type'=>'Dosage', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1},
          'valueMeta' => {'type'=>'Meta', 'path'=>'Output.value[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                         # 0-1 string
        attr_accessor :extension                  # 0-* [ Extension ]
        attr_accessor :modifierExtension          # 0-* [ Extension ]
        attr_accessor :type                       # 1-1 CodeableConcept
        attr_accessor :valueBase64Binary          # 1-1 base64Binary
        attr_accessor :valueBoolean               # 1-1 boolean
        attr_accessor :valueCanonical             # 1-1 canonical
        attr_accessor :valueCode                  # 1-1 code
        attr_accessor :valueDate                  # 1-1 date
        attr_accessor :valueDateTime              # 1-1 dateTime
        attr_accessor :valueDecimal               # 1-1 decimal
        attr_accessor :valueId                    # 1-1 id
        attr_accessor :valueInstant               # 1-1 instant
        attr_accessor :valueInteger               # 1-1 integer
        attr_accessor :valueInteger64             # 1-1 integer64
        attr_accessor :valueMarkdown              # 1-1 markdown
        attr_accessor :valueOid                   # 1-1 oid
        attr_accessor :valuePositiveInt           # 1-1 positiveInt
        attr_accessor :valueString                # 1-1 string
        attr_accessor :valueTime                  # 1-1 time
        attr_accessor :valueUnsignedInt           # 1-1 unsignedInt
        attr_accessor :valueUri                   # 1-1 uri
        attr_accessor :valueUrl                   # 1-1 url
        attr_accessor :valueUuid                  # 1-1 uuid
        attr_accessor :valueAddress               # 1-1 Address
        attr_accessor :valueAge                   # 1-1 Age
        attr_accessor :valueAnnotation            # 1-1 Annotation
        attr_accessor :valueAttachment            # 1-1 Attachment
        attr_accessor :valueCodeableConcept       # 1-1 CodeableConcept
        attr_accessor :valueCodeableReference     # 1-1 CodeableReference
        attr_accessor :valueCoding                # 1-1 Coding
        attr_accessor :valueContactPoint          # 1-1 ContactPoint
        attr_accessor :valueCount                 # 1-1 Count
        attr_accessor :valueDistance              # 1-1 Distance
        attr_accessor :valueDuration              # 1-1 Duration
        attr_accessor :valueHumanName             # 1-1 HumanName
        attr_accessor :valueIdentifier            # 1-1 Identifier
        attr_accessor :valueMoney                 # 1-1 Money
        attr_accessor :valuePeriod                # 1-1 Period
        attr_accessor :valueQuantity              # 1-1 Quantity
        attr_accessor :valueRange                 # 1-1 Range
        attr_accessor :valueRatio                 # 1-1 Ratio
        attr_accessor :valueRatioRange            # 1-1 RatioRange
        attr_accessor :valueReference             # 1-1 Reference()
        attr_accessor :valueSampledData           # 1-1 SampledData
        attr_accessor :valueSignature             # 1-1 Signature
        attr_accessor :valueTiming                # 1-1 Timing
        attr_accessor :valueContactDetail         # 1-1 ContactDetail
        attr_accessor :valueDataRequirement       # 1-1 DataRequirement
        attr_accessor :valueExpression            # 1-1 Expression
        attr_accessor :valueParameterDefinition   # 1-1 ParameterDefinition
        attr_accessor :valueRelatedArtifact       # 1-1 RelatedArtifact
        attr_accessor :valueTriggerDefinition     # 1-1 TriggerDefinition
        attr_accessor :valueUsageContext          # 1-1 UsageContext
        attr_accessor :valueAvailability          # 1-1 Availability
        attr_accessor :valueExtendedContactDetail # 1-1 ExtendedContactDetail
        attr_accessor :valueDosage                # 1-1 Dosage
        attr_accessor :valueMeta                  # 1-1 Meta
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :meta                  # 0-1 Meta
      attr_accessor :implicitRules         # 0-1 uri
      attr_accessor :language              # 0-1 code
      attr_accessor :text                  # 0-1 Narrative
      attr_accessor :contained             # 0-* [ Resource ]
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :identifier            # 0-* [ Identifier ]
      attr_accessor :instantiatesCanonical # 0-1 canonical
      attr_accessor :instantiatesUri       # 0-1 uri
      attr_accessor :basedOn               # 0-* [ Reference(Resource) ]
      attr_accessor :groupIdentifier       # 0-1 Identifier
      attr_accessor :partOf                # 0-* [ Reference(Task) ]
      attr_accessor :status                # 1-1 code
      attr_accessor :statusReason          # 0-1 CodeableReference
      attr_accessor :businessStatus        # 0-1 CodeableConcept
      attr_accessor :intent                # 1-1 code
      attr_accessor :priority              # 0-1 code
      attr_accessor :doNotPerform          # 0-1 boolean
      attr_accessor :code                  # 0-1 CodeableConcept
      attr_accessor :description           # 0-1 markdown
      attr_accessor :focus                 # 0-1 Reference(Resource)
      attr_accessor :for                   # 0-1 Reference(Resource)
      attr_accessor :encounter             # 0-1 Reference(Encounter)
      attr_accessor :requestedPeriod       # 0-1 Period
      attr_accessor :executionPeriod       # 0-1 Period
      attr_accessor :authoredOn            # 0-1 dateTime
      attr_accessor :lastModified          # 0-1 dateTime
      attr_accessor :requester             # 0-1 Reference(Device|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson)
      attr_accessor :requestedPerformer    # 0-* [ CodeableReference ]
      attr_accessor :owner                 # 0-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|RelatedPerson)
      attr_accessor :performer             # 0-* [ Task::Performer ]
      attr_accessor :location              # 0-1 Reference(Location)
      attr_accessor :reason                # 0-* [ CodeableReference ]
      attr_accessor :insurance             # 0-* [ Reference(Coverage|ClaimResponse) ]
      attr_accessor :note                  # 0-* [ Annotation ]
      attr_accessor :relevantHistory       # 0-* [ Reference(Provenance) ]
      attr_accessor :restriction           # 0-1 Task::Restriction
      attr_accessor :input                 # 0-* [ Task::Input ]
      attr_accessor :output                # 0-* [ Task::Output ]

      def resourceType
        'Task'
      end
    end
  end
end