module FHIR
  module build.fhir.org
    class SubstanceNucleicAcid < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SubstanceNucleicAcid.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SubstanceNucleicAcid.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SubstanceNucleicAcid.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SubstanceNucleicAcid.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SubstanceNucleicAcid.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SubstanceNucleicAcid.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SubstanceNucleicAcid.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SubstanceNucleicAcid.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequenceType' => {'type'=>'CodeableConcept', 'path'=>'SubstanceNucleicAcid.sequenceType', 'min'=>0, 'max'=>1},
        'numberOfSubunits' => {'type'=>'integer', 'path'=>'SubstanceNucleicAcid.numberOfSubunits', 'min'=>0, 'max'=>1},
        'areaOfHybridisation' => {'type'=>'string', 'path'=>'SubstanceNucleicAcid.areaOfHybridisation', 'min'=>0, 'max'=>1},
        'oligoNucleotideType' => {'type'=>'CodeableConcept', 'path'=>'SubstanceNucleicAcid.oligoNucleotideType', 'min'=>0, 'max'=>1},
        'subunit' => {'type'=>'SubstanceNucleicAcid::Subunit', 'path'=>'SubstanceNucleicAcid.subunit', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Subunit < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Subunit.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Subunit.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Subunit.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'subunit' => {'type'=>'integer', 'path'=>'Subunit.subunit', 'min'=>0, 'max'=>1},
          'sequence' => {'type'=>'string', 'path'=>'Subunit.sequence', 'min'=>0, 'max'=>1},
          'length' => {'type'=>'integer', 'path'=>'Subunit.length', 'min'=>0, 'max'=>1},
          'sequenceAttachment' => {'type'=>'Attachment', 'path'=>'Subunit.sequenceAttachment', 'min'=>0, 'max'=>1},
          'fivePrime' => {'type'=>'CodeableConcept', 'path'=>'Subunit.fivePrime', 'min'=>0, 'max'=>1},
          'threePrime' => {'type'=>'CodeableConcept', 'path'=>'Subunit.threePrime', 'min'=>0, 'max'=>1},
          'linkage' => {'type'=>'SubstanceNucleicAcid::Subunit::Linkage', 'path'=>'Subunit.linkage', 'min'=>0, 'max'=>Float::INFINITY},
          'sugar' => {'type'=>'SubstanceNucleicAcid::Subunit::Sugar', 'path'=>'Subunit.sugar', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Linkage < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Linkage.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Linkage.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Linkage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'connectivity' => {'type'=>'string', 'path'=>'Linkage.connectivity', 'min'=>0, 'max'=>1},
            'identifier' => {'type'=>'Identifier', 'path'=>'Linkage.identifier', 'min'=>0, 'max'=>1},
            'name' => {'type'=>'string', 'path'=>'Linkage.name', 'min'=>0, 'max'=>1},
            'residueSite' => {'type'=>'string', 'path'=>'Linkage.residueSite', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :connectivity      # 0-1 string
          attr_accessor :identifier        # 0-1 Identifier
          attr_accessor :name              # 0-1 string
          attr_accessor :residueSite       # 0-1 string
        end

        class Sugar < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Sugar.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Sugar.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Sugar.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'identifier' => {'type'=>'Identifier', 'path'=>'Sugar.identifier', 'min'=>0, 'max'=>1},
            'name' => {'type'=>'string', 'path'=>'Sugar.name', 'min'=>0, 'max'=>1},
            'residueSite' => {'type'=>'string', 'path'=>'Sugar.residueSite', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :identifier        # 0-1 Identifier
          attr_accessor :name              # 0-1 string
          attr_accessor :residueSite       # 0-1 string
        end

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :subunit            # 0-1 integer
        attr_accessor :sequence           # 0-1 string
        attr_accessor :length             # 0-1 integer
        attr_accessor :sequenceAttachment # 0-1 Attachment
        attr_accessor :fivePrime          # 0-1 CodeableConcept
        attr_accessor :threePrime         # 0-1 CodeableConcept
        attr_accessor :linkage            # 0-* [ SubstanceNucleicAcid::Subunit::Linkage ]
        attr_accessor :sugar              # 0-* [ SubstanceNucleicAcid::Subunit::Sugar ]
      end

      attr_accessor :id                  # 0-1 id
      attr_accessor :meta                # 0-1 Meta
      attr_accessor :implicitRules       # 0-1 uri
      attr_accessor :language            # 0-1 code
      attr_accessor :text                # 0-1 Narrative
      attr_accessor :contained           # 0-* [ Resource ]
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :sequenceType        # 0-1 CodeableConcept
      attr_accessor :numberOfSubunits    # 0-1 integer
      attr_accessor :areaOfHybridisation # 0-1 string
      attr_accessor :oligoNucleotideType # 0-1 CodeableConcept
      attr_accessor :subunit             # 0-* [ SubstanceNucleicAcid::Subunit ]

      def resourceType
        'SubstanceNucleicAcid'
      end
    end
  end
end