module FHIR
  module R6
    class MolecularSequence < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['identifier', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MolecularSequence.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MolecularSequence.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MolecularSequence.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'MolecularSequence.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MolecularSequence.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MolecularSequence.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MolecularSequence.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MolecularSequence.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MolecularSequence.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/sequence-type'=>['aa', 'dna', 'rna']}, 'type'=>'code', 'path'=>'MolecularSequence.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/sequence-type'}},
        'literal' => {'type'=>'MolecularSequence::Literal', 'path'=>'MolecularSequence.literal', 'min'=>0, 'max'=>Float::INFINITY},
        'file' => {'type'=>'Attachment', 'path'=>'MolecularSequence.file', 'min'=>0, 'max'=>Float::INFINITY},
        'relative' => {'type'=>'MolecularSequence::Relative', 'path'=>'MolecularSequence.relative', 'min'=>0, 'max'=>Float::INFINITY},
        'extracted' => {'type'=>'MolecularSequence::Extracted', 'path'=>'MolecularSequence.extracted', 'min'=>0, 'max'=>Float::INFINITY},
        'repeated' => {'type'=>'MolecularSequence::Repeated', 'path'=>'MolecularSequence.repeated', 'min'=>0, 'max'=>Float::INFINITY},
        'concatenated' => {'type'=>'MolecularSequence::Concatenated', 'path'=>'MolecularSequence.concatenated', 'min'=>0, 'max'=>1}
      }

      class Literal < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Literal.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Literal.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Literal.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequenceValue' => {'type'=>'string', 'path'=>'Literal.sequenceValue', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequenceValue     # 1-1 string
      end

      class Relative < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Relative.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Relative.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Relative.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'startingSequence' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'Relative.startingSequence', 'min'=>1, 'max'=>1},
          'edit' => {'type'=>'MolecularSequence::Relative::Edit', 'path'=>'Relative.edit', 'min'=>0, 'max'=>Float::INFINITY}
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
            'replacementSequence' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'Edit.replacementSequence', 'min'=>1, 'max'=>1},
            'replacedSequence' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'Edit.replacedSequence', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                  # 0-1 string
          attr_accessor :extension           # 0-* [ Extension ]
          attr_accessor :modifierExtension   # 0-* [ Extension ]
          attr_accessor :editOrder           # 0-1 integer
          attr_accessor :coordinateSystem    # 1-1 CodeableConcept
          attr_accessor :start               # 1-1 integer
          attr_accessor :end                 # 1-1 integer
          attr_accessor :replacementSequence # 1-1 Reference(MolecularSequence)
          attr_accessor :replacedSequence    # 0-1 Reference(MolecularSequence)
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :startingSequence  # 1-1 Reference(MolecularSequence)
        attr_accessor :edit              # 0-* [ MolecularSequence::Relative::Edit ]
      end

      class Extracted < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Extracted.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Extracted.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Extracted.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'startingSequence' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'Extracted.startingSequence', 'min'=>1, 'max'=>1},
          'start' => {'type'=>'integer', 'path'=>'Extracted.start', 'min'=>1, 'max'=>1},
          'end' => {'type'=>'integer', 'path'=>'Extracted.end', 'min'=>1, 'max'=>1},
          'coordinateSystem' => {'type'=>'CodeableConcept', 'path'=>'Extracted.coordinateSystem', 'min'=>1, 'max'=>1},
          'reverseComplement' => {'type'=>'boolean', 'path'=>'Extracted.reverseComplement', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :startingSequence  # 1-1 Reference(MolecularSequence)
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
          'sequenceMotif' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'Repeated.sequenceMotif', 'min'=>1, 'max'=>1},
          'copyCount' => {'type'=>'integer', 'path'=>'Repeated.copyCount', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequenceMotif     # 1-1 Reference(MolecularSequence)
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
          'sequenceElement' => {'type'=>'MolecularSequence::Concatenated::SequenceElement', 'path'=>'Concatenated.sequenceElement', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class SequenceElement < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SequenceElement.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SequenceElement.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SequenceElement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequence' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MolecularSequence'], 'type'=>'Reference', 'path'=>'SequenceElement.sequence', 'min'=>1, 'max'=>1},
            'ordinalIndex' => {'type'=>'integer', 'path'=>'SequenceElement.ordinalIndex', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :sequence          # 1-1 Reference(MolecularSequence)
          attr_accessor :ordinalIndex      # 1-1 integer
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequenceElement   # 1-* [ MolecularSequence::Concatenated::SequenceElement ]
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
      attr_accessor :literal           # 0-* [ MolecularSequence::Literal ]
      attr_accessor :file              # 0-* [ Attachment ]
      attr_accessor :relative          # 0-* [ MolecularSequence::Relative ]
      attr_accessor :extracted         # 0-* [ MolecularSequence::Extracted ]
      attr_accessor :repeated          # 0-* [ MolecularSequence::Repeated ]
      attr_accessor :concatenated      # 0-1 MolecularSequence::Concatenated

      def resourceType
        'MolecularSequence'
      end
    end
  end
end