module FHIR
  module R6
    class Person < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'deceased' => ['boolean', 'dateTime']
      }
      SEARCH_PARAMS = ['address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'birthdate', 'death-date', 'deceased', 'email', 'family', 'gender', 'given', 'identifier', 'link', 'name', 'organization', 'patient', 'phone', 'phonetic', 'practitioner', 'relatedperson', 'telecom']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Person.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Person.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Person.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Person.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Person.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Person.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Person.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Person.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Person.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'active' => {'type'=>'boolean', 'path'=>'Person.active', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'HumanName', 'path'=>'Person.name', 'min'=>0, 'max'=>Float::INFINITY},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'Person.telecom', 'min'=>0, 'max'=>Float::INFINITY},
        'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'Person.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
        'birthDate' => {'type'=>'date', 'path'=>'Person.birthDate', 'min'=>0, 'max'=>1},
        'deceasedBoolean' => {'type'=>'boolean', 'path'=>'Person.deceased[x]', 'min'=>0, 'max'=>1},
        'deceasedDateTime' => {'type'=>'dateTime', 'path'=>'Person.deceased[x]', 'min'=>0, 'max'=>1},
        'address' => {'type'=>'Address', 'path'=>'Person.address', 'min'=>0, 'max'=>Float::INFINITY},
        'maritalStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-MaritalStatus'=>['A', 'D', 'I', 'L', 'M', 'C', 'P', 'T', 'U', 'S', 'W'], 'http://terminology.hl7.org/CodeSystem/v3-NullFlavor'=>['UNK']}, 'type'=>'CodeableConcept', 'path'=>'Person.maritalStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/marital-status'}},
        'photo' => {'type'=>'Attachment', 'path'=>'Person.photo', 'min'=>0, 'max'=>Float::INFINITY},
        'communication' => {'type'=>'Person::Communication', 'path'=>'Person.communication', 'min'=>0, 'max'=>Float::INFINITY},
        'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Person.managingOrganization', 'min'=>0, 'max'=>1},
        'link' => {'type'=>'Person::Link', 'path'=>'Person.link', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Communication < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Communication.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Communication.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Communication.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'language' => {'type'=>'CodeableConcept', 'path'=>'Communication.language', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
          'preferred' => {'type'=>'boolean', 'path'=>'Communication.preferred', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :language          # 1-1 CodeableConcept
        attr_accessor :preferred         # 0-1 boolean
      end

      class Link < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Link.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Link.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Link.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Person'], 'type'=>'Reference', 'path'=>'Link.target', 'min'=>1, 'max'=>1},
          'assurance' => {'valid_codes'=>{'http://hl7.org/fhir/identity-assuranceLevel'=>['level1', 'level2', 'level3', 'level4']}, 'type'=>'code', 'path'=>'Link.assurance', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/identity-assuranceLevel'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :target            # 1-1 Reference(Patient|Practitioner|RelatedPerson|Person)
        attr_accessor :assurance         # 0-1 code
      end

      attr_accessor :id                   # 0-1 id
      attr_accessor :meta                 # 0-1 Meta
      attr_accessor :implicitRules        # 0-1 uri
      attr_accessor :language             # 0-1 code
      attr_accessor :text                 # 0-1 Narrative
      attr_accessor :contained            # 0-* [ Resource ]
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :identifier           # 0-* [ Identifier ]
      attr_accessor :active               # 0-1 boolean
      attr_accessor :name                 # 0-* [ HumanName ]
      attr_accessor :telecom              # 0-* [ ContactPoint ]
      attr_accessor :gender               # 0-1 code
      attr_accessor :birthDate            # 0-1 date
      attr_accessor :deceasedBoolean      # 0-1 boolean
      attr_accessor :deceasedDateTime     # 0-1 dateTime
      attr_accessor :address              # 0-* [ Address ]
      attr_accessor :maritalStatus        # 0-1 CodeableConcept
      attr_accessor :photo                # 0-* [ Attachment ]
      attr_accessor :communication        # 0-* [ Person::Communication ]
      attr_accessor :managingOrganization # 0-1 Reference(Organization)
      attr_accessor :link                 # 0-* [ Person::Link ]

      def resourceType
        'Person'
      end
    end
  end
end