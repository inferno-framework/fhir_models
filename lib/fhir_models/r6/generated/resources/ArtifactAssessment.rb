module FHIR
  module R6
    class ArtifactAssessment < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'citeAs' => ['Reference', 'markdown'],
        'artifact' => ['Reference', 'canonical', 'uri']
      }
      SEARCH_PARAMS = ['date', 'identifier']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ArtifactAssessment.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ArtifactAssessment.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ArtifactAssessment.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ArtifactAssessment.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ArtifactAssessment.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ArtifactAssessment.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ArtifactAssessment.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ArtifactAssessment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'ArtifactAssessment.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'title' => {'type'=>'string', 'path'=>'ArtifactAssessment.title', 'min'=>0, 'max'=>1},
        'citeAsReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Citation'], 'type'=>'Reference', 'path'=>'ArtifactAssessment.citeAs[x]', 'min'=>0, 'max'=>1},
        'citeAsMarkdown' => {'type'=>'markdown', 'path'=>'ArtifactAssessment.citeAs[x]', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'ArtifactAssessment.date', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'ArtifactAssessment.copyright', 'min'=>0, 'max'=>1},
        'approvalDate' => {'type'=>'date', 'path'=>'ArtifactAssessment.approvalDate', 'min'=>0, 'max'=>1},
        'lastReviewDate' => {'type'=>'date', 'path'=>'ArtifactAssessment.lastReviewDate', 'min'=>0, 'max'=>1},
        'artifactReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'ArtifactAssessment.artifact[x]', 'min'=>1, 'max'=>1},
        'artifactCanonical' => {'type'=>'canonical', 'path'=>'ArtifactAssessment.artifact[x]', 'min'=>1, 'max'=>1},
        'artifactUri' => {'type'=>'uri', 'path'=>'ArtifactAssessment.artifact[x]', 'min'=>1, 'max'=>1},
        'content' => {'type'=>'ArtifactAssessment::Content', 'path'=>'ArtifactAssessment.content', 'min'=>0, 'max'=>Float::INFINITY},
        'workflowStatus' => {'valid_codes'=>{'http://hl7.org/fhir/artifactassessment-workflow-status'=>['submitted', 'triaged', 'waiting-for-input', 'resolved-no-change', 'resolved-change-required', 'deferred', 'duplicate', 'applied', 'published', 'entered-in-error']}, 'type'=>'code', 'path'=>'ArtifactAssessment.workflowStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/artifactassessment-workflow-status'}},
        'disposition' => {'valid_codes'=>{'http://hl7.org/fhir/artifactassessment-disposition'=>['unresolved', 'not-persuasive', 'persuasive', 'persuasive-with-modification', 'not-persuasive-with-modification']}, 'type'=>'code', 'path'=>'ArtifactAssessment.disposition', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/artifactassessment-disposition'}}
      }

      class Content < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Content.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Content.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Content.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'informationType' => {'valid_codes'=>{'http://hl7.org/fhir/artifactassessment-information-type'=>['comment', 'classifier', 'rating', 'container', 'response', 'change-request']}, 'type'=>'code', 'path'=>'Content.informationType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/artifactassessment-information-type'}},
          'summary' => {'type'=>'markdown', 'path'=>'Content.summary', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/certainty-type'=>['Overall', 'RiskOfBias', 'Inconsistency', 'Indirectness', 'Imprecision', 'PublicationBias', 'DoseResponseGradient', 'PlausibleConfounding', 'LargeEffect']}, 'type'=>'CodeableConcept', 'path'=>'Content.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/certainty-type'}},
          'classifier' => {'valid_codes'=>{'http://hl7.org/fhir/certainty-rating'=>['high', 'moderate', 'low', 'very-low', 'no-concern', 'serious-concern', 'very-serious-concern', 'extremely-serious-concern', 'present', 'absent', 'no-change', 'downcode1', 'downcode2', 'downcode3', 'upcode1', 'upcode2']}, 'type'=>'CodeableConcept', 'path'=>'Content.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/certainty-rating'}},
          'quantity' => {'type'=>'Quantity', 'path'=>'Content.quantity', 'min'=>0, 'max'=>1},
          'author' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Content.author', 'min'=>0, 'max'=>1},
          'path' => {'type'=>'uri', 'path'=>'Content.path', 'min'=>0, 'max'=>Float::INFINITY},
          'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'Content.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
          'freeToShare' => {'type'=>'boolean', 'path'=>'Content.freeToShare', 'min'=>0, 'max'=>1},
          'component' => {'type'=>'ArtifactAssessment::Content', 'path'=>'Content.component', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :informationType   # 0-1 code
        attr_accessor :summary           # 0-1 markdown
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :classifier        # 0-* [ CodeableConcept ]
        attr_accessor :quantity          # 0-1 Quantity
        attr_accessor :author            # 0-1 Reference(Patient|Practitioner|PractitionerRole|Organization|Device)
        attr_accessor :path              # 0-* [ uri ]
        attr_accessor :relatedArtifact   # 0-* [ RelatedArtifact ]
        attr_accessor :freeToShare       # 0-1 boolean
        attr_accessor :component         # 0-* [ ArtifactAssessment::Content ]
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
      attr_accessor :title             # 0-1 string
      attr_accessor :citeAsReference   # 0-1 Reference(Citation)
      attr_accessor :citeAsMarkdown    # 0-1 markdown
      attr_accessor :date              # 0-1 dateTime
      attr_accessor :copyright         # 0-1 markdown
      attr_accessor :approvalDate      # 0-1 date
      attr_accessor :lastReviewDate    # 0-1 date
      attr_accessor :artifactReference # 1-1 Reference(Resource)
      attr_accessor :artifactCanonical # 1-1 canonical
      attr_accessor :artifactUri       # 1-1 uri
      attr_accessor :content           # 0-* [ ArtifactAssessment::Content ]
      attr_accessor :workflowStatus    # 0-1 code
      attr_accessor :disposition       # 0-1 code

      def resourceType
        'ArtifactAssessment'
      end
    end
  end
end