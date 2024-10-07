module FHIR
  module build.fhir.org
    class EvidenceVariable < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding']
      }
      SEARCH_PARAMS = ['composed-of', 'context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'depends-on', 'derived-from', 'description', 'identifier', 'name', 'predecessor', 'publisher', 'status', 'successor', 'title', 'topic', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'EvidenceVariable.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'EvidenceVariable.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'EvidenceVariable.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'EvidenceVariable.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'EvidenceVariable.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'EvidenceVariable.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'EvidenceVariable.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'EvidenceVariable.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'EvidenceVariable.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'EvidenceVariable.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'EvidenceVariable.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'EvidenceVariable.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'EvidenceVariable.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'EvidenceVariable.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'EvidenceVariable.title', 'min'=>0, 'max'=>1},
        'shortTitle' => {'type'=>'string', 'path'=>'EvidenceVariable.shortTitle', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'EvidenceVariable.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'EvidenceVariable.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'EvidenceVariable.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'EvidenceVariable.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'EvidenceVariable.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'EvidenceVariable.description', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'EvidenceVariable.note', 'min'=>0, 'max'=>Float::INFINITY},
        'useContext' => {'type'=>'UsageContext', 'path'=>'EvidenceVariable.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'purpose' => {'type'=>'markdown', 'path'=>'EvidenceVariable.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'EvidenceVariable.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'EvidenceVariable.copyrightLabel', 'min'=>0, 'max'=>1},
        'approvalDate' => {'type'=>'date', 'path'=>'EvidenceVariable.approvalDate', 'min'=>0, 'max'=>1},
        'lastReviewDate' => {'type'=>'date', 'path'=>'EvidenceVariable.lastReviewDate', 'min'=>0, 'max'=>1},
        'effectivePeriod' => {'type'=>'Period', 'path'=>'EvidenceVariable.effectivePeriod', 'min'=>0, 'max'=>1},
        'author' => {'type'=>'ContactDetail', 'path'=>'EvidenceVariable.author', 'min'=>0, 'max'=>Float::INFINITY},
        'editor' => {'type'=>'ContactDetail', 'path'=>'EvidenceVariable.editor', 'min'=>0, 'max'=>Float::INFINITY},
        'reviewer' => {'type'=>'ContactDetail', 'path'=>'EvidenceVariable.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
        'endorser' => {'type'=>'ContactDetail', 'path'=>'EvidenceVariable.endorser', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'EvidenceVariable.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
        'actual' => {'type'=>'boolean', 'path'=>'EvidenceVariable.actual', 'min'=>0, 'max'=>1},
        'definition' => {'type'=>'CodeableReference', 'path'=>'EvidenceVariable.definition', 'min'=>0, 'max'=>1},
        'handling' => {'valid_codes'=>{'http://hl7.org/fhir/variable-handling'=>['continuous', 'dichotomous', 'ordinal', 'polychotomous']}, 'type'=>'code', 'path'=>'EvidenceVariable.handling', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/variable-handling'}},
        'category' => {'type'=>'EvidenceVariable::Category', 'path'=>'EvidenceVariable.category', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Category < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['CodeableConcept', 'Quantity', 'Range', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Category.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Category.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Category.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Category.name', 'min'=>0, 'max'=>1},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Category.value[x]', 'min'=>0, 'max'=>1},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Category.value[x]', 'min'=>0, 'max'=>1},
          'valueRange' => {'type'=>'Range', 'path'=>'Category.value[x]', 'min'=>0, 'max'=>1},
          'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Category.value[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :name                 # 0-1 string
        attr_accessor :valueCodeableConcept # 0-1 CodeableConcept
        attr_accessor :valueQuantity        # 0-1 Quantity
        attr_accessor :valueRange           # 0-1 Range
        attr_accessor :valueReference       # 0-1 Reference(Group)
      end

      attr_accessor :id                     # 0-1 id
      attr_accessor :meta                   # 0-1 Meta
      attr_accessor :implicitRules          # 0-1 uri
      attr_accessor :language               # 0-1 code
      attr_accessor :text                   # 0-1 Narrative
      attr_accessor :contained              # 0-* [ Resource ]
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :url                    # 0-1 uri
      attr_accessor :identifier             # 0-* [ Identifier ]
      attr_accessor :version                # 0-1 string
      attr_accessor :versionAlgorithmString # 0-1 string
      attr_accessor :versionAlgorithmCoding # 0-1 Coding
      attr_accessor :name                   # 0-1 string
      attr_accessor :title                  # 0-1 string
      attr_accessor :shortTitle             # 0-1 string
      attr_accessor :status                 # 1-1 code
      attr_accessor :experimental           # 0-1 boolean
      attr_accessor :date                   # 0-1 dateTime
      attr_accessor :publisher              # 0-1 string
      attr_accessor :contact                # 0-* [ ContactDetail ]
      attr_accessor :description            # 0-1 markdown
      attr_accessor :note                   # 0-* [ Annotation ]
      attr_accessor :useContext             # 0-* [ UsageContext ]
      attr_accessor :purpose                # 0-1 markdown
      attr_accessor :copyright              # 0-1 markdown
      attr_accessor :copyrightLabel         # 0-1 string
      attr_accessor :approvalDate           # 0-1 date
      attr_accessor :lastReviewDate         # 0-1 date
      attr_accessor :effectivePeriod        # 0-1 Period
      attr_accessor :author                 # 0-* [ ContactDetail ]
      attr_accessor :editor                 # 0-* [ ContactDetail ]
      attr_accessor :reviewer               # 0-* [ ContactDetail ]
      attr_accessor :endorser               # 0-* [ ContactDetail ]
      attr_accessor :relatedArtifact        # 0-* [ RelatedArtifact ]
      attr_accessor :actual                 # 0-1 boolean
      attr_accessor :definition             # 0-1 CodeableReference
      attr_accessor :handling               # 0-1 code
      attr_accessor :category               # 0-* [ EvidenceVariable::Category ]

      def resourceType
        'EvidenceVariable'
      end
    end
  end
end