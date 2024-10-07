module FHIR
  module build.fhir.org
    class SubstanceSourceMaterial < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SubstanceSourceMaterial.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SubstanceSourceMaterial.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SubstanceSourceMaterial.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SubstanceSourceMaterial.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SubstanceSourceMaterial.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SubstanceSourceMaterial.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SubstanceSourceMaterial.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SubstanceSourceMaterial.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sourceMaterialClass' => {'type'=>'CodeableConcept', 'path'=>'SubstanceSourceMaterial.sourceMaterialClass', 'min'=>0, 'max'=>1},
        'sourceMaterialType' => {'type'=>'CodeableConcept', 'path'=>'SubstanceSourceMaterial.sourceMaterialType', 'min'=>0, 'max'=>1},
        'sourceMaterialState' => {'type'=>'CodeableConcept', 'path'=>'SubstanceSourceMaterial.sourceMaterialState', 'min'=>0, 'max'=>1},
        'organismId' => {'type'=>'Identifier', 'path'=>'SubstanceSourceMaterial.organismId', 'min'=>0, 'max'=>1},
        'organismName' => {'type'=>'string', 'path'=>'SubstanceSourceMaterial.organismName', 'min'=>0, 'max'=>1},
        'parentSubstanceId' => {'type'=>'Identifier', 'path'=>'SubstanceSourceMaterial.parentSubstanceId', 'min'=>0, 'max'=>Float::INFINITY},
        'parentSubstanceName' => {'type'=>'string', 'path'=>'SubstanceSourceMaterial.parentSubstanceName', 'min'=>0, 'max'=>Float::INFINITY},
        'countryOfOrigin' => {'type'=>'CodeableConcept', 'path'=>'SubstanceSourceMaterial.countryOfOrigin', 'min'=>0, 'max'=>Float::INFINITY},
        'geographicalLocation' => {'type'=>'string', 'path'=>'SubstanceSourceMaterial.geographicalLocation', 'min'=>0, 'max'=>Float::INFINITY},
        'developmentStage' => {'type'=>'CodeableConcept', 'path'=>'SubstanceSourceMaterial.developmentStage', 'min'=>0, 'max'=>1},
        'fractionDescription' => {'type'=>'SubstanceSourceMaterial::FractionDescription', 'path'=>'SubstanceSourceMaterial.fractionDescription', 'min'=>0, 'max'=>Float::INFINITY},
        'organism' => {'type'=>'SubstanceSourceMaterial::Organism', 'path'=>'SubstanceSourceMaterial.organism', 'min'=>0, 'max'=>1},
        'partDescription' => {'type'=>'SubstanceSourceMaterial::PartDescription', 'path'=>'SubstanceSourceMaterial.partDescription', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class FractionDescription < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'FractionDescription.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'FractionDescription.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'FractionDescription.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'fraction' => {'type'=>'string', 'path'=>'FractionDescription.fraction', 'min'=>0, 'max'=>1},
          'materialType' => {'type'=>'CodeableConcept', 'path'=>'FractionDescription.materialType', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :fraction          # 0-1 string
        attr_accessor :materialType      # 0-1 CodeableConcept
      end

      class Organism < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Organism.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Organism.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Organism.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'family' => {'type'=>'CodeableConcept', 'path'=>'Organism.family', 'min'=>0, 'max'=>1},
          'genus' => {'type'=>'CodeableConcept', 'path'=>'Organism.genus', 'min'=>0, 'max'=>1},
          'species' => {'type'=>'CodeableConcept', 'path'=>'Organism.species', 'min'=>0, 'max'=>1},
          'intraspecificType' => {'type'=>'CodeableConcept', 'path'=>'Organism.intraspecificType', 'min'=>0, 'max'=>1},
          'intraspecificDescription' => {'type'=>'string', 'path'=>'Organism.intraspecificDescription', 'min'=>0, 'max'=>1},
          'author' => {'type'=>'SubstanceSourceMaterial::Organism::Author', 'path'=>'Organism.author', 'min'=>0, 'max'=>Float::INFINITY},
          'hybrid' => {'type'=>'SubstanceSourceMaterial::Organism::Hybrid', 'path'=>'Organism.hybrid', 'min'=>0, 'max'=>1},
          'organismGeneral' => {'type'=>'SubstanceSourceMaterial::Organism::OrganismGeneral', 'path'=>'Organism.organismGeneral', 'min'=>0, 'max'=>1}
        }

        class Author < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Author.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Author.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Author.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'authorType' => {'type'=>'CodeableConcept', 'path'=>'Author.authorType', 'min'=>0, 'max'=>1},
            'authorDescription' => {'type'=>'string', 'path'=>'Author.authorDescription', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :authorType        # 0-1 CodeableConcept
          attr_accessor :authorDescription # 0-1 string
        end

        class Hybrid < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Hybrid.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Hybrid.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Hybrid.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'maternalOrganismId' => {'type'=>'string', 'path'=>'Hybrid.maternalOrganismId', 'min'=>0, 'max'=>1},
            'maternalOrganismName' => {'type'=>'string', 'path'=>'Hybrid.maternalOrganismName', 'min'=>0, 'max'=>1},
            'paternalOrganismId' => {'type'=>'string', 'path'=>'Hybrid.paternalOrganismId', 'min'=>0, 'max'=>1},
            'paternalOrganismName' => {'type'=>'string', 'path'=>'Hybrid.paternalOrganismName', 'min'=>0, 'max'=>1},
            'hybridType' => {'type'=>'CodeableConcept', 'path'=>'Hybrid.hybridType', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :maternalOrganismId   # 0-1 string
          attr_accessor :maternalOrganismName # 0-1 string
          attr_accessor :paternalOrganismId   # 0-1 string
          attr_accessor :paternalOrganismName # 0-1 string
          attr_accessor :hybridType           # 0-1 CodeableConcept
        end

        class OrganismGeneral < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'OrganismGeneral.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'OrganismGeneral.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'OrganismGeneral.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'kingdom' => {'type'=>'CodeableConcept', 'path'=>'OrganismGeneral.kingdom', 'min'=>0, 'max'=>1},
            'phylum' => {'type'=>'CodeableConcept', 'path'=>'OrganismGeneral.phylum', 'min'=>0, 'max'=>1},
            'class' => {'local_name'=>'local_class', 'type'=>'CodeableConcept', 'path'=>'OrganismGeneral.class', 'min'=>0, 'max'=>1},
            'order' => {'type'=>'CodeableConcept', 'path'=>'OrganismGeneral.order', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :kingdom           # 0-1 CodeableConcept
          attr_accessor :phylum            # 0-1 CodeableConcept
          attr_accessor :local_class       # 0-1 CodeableConcept
          attr_accessor :order             # 0-1 CodeableConcept
        end

        attr_accessor :id                       # 0-1 string
        attr_accessor :extension                # 0-* [ Extension ]
        attr_accessor :modifierExtension        # 0-* [ Extension ]
        attr_accessor :family                   # 0-1 CodeableConcept
        attr_accessor :genus                    # 0-1 CodeableConcept
        attr_accessor :species                  # 0-1 CodeableConcept
        attr_accessor :intraspecificType        # 0-1 CodeableConcept
        attr_accessor :intraspecificDescription # 0-1 string
        attr_accessor :author                   # 0-* [ SubstanceSourceMaterial::Organism::Author ]
        attr_accessor :hybrid                   # 0-1 SubstanceSourceMaterial::Organism::Hybrid
        attr_accessor :organismGeneral          # 0-1 SubstanceSourceMaterial::Organism::OrganismGeneral
      end

      class PartDescription < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'PartDescription.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'PartDescription.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'PartDescription.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'part' => {'type'=>'CodeableConcept', 'path'=>'PartDescription.part', 'min'=>0, 'max'=>1},
          'partLocation' => {'type'=>'CodeableConcept', 'path'=>'PartDescription.partLocation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :part              # 0-1 CodeableConcept
        attr_accessor :partLocation      # 0-1 CodeableConcept
      end

      attr_accessor :id                   # 0-1 id
      attr_accessor :meta                 # 0-1 Meta
      attr_accessor :implicitRules        # 0-1 uri
      attr_accessor :language             # 0-1 code
      attr_accessor :text                 # 0-1 Narrative
      attr_accessor :contained            # 0-* [ Resource ]
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :sourceMaterialClass  # 0-1 CodeableConcept
      attr_accessor :sourceMaterialType   # 0-1 CodeableConcept
      attr_accessor :sourceMaterialState  # 0-1 CodeableConcept
      attr_accessor :organismId           # 0-1 Identifier
      attr_accessor :organismName         # 0-1 string
      attr_accessor :parentSubstanceId    # 0-* [ Identifier ]
      attr_accessor :parentSubstanceName  # 0-* [ string ]
      attr_accessor :countryOfOrigin      # 0-* [ CodeableConcept ]
      attr_accessor :geographicalLocation # 0-* [ string ]
      attr_accessor :developmentStage     # 0-1 CodeableConcept
      attr_accessor :fractionDescription  # 0-* [ SubstanceSourceMaterial::FractionDescription ]
      attr_accessor :organism             # 0-1 SubstanceSourceMaterial::Organism
      attr_accessor :partDescription      # 0-* [ SubstanceSourceMaterial::PartDescription ]

      def resourceType
        'SubstanceSourceMaterial'
      end
    end
  end
end