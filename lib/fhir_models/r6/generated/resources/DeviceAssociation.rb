module FHIR
  module build.fhir.org
    class DeviceAssociation < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['device', 'identifier', 'operator', 'patient', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'DeviceAssociation.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'DeviceAssociation.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'DeviceAssociation.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'DeviceAssociation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'DeviceAssociation.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'DeviceAssociation.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'DeviceAssociation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'DeviceAssociation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'DeviceAssociation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceAssociation.device', 'min'=>1, 'max'=>1},
        'category' => {'type'=>'CodeableConcept', 'path'=>'DeviceAssociation.category', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/deviceassociation-status'=>['implanted', 'explanted', 'entered-in-error', 'attached', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'DeviceAssociation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/deviceassociation-status'}},
        'statusReason' => {'valid_codes'=>{'http://hl7.org/fhir/deviceassociation-status-reason'=>['attached', 'disconnected', 'failed', 'placed', 'replaced']}, 'type'=>'CodeableConcept', 'path'=>'DeviceAssociation.statusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/deviceassociation-status-reason'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'DeviceAssociation.subject', 'min'=>0, 'max'=>1},
        'bodyStructure' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/BodyStructure'], 'type'=>'Reference', 'path'=>'DeviceAssociation.bodyStructure', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'DeviceAssociation.period', 'min'=>0, 'max'=>1},
        'operation' => {'type'=>'DeviceAssociation::Operation', 'path'=>'DeviceAssociation.operation', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Operation < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Operation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Operation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Operation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'status' => {'valid_codes'=>{'http://hl7.org/fhir/deviceassociation-operationstatus'=>['on', 'off', 'standby', 'defective', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'Operation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/deviceassociation-operationstatus'}},
          'operator' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Operation.operator', 'min'=>0, 'max'=>Float::INFINITY},
          'period' => {'type'=>'Period', 'path'=>'Operation.period', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :status            # 1-1 CodeableConcept
        attr_accessor :operator          # 0-* [ Reference(Patient|Practitioner|RelatedPerson) ]
        attr_accessor :period            # 0-1 Period
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :device            # 1-1 Reference(Device)
      attr_accessor :category          # 0-* [ CodeableConcept ]
      attr_accessor :status            # 1-1 CodeableConcept
      attr_accessor :statusReason      # 0-* [ CodeableConcept ]
      attr_accessor :subject           # 0-1 Reference(Patient|Group|Practitioner|RelatedPerson|Device)
      attr_accessor :bodyStructure     # 0-1 Reference(BodyStructure)
      attr_accessor :period            # 0-1 Period
      attr_accessor :operation         # 0-* [ DeviceAssociation::Operation ]

      def resourceType
        'DeviceAssociation'
      end
    end
  end
end