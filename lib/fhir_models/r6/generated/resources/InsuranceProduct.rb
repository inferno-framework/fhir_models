module FHIR
  module R6
    class InsuranceProduct < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'InsuranceProduct.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'InsuranceProduct.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'InsuranceProduct.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'InsuranceProduct.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'InsuranceProduct.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'InsuranceProduct.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'InsuranceProduct.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'InsuranceProduct.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'InsuranceProduct.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'InsuranceProduct.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/insurance-plan-type'=>['medical', 'dental', 'mental', 'subst-ab', 'vision', 'drug', 'short-term', 'long-term', 'hospice', 'home', 'Drug']}, 'type'=>'CodeableConcept', 'path'=>'InsuranceProduct.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/insuranceproduct-type'}},
        'name' => {'type'=>'string', 'path'=>'InsuranceProduct.name', 'min'=>0, 'max'=>1},
        'alias' => {'type'=>'string', 'path'=>'InsuranceProduct.alias', 'min'=>0, 'max'=>Float::INFINITY},
        'period' => {'type'=>'Period', 'path'=>'InsuranceProduct.period', 'min'=>0, 'max'=>1},
        'ownedBy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'InsuranceProduct.ownedBy', 'min'=>0, 'max'=>1},
        'administeredBy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'InsuranceProduct.administeredBy', 'min'=>0, 'max'=>1},
        'coverageArea' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'InsuranceProduct.coverageArea', 'min'=>0, 'max'=>Float::INFINITY},
        'contact' => {'type'=>'ExtendedContactDetail', 'path'=>'InsuranceProduct.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'InsuranceProduct.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'network' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'InsuranceProduct.network', 'min'=>0, 'max'=>Float::INFINITY},
        'coverage' => {'type'=>'InsuranceProduct::Coverage', 'path'=>'InsuranceProduct.coverage', 'min'=>0, 'max'=>Float::INFINITY},
        'related' => {'type'=>'InsuranceProduct::Related', 'path'=>'InsuranceProduct.related', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Coverage < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Coverage.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Coverage.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Coverage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Coverage.type', 'min'=>1, 'max'=>1},
          'network' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Coverage.network', 'min'=>0, 'max'=>Float::INFINITY},
          'benefit' => {'type'=>'InsuranceProduct::Coverage::Benefit', 'path'=>'Coverage.benefit', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Benefit < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Benefit.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Benefit.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Benefit.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'type'=>'CodeableConcept', 'path'=>'Benefit.type', 'min'=>1, 'max'=>1},
            'requirement' => {'type'=>'string', 'path'=>'Benefit.requirement', 'min'=>0, 'max'=>1},
            'limit' => {'type'=>'InsuranceProduct::Coverage::Benefit::Limit', 'path'=>'Benefit.limit', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Limit < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Limit.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Limit.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Limit.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'value' => {'type'=>'Quantity', 'path'=>'Limit.value', 'min'=>0, 'max'=>1},
              'code' => {'type'=>'CodeableConcept', 'path'=>'Limit.code', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :value             # 0-1 Quantity
            attr_accessor :code              # 0-1 CodeableConcept
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 1-1 CodeableConcept
          attr_accessor :requirement       # 0-1 string
          attr_accessor :limit             # 0-* [ InsuranceProduct::Coverage::Benefit::Limit ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :network           # 0-* [ Reference(Organization) ]
        attr_accessor :benefit           # 1-* [ InsuranceProduct::Coverage::Benefit ]
      end

      class Related < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Related.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Related.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Related.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'product' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/InsuranceProduct'], 'type'=>'Reference', 'path'=>'Related.product', 'min'=>0, 'max'=>1},
          'relationship' => {'type'=>'CodeableConcept', 'path'=>'Related.relationship', 'min'=>0, 'max'=>1},
          'period' => {'type'=>'Period', 'path'=>'Related.period', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :product           # 0-1 Reference(InsuranceProduct)
        attr_accessor :relationship      # 0-1 CodeableConcept
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
      attr_accessor :status            # 0-1 code
      attr_accessor :type              # 0-* [ CodeableConcept ]
      attr_accessor :name              # 0-1 string
      attr_accessor :alias             # 0-* [ string ]
      attr_accessor :period            # 0-1 Period
      attr_accessor :ownedBy           # 0-1 Reference(Organization)
      attr_accessor :administeredBy    # 0-1 Reference(Organization)
      attr_accessor :coverageArea      # 0-* [ Reference(Location) ]
      attr_accessor :contact           # 0-* [ ExtendedContactDetail ]
      attr_accessor :endpoint          # 0-* [ Reference(Endpoint) ]
      attr_accessor :network           # 0-* [ Reference(Organization) ]
      attr_accessor :coverage          # 0-* [ InsuranceProduct::Coverage ]
      attr_accessor :related           # 0-* [ InsuranceProduct::Related ]

      def resourceType
        'InsuranceProduct'
      end
    end
  end
end