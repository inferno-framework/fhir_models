module FHIR
  module build.fhir.org
    class Practitioner < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'deceased' => ['boolean', 'dateTime']
      }
      SEARCH_PARAMS = ['active', 'address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'communication', 'death-date', 'deceased', 'email', 'family', 'gender', 'given', 'identifier', 'name', 'phone', 'phonetic', 'qualification-period', 'telecom']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Practitioner.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Practitioner.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Practitioner.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Practitioner.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Practitioner.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Practitioner.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Practitioner.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Practitioner.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Practitioner.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'active' => {'type'=>'boolean', 'path'=>'Practitioner.active', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'HumanName', 'path'=>'Practitioner.name', 'min'=>0, 'max'=>Float::INFINITY},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'Practitioner.telecom', 'min'=>0, 'max'=>Float::INFINITY},
        'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'Practitioner.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
        'birthDate' => {'type'=>'date', 'path'=>'Practitioner.birthDate', 'min'=>0, 'max'=>1},
        'deceasedBoolean' => {'type'=>'boolean', 'path'=>'Practitioner.deceased[x]', 'min'=>0, 'max'=>1},
        'deceasedDateTime' => {'type'=>'dateTime', 'path'=>'Practitioner.deceased[x]', 'min'=>0, 'max'=>1},
        'address' => {'type'=>'Address', 'path'=>'Practitioner.address', 'min'=>0, 'max'=>Float::INFINITY},
        'photo' => {'type'=>'Attachment', 'path'=>'Practitioner.photo', 'min'=>0, 'max'=>Float::INFINITY},
        'qualification' => {'type'=>'Practitioner::Qualification', 'path'=>'Practitioner.qualification', 'min'=>0, 'max'=>Float::INFINITY},
        'communication' => {'type'=>'Practitioner::Communication', 'path'=>'Practitioner.communication', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Qualification < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Qualification.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Qualification.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Qualification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Qualification.identifier', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0360'=>['PN', 'AAS', 'AA', 'ABA', 'AE', 'AS', 'BA', 'BBA', 'BE', 'BFA', 'BN', 'BS', 'BSL', 'BSN', 'BT', 'CER', 'CANP', 'CMA', 'CNP', 'CNM', 'CRN', 'CNS', 'CPNP', 'CTR', 'DIP', 'DBA', 'DED', 'PharmD', 'PHE', 'PHD', 'PHS', 'MD', 'DO', 'EMT', 'EMTP', 'FPNP', 'HS', 'JD', 'MA', 'MBA', 'MCE', 'MDI', 'MED', 'MEE', 'ME', 'MFA', 'MME', 'MS', 'MSL', 'MSN', 'MTH', 'MDA', 'MT', 'NG', 'NP', 'PA', 'RMA', 'RN', 'RPH', 'SEC', 'TS']}, 'type'=>'CodeableConcept', 'path'=>'Qualification.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0360'}},
          'status' => {'valid_codes'=>{'http://hl7.org/fhir/qualification-status'=>['active', 'inactive', 'in-progress', 'pending', 'temporary', 'conditional', 'suspended', 'revoked']}, 'type'=>'CodeableConcept', 'path'=>'Qualification.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/qualification-status'}},
          'period' => {'type'=>'Period', 'path'=>'Qualification.period', 'min'=>0, 'max'=>1},
          'issuer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Qualification.issuer', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 0-* [ Identifier ]
        attr_accessor :code              # 1-1 CodeableConcept
        attr_accessor :status            # 0-1 CodeableConcept
        attr_accessor :period            # 0-1 Period
        attr_accessor :issuer            # 0-1 Reference(Organization)
      end

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

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :active            # 0-1 boolean
      attr_accessor :name              # 0-* [ HumanName ]
      attr_accessor :telecom           # 0-* [ ContactPoint ]
      attr_accessor :gender            # 0-1 code
      attr_accessor :birthDate         # 0-1 date
      attr_accessor :deceasedBoolean   # 0-1 boolean
      attr_accessor :deceasedDateTime  # 0-1 dateTime
      attr_accessor :address           # 0-* [ Address ]
      attr_accessor :photo             # 0-* [ Attachment ]
      attr_accessor :qualification     # 0-* [ Practitioner::Qualification ]
      attr_accessor :communication     # 0-* [ Practitioner::Communication ]

      def resourceType
        'Practitioner'
      end
    end
  end
end