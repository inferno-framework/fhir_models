module FHIR
  module R6
    class RiskAssessment < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'occurrence' => ['dateTime', 'Period']
      }
      SEARCH_PARAMS = ['condition', 'date', 'encounter', 'identifier', 'method', 'patient', 'performer', 'probability', 'risk', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'RiskAssessment.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'RiskAssessment.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'RiskAssessment.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'RiskAssessment.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'RiskAssessment.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'RiskAssessment.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'RiskAssessment.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'RiskAssessment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'RiskAssessment.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RiskAssessment.basedOn', 'min'=>0, 'max'=>1},
        'parent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RiskAssessment.parent', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/observation-status'=>['registered', 'specimen-in-process', 'preliminary', 'final', 'amended', 'corrected', 'appended', 'cancelled', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'RiskAssessment.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/observation-status'}},
        'method' => {'local_name'=>'local_method', 'type'=>'CodeableConcept', 'path'=>'RiskAssessment.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example'}},
        'code' => {'type'=>'CodeableConcept', 'path'=>'RiskAssessment.code', 'min'=>0, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'RiskAssessment.subject', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'RiskAssessment.encounter', 'min'=>0, 'max'=>1},
        'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'RiskAssessment.occurrence[x]', 'min'=>0, 'max'=>1},
        'occurrencePeriod' => {'type'=>'Period', 'path'=>'RiskAssessment.occurrence[x]', 'min'=>0, 'max'=>1},
        'condition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'RiskAssessment.condition', 'min'=>0, 'max'=>1},
        'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'RiskAssessment.performer', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'CodeableReference', 'path'=>'RiskAssessment.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'basis' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'RiskAssessment.basis', 'min'=>0, 'max'=>Float::INFINITY},
        'prediction' => {'type'=>'RiskAssessment::Prediction', 'path'=>'RiskAssessment.prediction', 'min'=>0, 'max'=>Float::INFINITY},
        'mitigation' => {'type'=>'string', 'path'=>'RiskAssessment.mitigation', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'RiskAssessment.note', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Prediction < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'probability' => ['decimal', 'Range'],
          'when' => ['Period', 'Range']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Prediction.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Prediction.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Prediction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'outcome' => {'type'=>'CodeableConcept', 'path'=>'Prediction.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example'}},
          'probabilityDecimal' => {'type'=>'decimal', 'path'=>'Prediction.probability[x]', 'min'=>0, 'max'=>1},
          'probabilityRange' => {'type'=>'Range', 'path'=>'Prediction.probability[x]', 'min'=>0, 'max'=>1},
          'qualitativeRisk' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/risk-probability'=>['negligible', 'low', 'moderate', 'high', 'certain']}, 'type'=>'CodeableConcept', 'path'=>'Prediction.qualitativeRisk', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/risk-probability'}},
          'relativeRisk' => {'type'=>'decimal', 'path'=>'Prediction.relativeRisk', 'min'=>0, 'max'=>1},
          'whenPeriod' => {'type'=>'Period', 'path'=>'Prediction.when[x]', 'min'=>0, 'max'=>1},
          'whenRange' => {'type'=>'Range', 'path'=>'Prediction.when[x]', 'min'=>0, 'max'=>1},
          'rationale' => {'type'=>'string', 'path'=>'Prediction.rationale', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :outcome            # 0-1 CodeableConcept
        attr_accessor :probabilityDecimal # 0-1 decimal
        attr_accessor :probabilityRange   # 0-1 Range
        attr_accessor :qualitativeRisk    # 0-1 CodeableConcept
        attr_accessor :relativeRisk       # 0-1 decimal
        attr_accessor :whenPeriod         # 0-1 Period
        attr_accessor :whenRange          # 0-1 Range
        attr_accessor :rationale          # 0-1 string
      end

      attr_accessor :id                 # 0-1 id
      attr_accessor :meta               # 0-1 Meta
      attr_accessor :implicitRules      # 0-1 uri
      attr_accessor :language           # 0-1 code
      attr_accessor :text               # 0-1 Narrative
      attr_accessor :contained          # 0-* [ Resource ]
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :identifier         # 0-* [ Identifier ]
      attr_accessor :basedOn            # 0-1 Reference(Resource)
      attr_accessor :parent             # 0-1 Reference(Resource)
      attr_accessor :status             # 1-1 code
      attr_accessor :local_method       # 0-1 CodeableConcept
      attr_accessor :code               # 0-1 CodeableConcept
      attr_accessor :subject            # 1-1 Reference(Patient|Group)
      attr_accessor :encounter          # 0-1 Reference(Encounter)
      attr_accessor :occurrenceDateTime # 0-1 dateTime
      attr_accessor :occurrencePeriod   # 0-1 Period
      attr_accessor :condition          # 0-1 Reference(Condition)
      attr_accessor :performer          # 0-1 Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Device)
      attr_accessor :reason             # 0-* [ CodeableReference ]
      attr_accessor :basis              # 0-* [ Reference(Resource) ]
      attr_accessor :prediction         # 0-* [ RiskAssessment::Prediction ]
      attr_accessor :mitigation         # 0-1 string
      attr_accessor :note               # 0-* [ Annotation ]

      def resourceType
        'RiskAssessment'
      end
    end
  end
end