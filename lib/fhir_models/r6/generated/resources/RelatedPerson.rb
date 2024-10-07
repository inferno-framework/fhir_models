module FHIR
  module R6
    class RelatedPerson < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['active', 'address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'birthdate', 'email', 'family', 'gender', 'given', 'identifier', 'name', 'patient', 'phone', 'phonetic', 'relationship', 'role', 'telecom']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'RelatedPerson.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'RelatedPerson.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'RelatedPerson.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'RelatedPerson.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'RelatedPerson.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'RelatedPerson.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'RelatedPerson.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatedPerson.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'RelatedPerson.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'active' => {'type'=>'boolean', 'path'=>'RelatedPerson.active', 'min'=>0, 'max'=>1},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'RelatedPerson.patient', 'min'=>1, 'max'=>1},
        'relationship' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-RoleCode'=>['FAMMEMB', 'CHILD', 'CHLDADOPT', 'DAUADOPT', 'SONADOPT', 'CHLDFOST', 'DAUFOST', 'SONFOST', 'DAUC', 'DAU', 'STPDAU', 'NCHILD', 'SON', 'SONC', 'STPSON', 'STPCHLD', 'EXT', 'AUNT', 'MAUNT', 'PAUNT', 'COUSN', 'MCOUSN', 'PCOUSN', 'GGRPRN', 'GGRFTH', 'MGGRFTH', 'PGGRFTH', 'GGRMTH', 'MGGRMTH', 'PGGRMTH', 'MGGRPRN', 'PGGRPRN', 'GRNDCHILD', 'GRNDDAU', 'GRNDSON', 'GRPRN', 'GRFTH', 'MGRFTH', 'PGRFTH', 'GRMTH', 'MGRMTH', 'PGRMTH', 'MGRPRN', 'PGRPRN', 'INLAW', 'CHLDINLAW', 'DAUINLAW', 'SONINLAW', 'PRNINLAW', 'FTHINLAW', 'MTHINLAW', 'MTHINLOAW', 'SIBINLAW', 'BROINLAW', 'SISINLAW', 'SISLINLAW', 'NIENEPH', 'NEPHEW', 'NIECE', 'UNCLE', 'MUNCLE', 'PUNCLE', 'PRN', 'ADOPTP', 'ADOPTF', 'ADOPTM', 'FTH', 'FTHFOST', 'NFTH', 'NFTHF', 'STPFTH', 'MTH', 'GESTM', 'MTHFOST', 'NMTH', 'NMTHF', 'STPMTH', 'NPRN', 'PRNFOST', 'STPPRN', 'SIB', 'BRO', 'HBRO', 'NBRO', 'TWINBRO', 'FTWINBRO', 'ITWINBRO', 'STPBRO', 'HSIB', 'HSIS', 'NSIB', 'NSIS', 'TWINSIS', 'FTWINSIS', 'ITWINSIS', 'TWIN', 'FTWIN', 'ITWIN', 'SIS', 'STPSIS', 'STPSIB', 'SIGOTHR', 'DOMPART', 'FMRSPS', 'SPS', 'HUSB', 'WIFE', 'FRND', 'NBOR', 'ONESELF', 'ROOM']}, 'type'=>'CodeableConcept', 'path'=>'RelatedPerson.relationship', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-PersonalRelationshipRoleType'}},
        'role' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationType'=>['WIT'], 'http://terminology.hl7.org/CodeSystem/v3-RoleClass'=>['NOT', 'ECON', 'NOK', 'GUARD', 'DEPEN', 'EMP', 'GUAR', 'CAREGIVER'], 'http://terminology.hl7.org/CodeSystem/v2-0131'=>['E', 'O', 'U'], 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'=>['INTPRTER', 'POWATT', 'DPOWATT', 'HPOWATT', 'SPOWATT', 'BILL']}, 'type'=>'CodeableConcept', 'path'=>'RelatedPerson.role', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/relatedperson-relationshiptype'}},
        'name' => {'type'=>'HumanName', 'path'=>'RelatedPerson.name', 'min'=>0, 'max'=>Float::INFINITY},
        'telecom' => {'type'=>'ContactPoint', 'path'=>'RelatedPerson.telecom', 'min'=>0, 'max'=>Float::INFINITY},
        'gender' => {'valid_codes'=>{'http://hl7.org/fhir/administrative-gender'=>['male', 'female', 'other', 'unknown']}, 'type'=>'code', 'path'=>'RelatedPerson.gender', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/administrative-gender'}},
        'birthDate' => {'type'=>'date', 'path'=>'RelatedPerson.birthDate', 'min'=>0, 'max'=>1},
        'address' => {'type'=>'Address', 'path'=>'RelatedPerson.address', 'min'=>0, 'max'=>Float::INFINITY},
        'photo' => {'type'=>'Attachment', 'path'=>'RelatedPerson.photo', 'min'=>0, 'max'=>Float::INFINITY},
        'period' => {'type'=>'Period', 'path'=>'RelatedPerson.period', 'min'=>0, 'max'=>1},
        'communication' => {'type'=>'RelatedPerson::Communication', 'path'=>'RelatedPerson.communication', 'min'=>0, 'max'=>Float::INFINITY}
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
      attr_accessor :patient           # 1-1 Reference(Patient)
      attr_accessor :relationship      # 0-* [ CodeableConcept ]
      attr_accessor :role              # 0-* [ CodeableConcept ]
      attr_accessor :name              # 0-* [ HumanName ]
      attr_accessor :telecom           # 0-* [ ContactPoint ]
      attr_accessor :gender            # 0-1 code
      attr_accessor :birthDate         # 0-1 date
      attr_accessor :address           # 0-* [ Address ]
      attr_accessor :photo             # 0-* [ Attachment ]
      attr_accessor :period            # 0-1 Period
      attr_accessor :communication     # 0-* [ RelatedPerson::Communication ]

      def resourceType
        'RelatedPerson'
      end
    end
  end
end