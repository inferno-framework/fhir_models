module FHIR
  module build.fhir.org
    class InsurancePlan < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['coverage-area', 'identifier', 'network', 'product', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'InsurancePlan.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'InsurancePlan.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'InsurancePlan.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'InsurancePlan.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'InsurancePlan.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'InsurancePlan.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'InsurancePlan.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'InsurancePlan.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'InsurancePlan.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'type'=>'CodeableConcept', 'path'=>'InsurancePlan.type', 'min'=>0, 'max'=>1},
        'product' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/InsuranceProduct'], 'type'=>'Reference', 'path'=>'InsurancePlan.product', 'min'=>0, 'max'=>1},
        'coverageArea' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'InsurancePlan.coverageArea', 'min'=>0, 'max'=>Float::INFINITY},
        'network' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'InsurancePlan.network', 'min'=>0, 'max'=>Float::INFINITY},
        'generalCost' => {'type'=>'InsurancePlan::GeneralCost', 'path'=>'InsurancePlan.generalCost', 'min'=>0, 'max'=>Float::INFINITY},
        'specificCost' => {'type'=>'InsurancePlan::SpecificCost', 'path'=>'InsurancePlan.specificCost', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class GeneralCost < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'GeneralCost.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'GeneralCost.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'GeneralCost.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'GeneralCost.type', 'min'=>0, 'max'=>1},
          'groupSize' => {'type'=>'positiveInt', 'path'=>'GeneralCost.groupSize', 'min'=>0, 'max'=>1},
          'cost' => {'type'=>'Money', 'path'=>'GeneralCost.cost', 'min'=>0, 'max'=>1},
          'comment' => {'type'=>'string', 'path'=>'GeneralCost.comment', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :groupSize         # 0-1 positiveInt
        attr_accessor :cost              # 0-1 Money
        attr_accessor :comment           # 0-1 string
      end

      class SpecificCost < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'SpecificCost.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'SpecificCost.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'SpecificCost.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'category' => {'type'=>'CodeableConcept', 'path'=>'SpecificCost.category', 'min'=>1, 'max'=>1},
          'benefit' => {'type'=>'InsurancePlan::SpecificCost::Benefit', 'path'=>'SpecificCost.benefit', 'min'=>0, 'max'=>Float::INFINITY}
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
            'cost' => {'type'=>'InsurancePlan::SpecificCost::Benefit::Cost', 'path'=>'Benefit.cost', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Cost < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Cost.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Cost.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Cost.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'type'=>'CodeableConcept', 'path'=>'Cost.type', 'min'=>1, 'max'=>1},
              'applicability' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/applicability'=>['in-network', 'out-of-network', 'other']}, 'type'=>'CodeableConcept', 'path'=>'Cost.applicability', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/insuranceplan-applicability'}},
              'qualifier' => {'type'=>'CodeableConcept', 'path'=>'Cost.qualifier', 'min'=>0, 'max'=>Float::INFINITY},
              'value' => {'type'=>'Quantity', 'path'=>'Cost.value', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :type              # 1-1 CodeableConcept
            attr_accessor :applicability     # 0-1 CodeableConcept
            attr_accessor :qualifier         # 0-* [ CodeableConcept ]
            attr_accessor :value             # 0-1 Quantity
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :type              # 1-1 CodeableConcept
          attr_accessor :cost              # 0-* [ InsurancePlan::SpecificCost::Benefit::Cost ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :category          # 1-1 CodeableConcept
        attr_accessor :benefit           # 0-* [ InsurancePlan::SpecificCost::Benefit ]
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
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :product           # 0-1 Reference(InsuranceProduct)
      attr_accessor :coverageArea      # 0-* [ Reference(Location) ]
      attr_accessor :network           # 0-* [ Reference(Organization) ]
      attr_accessor :generalCost       # 0-* [ InsurancePlan::GeneralCost ]
      attr_accessor :specificCost      # 0-* [ InsurancePlan::SpecificCost ]

      def resourceType
        'InsurancePlan'
      end
    end
  end
end