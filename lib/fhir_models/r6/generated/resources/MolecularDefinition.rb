module FHIR
  module R6
    class MolecularDefinition < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MolecularDefinition.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MolecularDefinition.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MolecularDefinition.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'MolecularDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MolecularDefinition.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MolecularDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MolecularDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MolecularDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MolecularDefinition.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/sequence-type'=>['aa', 'dna', 'rna']}, 'type'=>'code', 'path'=>'MolecularDefinition.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/sequence-type'}},
        'location' => {'type'=>'MolecularDefinition::Location', 'path'=>'MolecularDefinition.location', 'min'=>0, 'max'=>Float::INFINITY},
        'memberState' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'MolecularDefinition.memberState', 'min'=>0, 'max'=>Float::INFINITY},
        'representation' => {'type'=>'MolecularDefinition::Representation', 'path'=>'MolecularDefinition.representation', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Location < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Location.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Location.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Location.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequenceLocation' => {'type'=>'MolecularDefinition::Location::SequenceLocation', 'path'=>'Location.sequenceLocation', 'min'=>0, 'max'=>1},
          'cytobandLocation' => {'type'=>'MolecularDefinition::Location::CytobandLocation', 'path'=>'Location.cytobandLocation', 'min'=>0, 'max'=>1},
          'featureLocation' => {'type'=>'MolecularDefinition::Location::FeatureLocation', 'path'=>'Location.featureLocation', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SequenceLocation < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SequenceLocation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SequenceLocation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SequenceLocation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequenceContext' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'SequenceLocation.sequenceContext', 'min'=>1, 'max'=>1},
            'coordinateInterval' => {'type'=>'MolecularDefinition::Location::SequenceLocation::CoordinateInterval', 'path'=>'SequenceLocation.coordinateInterval', 'min'=>0, 'max'=>1},
            'strand' => {'type'=>'CodeableConcept', 'path'=>'SequenceLocation.strand', 'min'=>0, 'max'=>1}
          }

          class CoordinateInterval < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'start' => ['Quantity', 'Range'],
              'end' => ['Quantity', 'Range']
            }
            METADATA = {
              'id' => {'type'=>'string', 'path'=>'CoordinateInterval.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'CoordinateInterval.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'CoordinateInterval.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'numberingSystem' => {'type'=>'CodeableConcept', 'path'=>'CoordinateInterval.numberingSystem', 'min'=>0, 'max'=>1},
              'startQuantity' => {'type'=>'Quantity', 'path'=>'CoordinateInterval.start[x]', 'min'=>0, 'max'=>1},
              'startRange' => {'type'=>'Range', 'path'=>'CoordinateInterval.start[x]', 'min'=>0, 'max'=>1},
              'endQuantity' => {'type'=>'Quantity', 'path'=>'CoordinateInterval.end[x]', 'min'=>0, 'max'=>1},
              'endRange' => {'type'=>'Range', 'path'=>'CoordinateInterval.end[x]', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :numberingSystem   # 0-1 CodeableConcept
            attr_accessor :startQuantity     # 0-1 Quantity
            attr_accessor :startRange        # 0-1 Range
            attr_accessor :endQuantity       # 0-1 Quantity
            attr_accessor :endRange          # 0-1 Range
          end

          attr_accessor :id                 # 0-1 string
          attr_accessor :extension          # 0-* [ Extension ]
          attr_accessor :modifierExtension  # 0-* [ Extension ]
          attr_accessor :sequenceContext    # 1-1 Reference(MolecularDefinition)
          attr_accessor :coordinateInterval # 0-1 MolecularDefinition::Location::SequenceLocation::CoordinateInterval
          attr_accessor :strand             # 0-1 CodeableConcept
        end

        class SequencecoordinateInterval < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml


        end

        class CytobandLocation < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'CytobandLocation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'CytobandLocation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'CytobandLocation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'genomeAssembly' => {'type'=>'MolecularDefinition::Location::CytobandLocation::GenomeAssembly', 'path'=>'CytobandLocation.genomeAssembly', 'min'=>1, 'max'=>1},
            'cytobandInterval' => {'type'=>'MolecularDefinition::Location::CytobandLocation::CytobandInterval', 'path'=>'CytobandLocation.cytobandInterval', 'min'=>1, 'max'=>1}
          }

          class GenomeAssembly < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'description' => ['markdown', 'string']
            }
            METADATA = {
              'id' => {'type'=>'string', 'path'=>'GenomeAssembly.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'GenomeAssembly.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'GenomeAssembly.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'organism' => {'type'=>'CodeableConcept', 'path'=>'GenomeAssembly.organism', 'min'=>0, 'max'=>1},
              'build' => {'type'=>'CodeableConcept', 'path'=>'GenomeAssembly.build', 'min'=>0, 'max'=>1},
              'accession' => {'type'=>'CodeableConcept', 'path'=>'GenomeAssembly.accession', 'min'=>0, 'max'=>1},
              'descriptionMarkdown' => {'type'=>'markdown', 'path'=>'GenomeAssembly.description[x]', 'min'=>0, 'max'=>1},
              'descriptionString' => {'type'=>'string', 'path'=>'GenomeAssembly.description[x]', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                  # 0-1 string
            attr_accessor :extension           # 0-* [ Extension ]
            attr_accessor :modifierExtension   # 0-* [ Extension ]
            attr_accessor :organism            # 0-1 CodeableConcept
            attr_accessor :build               # 0-1 CodeableConcept
            attr_accessor :accession           # 0-1 CodeableConcept
            attr_accessor :descriptionMarkdown # 0-1 markdown
            attr_accessor :descriptionString   # 0-1 string
          end

          class CytobandInterval < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'CytobandInterval.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'CytobandInterval.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'CytobandInterval.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'chromosome' => {'type'=>'CodeableConcept', 'path'=>'CytobandInterval.chromosome', 'min'=>1, 'max'=>1},
              'startCytoband' => {'type'=>'MolecularDefinition::Location::CytobandLocation::CytobandInterval::StartCytoband', 'path'=>'CytobandInterval.startCytoband', 'min'=>0, 'max'=>1},
              'endCytoband' => {'type'=>'MolecularDefinition::Location::CytobandLocation::CytobandInterval::EndCytoband', 'path'=>'CytobandInterval.endCytoband', 'min'=>0, 'max'=>1}
            }

            class StartCytoband < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              MULTIPLE_TYPES = {
                'arm' => ['code', 'string'],
                'region' => ['code', 'string'],
                'band' => ['code', 'string'],
                'subBand' => ['code', 'string']
              }
              METADATA = {
                'id' => {'type'=>'string', 'path'=>'StartCytoband.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'StartCytoband.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'StartCytoband.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'armCode' => {'type'=>'code', 'path'=>'StartCytoband.arm[x]', 'min'=>0, 'max'=>1},
                'armString' => {'type'=>'string', 'path'=>'StartCytoband.arm[x]', 'min'=>0, 'max'=>1},
                'regionCode' => {'type'=>'code', 'path'=>'StartCytoband.region[x]', 'min'=>0, 'max'=>1},
                'regionString' => {'type'=>'string', 'path'=>'StartCytoband.region[x]', 'min'=>0, 'max'=>1},
                'bandCode' => {'type'=>'code', 'path'=>'StartCytoband.band[x]', 'min'=>0, 'max'=>1},
                'bandString' => {'type'=>'string', 'path'=>'StartCytoband.band[x]', 'min'=>0, 'max'=>1},
                'subBandCode' => {'type'=>'code', 'path'=>'StartCytoband.subBand[x]', 'min'=>0, 'max'=>1},
                'subBandString' => {'type'=>'string', 'path'=>'StartCytoband.subBand[x]', 'min'=>0, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :armCode           # 0-1 code
              attr_accessor :armString         # 0-1 string
              attr_accessor :regionCode        # 0-1 code
              attr_accessor :regionString      # 0-1 string
              attr_accessor :bandCode          # 0-1 code
              attr_accessor :bandString        # 0-1 string
              attr_accessor :subBandCode       # 0-1 code
              attr_accessor :subBandString     # 0-1 string
            end

            class EndCytoband < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              MULTIPLE_TYPES = {
                'arm' => ['code', 'string'],
                'region' => ['code', 'string'],
                'band' => ['code', 'string'],
                'subBand' => ['code', 'string']
              }
              METADATA = {
                'id' => {'type'=>'string', 'path'=>'EndCytoband.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'EndCytoband.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'EndCytoband.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'armCode' => {'type'=>'code', 'path'=>'EndCytoband.arm[x]', 'min'=>0, 'max'=>1},
                'armString' => {'type'=>'string', 'path'=>'EndCytoband.arm[x]', 'min'=>0, 'max'=>1},
                'regionCode' => {'type'=>'code', 'path'=>'EndCytoband.region[x]', 'min'=>0, 'max'=>1},
                'regionString' => {'type'=>'string', 'path'=>'EndCytoband.region[x]', 'min'=>0, 'max'=>1},
                'bandCode' => {'type'=>'code', 'path'=>'EndCytoband.band[x]', 'min'=>0, 'max'=>1},
                'bandString' => {'type'=>'string', 'path'=>'EndCytoband.band[x]', 'min'=>0, 'max'=>1},
                'subBandCode' => {'type'=>'code', 'path'=>'EndCytoband.subBand[x]', 'min'=>0, 'max'=>1},
                'subBandString' => {'type'=>'string', 'path'=>'EndCytoband.subBand[x]', 'min'=>0, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :armCode           # 0-1 code
              attr_accessor :armString         # 0-1 string
              attr_accessor :regionCode        # 0-1 code
              attr_accessor :regionString      # 0-1 string
              attr_accessor :bandCode          # 0-1 code
              attr_accessor :bandString        # 0-1 string
              attr_accessor :subBandCode       # 0-1 code
              attr_accessor :subBandString     # 0-1 string
            end

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :chromosome        # 1-1 CodeableConcept
            attr_accessor :startCytoband     # 0-1 MolecularDefinition::Location::CytobandLocation::CytobandInterval::StartCytoband
            attr_accessor :endCytoband       # 0-1 MolecularDefinition::Location::CytobandLocation::CytobandInterval::EndCytoband
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :genomeAssembly    # 1-1 MolecularDefinition::Location::CytobandLocation::GenomeAssembly
          attr_accessor :cytobandInterval  # 1-1 MolecularDefinition::Location::CytobandLocation::CytobandInterval
        end

        class CytobandgenomeAssembly < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml


        end

        class CytobandcytobandInterval < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml


        end

        class FeatureLocation < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'FeatureLocation.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'FeatureLocation.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'FeatureLocation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'geneId' => {'type'=>'CodeableConcept', 'path'=>'FeatureLocation.geneId', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :geneId            # 0-* [ CodeableConcept ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequenceLocation  # 0-1 MolecularDefinition::Location::SequenceLocation
        attr_accessor :cytobandLocation  # 0-1 MolecularDefinition::Location::CytobandLocation
        attr_accessor :featureLocation   # 0-* [ MolecularDefinition::Location::FeatureLocation ]
      end

      class Representation < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Representation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Representation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Representation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'focus' => {'type'=>'CodeableConcept', 'path'=>'Representation.focus', 'min'=>0, 'max'=>1},
          'code' => {'type'=>'CodeableConcept', 'path'=>'Representation.code', 'min'=>0, 'max'=>Float::INFINITY},
          'literal' => {'type'=>'MolecularDefinition::Representation::Literal', 'path'=>'Representation.literal', 'min'=>0, 'max'=>1},
          'resolvable' => {'type'=>'Attachment', 'path'=>'Representation.resolvable', 'min'=>0, 'max'=>1},
          'extracted' => {'type'=>'MolecularDefinition::Representation::Extracted', 'path'=>'Representation.extracted', 'min'=>0, 'max'=>1},
          'repeated' => {'type'=>'MolecularDefinition::Representation::Repeated', 'path'=>'Representation.repeated', 'min'=>0, 'max'=>1},
          'concatenated' => {'type'=>'MolecularDefinition::Representation::Concatenated', 'path'=>'Representation.concatenated', 'min'=>0, 'max'=>1},
          'relative' => {'type'=>'MolecularDefinition::Representation::Relative', 'path'=>'Representation.relative', 'min'=>0, 'max'=>1}
        }

        class Literal < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Literal.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Literal.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Literal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'encoding' => {'type'=>'CodeableConcept', 'path'=>'Literal.encoding', 'min'=>0, 'max'=>1},
            'value' => {'type'=>'string', 'path'=>'Literal.value', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :encoding          # 0-1 CodeableConcept
          attr_accessor :value             # 1-1 string
        end

        class Extracted < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Extracted.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Extracted.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Extracted.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'startingMolecule' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'Extracted.startingMolecule', 'min'=>1, 'max'=>1},
            'start' => {'type'=>'integer', 'path'=>'Extracted.start', 'min'=>1, 'max'=>1},
            'end' => {'type'=>'integer', 'path'=>'Extracted.end', 'min'=>1, 'max'=>1},
            'coordinateSystem' => {'type'=>'CodeableConcept', 'path'=>'Extracted.coordinateSystem', 'min'=>1, 'max'=>1},
            'reverseComplement' => {'type'=>'boolean', 'path'=>'Extracted.reverseComplement', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :startingMolecule  # 1-1 Reference(MolecularDefinition)
          attr_accessor :start             # 1-1 integer
          attr_accessor :end               # 1-1 integer
          attr_accessor :coordinateSystem  # 1-1 CodeableConcept
          attr_accessor :reverseComplement # 0-1 boolean
        end

        class Repeated < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Repeated.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Repeated.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Repeated.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequenceMotif' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'Repeated.sequenceMotif', 'min'=>1, 'max'=>1},
            'copyCount' => {'type'=>'integer', 'path'=>'Repeated.copyCount', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequenceMotif     # 1-1 Reference(MolecularDefinition)
          attr_accessor :copyCount         # 1-1 integer
        end

        class Concatenated < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Concatenated.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Concatenated.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Concatenated.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequenceElement' => {'type'=>'MolecularDefinition::Representation::Concatenated::SequenceElement', 'path'=>'Concatenated.sequenceElement', 'min'=>1, 'max'=>Float::INFINITY}
          }

          class SequenceElement < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'SequenceElement.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'SequenceElement.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'SequenceElement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'sequence' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'SequenceElement.sequence', 'min'=>1, 'max'=>1},
              'ordinalIndex' => {'type'=>'integer', 'path'=>'SequenceElement.ordinalIndex', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :sequence          # 1-1 Reference(MolecularDefinition)
            attr_accessor :ordinalIndex      # 1-1 integer
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequenceElement   # 1-* [ MolecularDefinition::Representation::Concatenated::SequenceElement ]
        end

        class Relative < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Relative.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Relative.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Relative.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'startingMolecule' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'Relative.startingMolecule', 'min'=>1, 'max'=>1},
            'edit' => {'type'=>'MolecularDefinition::Representation::Relative::Edit', 'path'=>'Relative.edit', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Edit < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Edit.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Edit.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Edit.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'editOrder' => {'type'=>'integer', 'path'=>'Edit.editOrder', 'min'=>0, 'max'=>1},
              'coordinateSystem' => {'type'=>'CodeableConcept', 'path'=>'Edit.coordinateSystem', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://loinc.org/LL5323-2/'}},
              'start' => {'type'=>'integer', 'path'=>'Edit.start', 'min'=>1, 'max'=>1},
              'end' => {'type'=>'integer', 'path'=>'Edit.end', 'min'=>1, 'max'=>1},
              'replacementMolecule' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'Edit.replacementMolecule', 'min'=>1, 'max'=>1},
              'replacedMolecule' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularDefinition'], 'type'=>'Reference', 'path'=>'Edit.replacedMolecule', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                  # 0-1 string
            attr_accessor :extension           # 0-* [ Extension ]
            attr_accessor :modifierExtension   # 0-* [ Extension ]
            attr_accessor :editOrder           # 0-1 integer
            attr_accessor :coordinateSystem    # 1-1 CodeableConcept
            attr_accessor :start               # 1-1 integer
            attr_accessor :end                 # 1-1 integer
            attr_accessor :replacementMolecule # 1-1 Reference(MolecularDefinition)
            attr_accessor :replacedMolecule    # 0-1 Reference(MolecularDefinition)
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :startingMolecule  # 1-1 Reference(MolecularDefinition)
          attr_accessor :edit              # 0-* [ MolecularDefinition::Representation::Relative::Edit ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :focus             # 0-1 CodeableConcept
        attr_accessor :code              # 0-* [ CodeableConcept ]
        attr_accessor :literal           # 0-1 MolecularDefinition::Representation::Literal
        attr_accessor :resolvable        # 0-1 Attachment
        attr_accessor :extracted         # 0-1 MolecularDefinition::Representation::Extracted
        attr_accessor :repeated          # 0-1 MolecularDefinition::Representation::Repeated
        attr_accessor :concatenated      # 0-1 MolecularDefinition::Representation::Concatenated
        attr_accessor :relative          # 0-1 MolecularDefinition::Representation::Relative
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
      attr_accessor :type              # 0-1 code
      attr_accessor :location          # 0-* [ MolecularDefinition::Location ]
      attr_accessor :memberState       # 0-* [ Reference(MolecularDefinition) ]
      attr_accessor :representation    # 0-* [ MolecularDefinition::Representation ]

      def resourceType
        'MolecularDefinition'
      end
    end
  end
end