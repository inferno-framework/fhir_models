module FHIR
  module build.fhir.org
    class SubstanceProtein < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SubstanceProtein.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SubstanceProtein.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SubstanceProtein.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SubstanceProtein.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SubstanceProtein.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SubstanceProtein.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SubstanceProtein.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SubstanceProtein.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'sequenceType' => {'type'=>'CodeableConcept', 'path'=>'SubstanceProtein.sequenceType', 'min'=>0, 'max'=>1},
        'numberOfSubunits' => {'type'=>'integer', 'path'=>'SubstanceProtein.numberOfSubunits', 'min'=>0, 'max'=>1},
        'disulfideLinkage' => {'type'=>'string', 'path'=>'SubstanceProtein.disulfideLinkage', 'min'=>0, 'max'=>Float::INFINITY},
        'subunit' => {'type'=>'SubstanceProtein::Subunit', 'path'=>'SubstanceProtein.subunit', 'min'=>0, 'max'=>Float::INFINITY}
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
          'nTerminalModificationId' => {'type'=>'Identifier', 'path'=>'Subunit.nTerminalModificationId', 'min'=>0, 'max'=>1},
          'nTerminalModification' => {'type'=>'string', 'path'=>'Subunit.nTerminalModification', 'min'=>0, 'max'=>1},
          'cTerminalModificationId' => {'type'=>'Identifier', 'path'=>'Subunit.cTerminalModificationId', 'min'=>0, 'max'=>1},
          'cTerminalModification' => {'type'=>'string', 'path'=>'Subunit.cTerminalModification', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                      # 0-1 string
        attr_accessor :extension               # 0-* [ Extension ]
        attr_accessor :modifierExtension       # 0-* [ Extension ]
        attr_accessor :subunit                 # 0-1 integer
        attr_accessor :sequence                # 0-1 string
        attr_accessor :length                  # 0-1 integer
        attr_accessor :sequenceAttachment      # 0-1 Attachment
        attr_accessor :nTerminalModificationId # 0-1 Identifier
        attr_accessor :nTerminalModification   # 0-1 string
        attr_accessor :cTerminalModificationId # 0-1 Identifier
        attr_accessor :cTerminalModification   # 0-1 string
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :sequenceType      # 0-1 CodeableConcept
      attr_accessor :numberOfSubunits  # 0-1 integer
      attr_accessor :disulfideLinkage  # 0-* [ string ]
      attr_accessor :subunit           # 0-* [ SubstanceProtein::Subunit ]

      def resourceType
        'SubstanceProtein'
      end
    end
  end
end