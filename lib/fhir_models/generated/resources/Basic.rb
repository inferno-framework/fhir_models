module FHIR
  module build.fhir.org
    class Basic < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['author', 'code', 'created', 'identifier', 'patient', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Basic.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Basic.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Basic.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Basic.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Basic.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Basic.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Basic.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Basic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Basic.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'code' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/basic-resource-type'=>['consent', 'referral', 'advevent', 'aptmtreq', 'transfer', 'diet', 'adminact', 'exposure', 'investigation', 'account', 'invoice', 'adjudicat', 'predetreq', 'predetermine', 'study', 'protocol']}, 'type'=>'CodeableConcept', 'path'=>'Basic.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/basic-resource-type'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Basic.subject', 'min'=>0, 'max'=>1},
        'created' => {'type'=>'dateTime', 'path'=>'Basic.created', 'min'=>0, 'max'=>1},
        'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'Basic.author', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :code              # 1-1 CodeableConcept
      attr_accessor :subject           # 0-1 Reference(Resource)
      attr_accessor :created           # 0-1 dateTime
      attr_accessor :author            # 0-1 Reference(Practitioner|PractitionerRole|Patient|RelatedPerson|Organization|Device|CareTeam)

      def resourceType
        'Basic'
      end
    end
  end
end