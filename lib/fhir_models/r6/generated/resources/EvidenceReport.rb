module FHIR
  module R6
    class EvidenceReport < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'citeAs' => ['Reference', 'markdown']
      }
      SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'identifier', 'publisher', 'status', 'url']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'EvidenceReport.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'EvidenceReport.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'EvidenceReport.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'EvidenceReport.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'EvidenceReport.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'EvidenceReport.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'EvidenceReport.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'EvidenceReport.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'EvidenceReport.url', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'EvidenceReport.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'useContext' => {'type'=>'UsageContext', 'path'=>'EvidenceReport.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'EvidenceReport.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedIdentifier' => {'type'=>'Identifier', 'path'=>'EvidenceReport.relatedIdentifier', 'min'=>0, 'max'=>Float::INFINITY},
        'citeAsReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Citation'], 'type'=>'Reference', 'path'=>'EvidenceReport.citeAs[x]', 'min'=>0, 'max'=>1},
        'citeAsMarkdown' => {'type'=>'markdown', 'path'=>'EvidenceReport.citeAs[x]', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/evidence-report-type'=>['classification', 'search-results', 'resources-compiled', 'text-structured']}, 'type'=>'CodeableConcept', 'path'=>'EvidenceReport.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/evidence-report-type'}},
        'note' => {'type'=>'Annotation', 'path'=>'EvidenceReport.note', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'EvidenceReport.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
        'subject' => {'type'=>'EvidenceReport::Subject', 'path'=>'EvidenceReport.subject', 'min'=>1, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'EvidenceReport.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'EvidenceReport.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'author' => {'type'=>'ContactDetail', 'path'=>'EvidenceReport.author', 'min'=>0, 'max'=>Float::INFINITY},
        'editor' => {'type'=>'ContactDetail', 'path'=>'EvidenceReport.editor', 'min'=>0, 'max'=>Float::INFINITY},
        'reviewer' => {'type'=>'ContactDetail', 'path'=>'EvidenceReport.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
        'endorser' => {'type'=>'ContactDetail', 'path'=>'EvidenceReport.endorser', 'min'=>0, 'max'=>Float::INFINITY},
        'relatesTo' => {'type'=>'EvidenceReport::RelatesTo', 'path'=>'EvidenceReport.relatesTo', 'min'=>0, 'max'=>Float::INFINITY},
        'section' => {'type'=>'EvidenceReport::Section', 'path'=>'EvidenceReport.section', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Subject < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Subject.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Subject.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Subject.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'characteristic' => {'type'=>'EvidenceReport::Subject::Characteristic', 'path'=>'Subject.characteristic', 'min'=>0, 'max'=>Float::INFINITY},
          'note' => {'type'=>'Annotation', 'path'=>'Subject.note', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Characteristic < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'value' => ['Reference', 'CodeableConcept', 'boolean', 'Quantity', 'Range']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Characteristic.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Characteristic.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Characteristic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'valid_codes'=>{'http://hl7.org/fhir/focus-characteristic-code'=>['citation', 'clinical-outcomes-observed', 'population', 'exposure', 'comparator', 'outcome', 'medication-exposures', 'study-type']}, 'type'=>'CodeableConcept', 'path'=>'Characteristic.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/focus-characteristic-code'}},
            'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
            'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
            'valueBoolean' => {'type'=>'boolean', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
            'valueQuantity' => {'type'=>'Quantity', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
            'valueRange' => {'type'=>'Range', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
            'exclude' => {'type'=>'boolean', 'path'=>'Characteristic.exclude', 'min'=>0, 'max'=>1},
            'period' => {'type'=>'Period', 'path'=>'Characteristic.period', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :code                 # 1-1 CodeableConcept
          attr_accessor :valueReference       # 1-1 Reference(Resource)
          attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
          attr_accessor :valueBoolean         # 1-1 boolean
          attr_accessor :valueQuantity        # 1-1 Quantity
          attr_accessor :valueRange           # 1-1 Range
          attr_accessor :exclude              # 0-1 boolean
          attr_accessor :period               # 0-1 Period
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :characteristic    # 0-* [ EvidenceReport::Subject::Characteristic ]
        attr_accessor :note              # 0-* [ Annotation ]
      end

      class RelatesTo < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'RelatesTo.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'RelatesTo.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'RelatesTo.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/report-relation-type'=>['replaces', 'amends', 'appends', 'transforms', 'replacedWith', 'amendedWith', 'appendedWith', 'transformedWith']}, 'type'=>'code', 'path'=>'RelatesTo.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/report-relation-type'}},
          'target' => {'type'=>'EvidenceReport::RelatesTo::Target', 'path'=>'RelatesTo.target', 'min'=>1, 'max'=>1}
        }

        class Target < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'url' => {'type'=>'uri', 'path'=>'Target.url', 'min'=>0, 'max'=>1},
            'identifier' => {'type'=>'Identifier', 'path'=>'Target.identifier', 'min'=>0, 'max'=>1},
            'display' => {'type'=>'markdown', 'path'=>'Target.display', 'min'=>0, 'max'=>1},
            'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Target.resource', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :url               # 0-1 uri
          attr_accessor :identifier        # 0-1 Identifier
          attr_accessor :display           # 0-1 markdown
          attr_accessor :resource          # 0-1 Reference(Resource)
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 code
        attr_accessor :target            # 1-1 EvidenceReport::RelatesTo::Target
      end

      class Section < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Section.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Section.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Section.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'title' => {'type'=>'string', 'path'=>'Section.title', 'min'=>0, 'max'=>1},
          'focus' => {'valid_codes'=>{'http://hl7.org/fhir/evidence-report-section'=>['Evidence', 'Intervention-group-alone-Evidence', 'Intervention-vs-Control-Evidence', 'Control-group-alone-Evidence', 'EvidenceVariable', 'EvidenceVariable-observed', 'EvidenceVariable-intended', 'EvidenceVariable-population', 'EvidenceVariable-exposure', 'EvidenceVariable-outcome', 'Efficacy-outcomes', 'Harms-outcomes', 'SampleSize', 'References', 'Assertion', 'Reasons', 'Certainty-of-Evidence', 'Evidence-Classifier', 'Warnings', 'Text-Summary', 'SummaryOfBodyOfEvidenceFindings', 'SummaryOfIndividualStudyFindings', 'Header', 'Tables', 'Table', 'Row-Headers', 'Column-Header', 'Column-Headers']}, 'type'=>'CodeableConcept', 'path'=>'Section.focus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/evidence-report-section'}},
          'focusReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Section.focusReference', 'min'=>0, 'max'=>1},
          'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Section.author', 'min'=>0, 'max'=>Float::INFINITY},
          'text' => {'type'=>'Narrative', 'path'=>'Section.text', 'min'=>0, 'max'=>1},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/list-mode'=>['working', 'snapshot', 'changes']}, 'type'=>'code', 'path'=>'Section.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/list-mode'}},
          'orderedBy' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/list-order'=>['user', 'system', 'event-date', 'entry-date', 'priority', 'alphabetic', 'category', 'patient']}, 'type'=>'CodeableConcept', 'path'=>'Section.orderedBy', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/list-order'}},
          'entryClassifier' => {'valid_codes'=>{'http://hl7.org/fhir/evidence-classifier-code'=>['COVID19Specific', 'COVID19Relevant', 'COVID19HumanResearch', 'OriginalResearch', 'ResearchSynthesis', 'Guideline', 'ResearchProtocol', 'NotResearchNotGuideline', 'Treatment', 'PreventionAndControl', 'Diagnosis', 'PrognosisPrediction', 'RatedAsYes', 'RatedAsNo', 'NotAssessed', 'RatedAsRCT', 'RatedAsControlledTrial', 'RatedAsComparativeCohort', 'RatedAsCaseControl', 'RatedAsUncontrolledSeries', 'RatedAsMixedMethods', 'RatedAsOther', 'RiskOfBias', 'NoBlinding', 'AllocConcealNotStated', 'EarlyTrialTermination', 'NoITT', 'Preprint', 'PreliminaryAnalysis', 'BaselineImbalance', 'SubgroupAnalysis']}, 'type'=>'CodeableConcept', 'path'=>'Section.entryClassifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/evidence-classifier-code'}},
          'entryReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Section.entryReference', 'min'=>0, 'max'=>Float::INFINITY},
          'entryQuantity' => {'type'=>'Quantity', 'path'=>'Section.entryQuantity', 'min'=>0, 'max'=>Float::INFINITY},
          'emptyReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/list-empty-reason'=>['nilknown', 'notasked', 'withheld', 'unavailable', 'notstarted', 'closed']}, 'type'=>'CodeableConcept', 'path'=>'Section.emptyReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/list-empty-reason'}},
          'section' => {'type'=>'EvidenceReport::Section', 'path'=>'Section.section', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :title             # 0-1 string
        attr_accessor :focus             # 0-1 CodeableConcept
        attr_accessor :focusReference    # 0-1 Reference(Resource)
        attr_accessor :author            # 0-* [ Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Device|Group|Organization) ]
        attr_accessor :text              # 0-1 Narrative
        attr_accessor :mode              # 0-1 code
        attr_accessor :orderedBy         # 0-1 CodeableConcept
        attr_accessor :entryClassifier   # 0-* [ CodeableConcept ]
        attr_accessor :entryReference    # 0-* [ Reference(Resource) ]
        attr_accessor :entryQuantity     # 0-* [ Quantity ]
        attr_accessor :emptyReason       # 0-1 CodeableConcept
        attr_accessor :section           # 0-* [ EvidenceReport::Section ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :url               # 0-1 uri
      attr_accessor :status            # 1-1 code
      attr_accessor :useContext        # 0-* [ UsageContext ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :relatedIdentifier # 0-* [ Identifier ]
      attr_accessor :citeAsReference   # 0-1 Reference(Citation)
      attr_accessor :citeAsMarkdown    # 0-1 markdown
      attr_accessor :type              # 0-1 CodeableConcept
      attr_accessor :note              # 0-* [ Annotation ]
      attr_accessor :relatedArtifact   # 0-* [ RelatedArtifact ]
      attr_accessor :subject           # 1-1 EvidenceReport::Subject
      attr_accessor :publisher         # 0-1 string
      attr_accessor :contact           # 0-* [ ContactDetail ]
      attr_accessor :author            # 0-* [ ContactDetail ]
      attr_accessor :editor            # 0-* [ ContactDetail ]
      attr_accessor :reviewer          # 0-* [ ContactDetail ]
      attr_accessor :endorser          # 0-* [ ContactDetail ]
      attr_accessor :relatesTo         # 0-* [ EvidenceReport::RelatesTo ]
      attr_accessor :section           # 0-* [ EvidenceReport::Section ]

      def resourceType
        'EvidenceReport'
      end
    end
  end
end