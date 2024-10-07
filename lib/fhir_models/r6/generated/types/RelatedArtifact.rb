module FHIR
  module R6
    class RelatedArtifact < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'RelatedArtifact.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'RelatedArtifact.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/related-artifact-type'=>['documentation', 'justification', 'citation', 'predecessor', 'successor', 'derived-from', 'depends-on', 'composed-of', 'part-of', 'amends', 'amended-with', 'appends', 'appended-with', 'cites', 'cited-by', 'comments-on', 'comment-in', 'contains', 'contained-in', 'corrects', 'correction-in', 'replaces', 'replaced-with', 'retracts', 'retracted-by', 'signs', 'similar-to', 'supports', 'supported-with', 'transforms', 'transformed-into', 'transformed-with', 'documents', 'specification-of', 'created-with', 'cite-as']}, 'type'=>'code', 'path'=>'RelatedArtifact.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/related-artifact-type'}},
        'classifier' => {'valid_codes'=>{'http://hl7.org/fhir/citation-artifact-classifier'=>['audio', 'D001877', 'cds-artifact', 'D016420', 'common-share', 'D019991', 'D064886', 'dataset-unpublished', 'Electronic', 'Electronic-eCollection', 'Electronic-Print', 'executable-app', 'fhir-resource', 'image', 'interactive-form', 'D016428', 'D016422', 'machine-code', 'medline-base', 'prediction-model', 'D000076942', 'Print', 'Print-Electronic', 'project-specific', 'protocol', 'pseudocode', 'D016425', 'standard-specification', 'terminology', 'D059040', 'webpage']}, 'type'=>'CodeableConcept', 'path'=>'RelatedArtifact.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/citation-artifact-classifier'}},
        'label' => {'type'=>'string', 'path'=>'RelatedArtifact.label', 'min'=>0, 'max'=>1},
        'display' => {'type'=>'string', 'path'=>'RelatedArtifact.display', 'min'=>0, 'max'=>1},
        'citation' => {'type'=>'markdown', 'path'=>'RelatedArtifact.citation', 'min'=>0, 'max'=>1},
        'document' => {'type'=>'Attachment', 'path'=>'RelatedArtifact.document', 'min'=>0, 'max'=>1},
        'resource' => {'type'=>'canonical', 'path'=>'RelatedArtifact.resource', 'min'=>0, 'max'=>1},
        'resourceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RelatedArtifact.resourceReference', 'min'=>0, 'max'=>1},
        'publicationStatus' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'RelatedArtifact.publicationStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'publicationDate' => {'type'=>'date', 'path'=>'RelatedArtifact.publicationDate', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 string
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :type              # 1-1 code
      attr_accessor :classifier        # 0-* [ CodeableConcept ]
      attr_accessor :label             # 0-1 string
      attr_accessor :display           # 0-1 string
      attr_accessor :citation          # 0-1 markdown
      attr_accessor :document          # 0-1 Attachment
      attr_accessor :resource          # 0-1 canonical
      attr_accessor :resourceReference # 0-1 Reference(Resource)
      attr_accessor :publicationStatus # 0-1 code
      attr_accessor :publicationDate   # 0-1 date
    end
  end
end