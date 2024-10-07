module FHIR
  module build.fhir.org
    class Organization < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['active', 'address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'endpoint', 'identifier', 'name', 'partof', 'phonetic', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Organization.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Organization.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Organization.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Organization.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Organization.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Organization.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Organization.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Organization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Organization.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'active' => {'type'=>'boolean', 'path'=>'Organization.active', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/organization-type'=>['prov', 'dept', 'team', 'govt', 'ins', 'pay', 'edu', 'reli', 'crs', 'cg', 'bus', 'other']}, 'type'=>'CodeableConcept', 'path'=>'Organization.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/organization-type'}},
        'name' => {'type'=>'string', 'path'=>'Organization.name', 'min'=>0, 'max'=>1},
        'alias' => {'type'=>'string', 'path'=>'Organization.alias', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'Organization.description', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ExtendedContactDetail', 'path'=>'Organization.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Organization.partOf', 'min'=>0, 'max'=>1},
        'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Organization.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'qualification' => {'type'=>'Organization::Qualification', 'path'=>'Organization.qualification', 'min'=>0, 'max'=>Float::INFINITY}
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
          'code' => {'type'=>'CodeableConcept', 'path'=>'Qualification.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example'}},
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
      attr_accessor :type              # 0-* [ CodeableConcept ]
      attr_accessor :name              # 0-1 string
      attr_accessor :alias             # 0-* [ string ]
      attr_accessor :description       # 0-1 markdown
      attr_accessor :contact           # 0-* [ ExtendedContactDetail ]
      attr_accessor :partOf            # 0-1 Reference(Organization)
      attr_accessor :endpoint          # 0-* [ Reference(Endpoint) ]
      attr_accessor :qualification     # 0-* [ Organization::Qualification ]

      def resourceType
        'Organization'
      end
    end
  end
end