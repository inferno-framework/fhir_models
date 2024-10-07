module FHIR
  module build.fhir.org
    class PersonalRelationship < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'PersonalRelationship.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'PersonalRelationship.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'PersonalRelationship.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'PersonalRelationship.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'PersonalRelationship.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'PersonalRelationship.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'PersonalRelationship.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'PersonalRelationship.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Person'], 'type'=>'Reference', 'path'=>'PersonalRelationship.source', 'min'=>1, 'max'=>1},
        'relationshipType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationType'=>['WIT'], 'http://terminology.hl7.org/CodeSystem/v3-RoleClass'=>['NOT', 'ECON', 'NOK', 'GUARD', 'DEPEN', 'EMP', 'GUAR', 'CAREGIVER'], 'http://terminology.hl7.org/CodeSystem/v2-0131'=>['E', 'O', 'U'], 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'=>['INTPRTER', 'POWATT', 'DPOWATT', 'HPOWATT', 'SPOWATT', 'BILL']}, 'type'=>'CodeableConcept', 'path'=>'PersonalRelationship.relationshipType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/PersonalRelationship-relationshiptype'}},
        'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Person'], 'type'=>'Reference', 'path'=>'PersonalRelationship.target', 'min'=>1, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'PersonalRelationship.period', 'min'=>0, 'max'=>Float::INFINITY},
        'confidence' => {'type'=>'CodeableConcept', 'path'=>'PersonalRelationship.confidence', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example'}},
        'asserter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'PersonalRelationship.asserter', 'min'=>0, 'max'=>1},
        'group' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'PersonalRelationship.group', 'min'=>0, 'max'=>Float::INFINITY}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :source            # 1-1 Reference(Patient|RelatedPerson|Person)
      attr_accessor :relationshipType  # 1-1 CodeableConcept
      attr_accessor :target            # 1-1 Reference(Patient|RelatedPerson|Person)
      attr_accessor :period            # 0-* [ Period ]
      attr_accessor :confidence        # 0-1 CodeableConcept
      attr_accessor :asserter          # 0-1 Reference(Patient|RelatedPerson|Practitioner|Organization)
      attr_accessor :group             # 0-* [ Reference(Group) ]

      def resourceType
        'PersonalRelationship'
      end
    end
  end
end