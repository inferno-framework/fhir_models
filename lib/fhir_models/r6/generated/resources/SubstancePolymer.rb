module FHIR
  module R6
    class SubstancePolymer < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SubstancePolymer.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SubstancePolymer.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SubstancePolymer.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SubstancePolymer.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SubstancePolymer.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SubstancePolymer.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SubstancePolymer.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SubstancePolymer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'SubstancePolymer.identifier', 'min'=>0, 'max'=>1},
        'class' => {'local_name'=>'local_class', 'type'=>'CodeableConcept', 'path'=>'SubstancePolymer.class', 'min'=>0, 'max'=>1},
        'geometry' => {'type'=>'CodeableConcept', 'path'=>'SubstancePolymer.geometry', 'min'=>0, 'max'=>1},
        'copolymerConnectivity' => {'type'=>'CodeableConcept', 'path'=>'SubstancePolymer.copolymerConnectivity', 'min'=>0, 'max'=>Float::INFINITY},
        'modification' => {'type'=>'string', 'path'=>'SubstancePolymer.modification', 'min'=>0, 'max'=>1},
        'monomerSet' => {'type'=>'SubstancePolymer::MonomerSet', 'path'=>'SubstancePolymer.monomerSet', 'min'=>0, 'max'=>Float::INFINITY},
        'repeat' => {'type'=>'SubstancePolymer::Repeat', 'path'=>'SubstancePolymer.repeat', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class MonomerSet < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'MonomerSet.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'MonomerSet.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'MonomerSet.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'ratioType' => {'type'=>'CodeableConcept', 'path'=>'MonomerSet.ratioType', 'min'=>0, 'max'=>1},
          'startingMaterial' => {'type'=>'SubstancePolymer::MonomerSet::StartingMaterial', 'path'=>'MonomerSet.startingMaterial', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class StartingMaterial < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'StartingMaterial.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'StartingMaterial.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'StartingMaterial.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'type'=>'CodeableConcept', 'path'=>'StartingMaterial.code', 'min'=>0, 'max'=>1},
            'category' => {'type'=>'CodeableConcept', 'path'=>'StartingMaterial.category', 'min'=>0, 'max'=>1},
            'isDefining' => {'type'=>'boolean', 'path'=>'StartingMaterial.isDefining', 'min'=>0, 'max'=>1},
            'amount' => {'type'=>'Quantity', 'path'=>'StartingMaterial.amount', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :code              # 0-1 CodeableConcept
          attr_accessor :category          # 0-1 CodeableConcept
          attr_accessor :isDefining        # 0-1 boolean
          attr_accessor :amount            # 0-1 Quantity
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :ratioType         # 0-1 CodeableConcept
        attr_accessor :startingMaterial  # 0-* [ SubstancePolymer::MonomerSet::StartingMaterial ]
      end

      class Repeat < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Repeat.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Repeat.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Repeat.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'averageMolecularFormula' => {'type'=>'string', 'path'=>'Repeat.averageMolecularFormula', 'min'=>0, 'max'=>1},
          'repeatUnitAmountType' => {'type'=>'CodeableConcept', 'path'=>'Repeat.repeatUnitAmountType', 'min'=>0, 'max'=>1},
          'repeatUnit' => {'type'=>'SubstancePolymer::Repeat::RepeatUnit', 'path'=>'Repeat.repeatUnit', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class RepeatUnit < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'RepeatUnit.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'RepeatUnit.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'RepeatUnit.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'unit' => {'type'=>'string', 'path'=>'RepeatUnit.unit', 'min'=>0, 'max'=>1},
            'orientation' => {'type'=>'CodeableConcept', 'path'=>'RepeatUnit.orientation', 'min'=>0, 'max'=>1},
            'amount' => {'type'=>'integer', 'path'=>'RepeatUnit.amount', 'min'=>0, 'max'=>1},
            'degreeOfPolymerisation' => {'type'=>'SubstancePolymer::Repeat::RepeatUnit::DegreeOfPolymerisation', 'path'=>'RepeatUnit.degreeOfPolymerisation', 'min'=>0, 'max'=>Float::INFINITY},
            'structuralRepresentation' => {'type'=>'SubstancePolymer::Repeat::RepeatUnit::StructuralRepresentation', 'path'=>'RepeatUnit.structuralRepresentation', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class DegreeOfPolymerisation < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'DegreeOfPolymerisation.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'DegreeOfPolymerisation.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'DegreeOfPolymerisation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'type'=>'CodeableConcept', 'path'=>'DegreeOfPolymerisation.type', 'min'=>0, 'max'=>1},
              'average' => {'type'=>'integer', 'path'=>'DegreeOfPolymerisation.average', 'min'=>0, 'max'=>1},
              'low' => {'type'=>'integer', 'path'=>'DegreeOfPolymerisation.low', 'min'=>0, 'max'=>1},
              'high' => {'type'=>'integer', 'path'=>'DegreeOfPolymerisation.high', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :type              # 0-1 CodeableConcept
            attr_accessor :average           # 0-1 integer
            attr_accessor :low               # 0-1 integer
            attr_accessor :high              # 0-1 integer
          end

          class StructuralRepresentation < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'StructuralRepresentation.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'StructuralRepresentation.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'StructuralRepresentation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'type'=>'CodeableConcept', 'path'=>'StructuralRepresentation.type', 'min'=>0, 'max'=>1},
              'representation' => {'type'=>'string', 'path'=>'StructuralRepresentation.representation', 'min'=>0, 'max'=>1},
              'format' => {'type'=>'CodeableConcept', 'path'=>'StructuralRepresentation.format', 'min'=>0, 'max'=>1},
              'attachment' => {'type'=>'Attachment', 'path'=>'StructuralRepresentation.attachment', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :type              # 0-1 CodeableConcept
            attr_accessor :representation    # 0-1 string
            attr_accessor :format            # 0-1 CodeableConcept
            attr_accessor :attachment        # 0-1 Attachment
          end

          attr_accessor :id                       # 0-1 string
          attr_accessor :extension                # 0-* [ Extension ]
          attr_accessor :modifierExtension        # 0-* [ Extension ]
          attr_accessor :unit                     # 0-1 string
          attr_accessor :orientation              # 0-1 CodeableConcept
          attr_accessor :amount                   # 0-1 integer
          attr_accessor :degreeOfPolymerisation   # 0-* [ SubstancePolymer::Repeat::RepeatUnit::DegreeOfPolymerisation ]
          attr_accessor :structuralRepresentation # 0-* [ SubstancePolymer::Repeat::RepeatUnit::StructuralRepresentation ]
        end

        attr_accessor :id                      # 0-1 string
        attr_accessor :extension               # 0-* [ Extension ]
        attr_accessor :modifierExtension       # 0-* [ Extension ]
        attr_accessor :averageMolecularFormula # 0-1 string
        attr_accessor :repeatUnitAmountType    # 0-1 CodeableConcept
        attr_accessor :repeatUnit              # 0-* [ SubstancePolymer::Repeat::RepeatUnit ]
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :meta                  # 0-1 Meta
      attr_accessor :implicitRules         # 0-1 uri
      attr_accessor :language              # 0-1 code
      attr_accessor :text                  # 0-1 Narrative
      attr_accessor :contained             # 0-* [ Resource ]
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :identifier            # 0-1 Identifier
      attr_accessor :local_class           # 0-1 CodeableConcept
      attr_accessor :geometry              # 0-1 CodeableConcept
      attr_accessor :copolymerConnectivity # 0-* [ CodeableConcept ]
      attr_accessor :modification          # 0-1 string
      attr_accessor :monomerSet            # 0-* [ SubstancePolymer::MonomerSet ]
      attr_accessor :repeat                # 0-* [ SubstancePolymer::Repeat ]

      def resourceType
        'SubstancePolymer'
      end
    end
  end
end