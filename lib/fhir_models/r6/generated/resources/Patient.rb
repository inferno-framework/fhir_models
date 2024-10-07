module FHIR
  module build.fhir.org
    class Patient < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'deceased' => ['boolean', 'dateTime'],
        'multipleBirth' => ['boolean', 'integer']
      }
      SEARCH_PARAMS = ['active', 'address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'birthdate', 'death-date', 'deceased', 'email', 'family', 'gender', 'general-practitioner', 'given', 'identifier', 'language', 'link', 'name', 'organization', 'phone', 'phonetic', 'telecom']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Patient.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Patient.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Patient.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Patient.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Patient.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Patient.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Patient.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Patient.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Patient.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'active' => {'type'=>'boolean', 'path'=>'Patient.active', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'HumanName', 'path'=>'Patient.name', 'min'=>0, 'max'=>Float::INFINITY},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'Patient.telecom', 'min'=>0, 'max'=>Float::INFINITY},
        'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'Patient.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
        'birthDate' => {'type'=>'date', 'path'=>'Patient.birthDate', 'min'=>0, 'max'=>1},
        'deceasedBoolean' => {'type'=>'boolean', 'path'=>'Patient.deceased[x]', 'min'=>0, 'max'=>1},
        'deceasedDateTime' => {'type'=>'dateTime', 'path'=>'Patient.deceased[x]', 'min'=>0, 'max'=>1},
        'address' => {'type'=>'Address', 'path'=>'Patient.address', 'min'=>0, 'max'=>Float::INFINITY},
        'maritalStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-MaritalStatus'=>['A', 'D', 'I', 'L', 'M', 'C', 'P', 'T', 'U', 'S', 'W'], 'http://terminology.hl7.org/CodeSystem/v3-NullFlavor'=>['UNK']}, 'type'=>'CodeableConcept', 'path'=>'Patient.maritalStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/marital-status'}},
        'multipleBirthBoolean' => {'type'=>'boolean', 'path'=>'Patient.multipleBirth[x]', 'min'=>0, 'max'=>1},
        'multipleBirthInteger' => {'type'=>'integer', 'path'=>'Patient.multipleBirth[x]', 'min'=>0, 'max'=>1},
        'photo' => {'type'=>'Attachment', 'path'=>'Patient.photo', 'min'=>0, 'max'=>Float::INFINITY},
        'contact' => {'type'=>'Patient::Contact', 'path'=>'Patient.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'communication' => {'type'=>'Patient::Communication', 'path'=>'Patient.communication', 'min'=>0, 'max'=>Float::INFINITY},
        'generalPractitioner' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Patient.generalPractitioner', 'min'=>0, 'max'=>Float::INFINITY},
        'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Patient.managingOrganization', 'min'=>0, 'max'=>1},
        'link' => {'type'=>'Patient::Link', 'path'=>'Patient.link', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Contact < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Contact.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Contact.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Contact.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'relationship' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-RoleCode'=>['FAMMEMB', 'CHILD', 'CHLDADOPT', 'DAUADOPT', 'SONADOPT', 'CHLDFOST', 'DAUFOST', 'SONFOST', 'DAUC', 'DAU', 'STPDAU', 'NCHILD', 'SON', 'SONC', 'STPSON', 'STPCHLD', 'EXT', 'AUNT', 'MAUNT', 'PAUNT', 'COUSN', 'MCOUSN', 'PCOUSN', 'GGRPRN', 'GGRFTH', 'MGGRFTH', 'PGGRFTH', 'GGRMTH', 'MGGRMTH', 'PGGRMTH', 'MGGRPRN', 'PGGRPRN', 'GRNDCHILD', 'GRNDDAU', 'GRNDSON', 'GRPRN', 'GRFTH', 'MGRFTH', 'PGRFTH', 'GRMTH', 'MGRMTH', 'PGRMTH', 'MGRPRN', 'PGRPRN', 'INLAW', 'CHLDINLAW', 'DAUINLAW', 'SONINLAW', 'PRNINLAW', 'FTHINLAW', 'MTHINLAW', 'MTHINLOAW', 'SIBINLAW', 'BROINLAW', 'SISINLAW', 'SISLINLAW', 'NIENEPH', 'NEPHEW', 'NIECE', 'UNCLE', 'MUNCLE', 'PUNCLE', 'PRN', 'ADOPTP', 'ADOPTF', 'ADOPTM', 'FTH', 'FTHFOST', 'NFTH', 'NFTHF', 'STPFTH', 'MTH', 'GESTM', 'MTHFOST', 'NMTH', 'NMTHF', 'STPMTH', 'NPRN', 'PRNFOST', 'STPPRN', 'SIB', 'BRO', 'HBRO', 'NBRO', 'TWINBRO', 'FTWINBRO', 'ITWINBRO', 'STPBRO', 'HSIB', 'HSIS', 'NSIB', 'NSIS', 'TWINSIS', 'FTWINSIS', 'ITWINSIS', 'TWIN', 'FTWIN', 'ITWIN', 'SIS', 'STPSIS', 'STPSIB', 'SIGOTHR', 'DOMPART', 'FMRSPS', 'SPS', 'HUSB', 'WIFE', 'FRND', 'NBOR', 'ONESELF', 'ROOM']}, 'type'=>'CodeableConcept', 'path'=>'Contact.relationship', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-PersonalRelationshipRoleType'}},
          'role' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationType'=>['WIT'], 'http://terminology.hl7.org/CodeSystem/v3-RoleClass'=>['NOT', 'ECON', 'NOK', 'GUARD', 'DEPEN', 'EMP', 'GUAR', 'CAREGIVER'], 'http://terminology.hl7.org/CodeSystem/v2-0131'=>['E', 'O', 'U'], 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'=>['INTPRTER', 'POWATT', 'DPOWATT', 'HPOWATT', 'SPOWATT', 'BILL']}, 'type'=>'CodeableConcept', 'path'=>'Contact.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype'}},
          'name' => {'type'=>'HumanName', 'path'=>'Contact.name', 'min'=>0, 'max'=>1},
          'additionalName' => {'type'=>'HumanName', 'path'=>'Contact.additionalName', 'min'=>0, 'max'=>Float::INFINITY},
          'telecom' => {'type'=>'ContactPoint', 'path'=>'Contact.telecom', 'min'=>0, 'max'=>Float::INFINITY},
          'address' => {'type'=>'Address', 'path'=>'Contact.address', 'min'=>0, 'max'=>1},
          'additionalAddress' => {'type'=>'Address', 'path'=>'Contact.additionalAddress', 'min'=>0, 'max'=>Float::INFINITY},
          'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'Contact.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
          'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Contact.organization', 'min'=>0, 'max'=>1},
          'period' => {'type'=>'Period', 'path'=>'Contact.period', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :relationship      # 0-* [ CodeableConcept ]
        attr_accessor :role              # 0-* [ CodeableConcept ]
        attr_accessor :name              # 0-1 HumanName
        attr_accessor :additionalName    # 0-* [ HumanName ]
        attr_accessor :telecom           # 0-* [ ContactPoint ]
        attr_accessor :address           # 0-1 Address
        attr_accessor :additionalAddress # 0-* [ Address ]
        attr_accessor :gender            # 0-1 code
        attr_accessor :organization      # 0-1 Reference(Organization)
        attr_accessor :period            # 0-1 Period
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

      class Link < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Link.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Link.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Link.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'other' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Link.other', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/link-type'=>['replaced-by', 'replaces', 'refer', 'seealso']}, 'type'=>'code', 'path'=>'Link.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/link-type'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :other             # 1-1 Reference(Patient|RelatedPerson)
        attr_accessor :type              # 1-1 code
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
      attr_accessor :multipleBirthBoolean # 0-1 boolean
      attr_accessor :multipleBirthInteger # 0-1 integer
      attr_accessor :photo                # 0-* [ Attachment ]
      attr_accessor :contact              # 0-* [ Patient::Contact ]
      attr_accessor :communication        # 0-* [ Patient::Communication ]
      attr_accessor :generalPractitioner  # 0-* [ Reference(Organization|Practitioner|PractitionerRole) ]
      attr_accessor :managingOrganization # 0-1 Reference(Organization)
      attr_accessor :link                 # 0-* [ Patient::Link ]

      def resourceType
        'Patient'
      end
    end
  end
end