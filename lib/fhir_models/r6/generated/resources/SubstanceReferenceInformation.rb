module FHIR
  module build.fhir.org
    class SubstanceReferenceInformation < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SubstanceReferenceInformation.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SubstanceReferenceInformation.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SubstanceReferenceInformation.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SubstanceReferenceInformation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SubstanceReferenceInformation.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SubstanceReferenceInformation.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SubstanceReferenceInformation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SubstanceReferenceInformation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'comment' => {'type'=>'string', 'path'=>'SubstanceReferenceInformation.comment', 'min'=>0, 'max'=>1},
        'gene' => {'type'=>'SubstanceReferenceInformation::Gene', 'path'=>'SubstanceReferenceInformation.gene', 'min'=>0, 'max'=>Float::INFINITY},
        'geneElement' => {'type'=>'SubstanceReferenceInformation::GeneElement', 'path'=>'SubstanceReferenceInformation.geneElement', 'min'=>0, 'max'=>Float::INFINITY},
        'target' => {'type'=>'SubstanceReferenceInformation::Target', 'path'=>'SubstanceReferenceInformation.target', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Gene < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Gene.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Gene.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Gene.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'geneSequenceOrigin' => {'type'=>'CodeableConcept', 'path'=>'Gene.geneSequenceOrigin', 'min'=>0, 'max'=>1},
          'gene' => {'type'=>'CodeableConcept', 'path'=>'Gene.gene', 'min'=>0, 'max'=>1},
          'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Gene.source', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :geneSequenceOrigin # 0-1 CodeableConcept
        attr_accessor :gene               # 0-1 CodeableConcept
        attr_accessor :source             # 0-* [ Reference(DocumentReference) ]
      end

      class GeneElement < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'GeneElement.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'GeneElement.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'GeneElement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'type'=>'CodeableConcept', 'path'=>'GeneElement.type', 'min'=>0, 'max'=>1},
          'element' => {'type'=>'Identifier', 'path'=>'GeneElement.element', 'min'=>0, 'max'=>1},
          'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'GeneElement.source', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :element           # 0-1 Identifier
        attr_accessor :source            # 0-* [ Reference(DocumentReference) ]
      end

      class Target < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'amount' => ['Quantity', 'Range', 'string']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'target' => {'type'=>'Identifier', 'path'=>'Target.target', 'min'=>0, 'max'=>1},
          'type' => {'type'=>'CodeableConcept', 'path'=>'Target.type', 'min'=>0, 'max'=>1},
          'interaction' => {'type'=>'CodeableConcept', 'path'=>'Target.interaction', 'min'=>0, 'max'=>1},
          'organism' => {'type'=>'CodeableConcept', 'path'=>'Target.organism', 'min'=>0, 'max'=>1},
          'organismType' => {'type'=>'CodeableConcept', 'path'=>'Target.organismType', 'min'=>0, 'max'=>1},
          'amountQuantity' => {'type'=>'Quantity', 'path'=>'Target.amount[x]', 'min'=>0, 'max'=>1},
          'amountRange' => {'type'=>'Range', 'path'=>'Target.amount[x]', 'min'=>0, 'max'=>1},
          'amountString' => {'type'=>'string', 'path'=>'Target.amount[x]', 'min'=>0, 'max'=>1},
          'amountType' => {'type'=>'CodeableConcept', 'path'=>'Target.amountType', 'min'=>0, 'max'=>1},
          'source' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Target.source', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :target            # 0-1 Identifier
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :interaction       # 0-1 CodeableConcept
        attr_accessor :organism          # 0-1 CodeableConcept
        attr_accessor :organismType      # 0-1 CodeableConcept
        attr_accessor :amountQuantity    # 0-1 Quantity
        attr_accessor :amountRange       # 0-1 Range
        attr_accessor :amountString      # 0-1 string
        attr_accessor :amountType        # 0-1 CodeableConcept
        attr_accessor :source            # 0-* [ Reference(DocumentReference) ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :comment           # 0-1 string
      attr_accessor :gene              # 0-* [ SubstanceReferenceInformation::Gene ]
      attr_accessor :geneElement       # 0-* [ SubstanceReferenceInformation::GeneElement ]
      attr_accessor :target            # 0-* [ SubstanceReferenceInformation::Target ]

      def resourceType
        'SubstanceReferenceInformation'
      end
    end
  end
end