module FHIR
  module R6
    class Evidence < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding'],
        'citeAs' => ['Reference', 'markdown']
      }
      SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'description', 'identifier', 'publisher', 'status', 'title', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Evidence.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Evidence.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Evidence.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Evidence.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Evidence.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Evidence.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Evidence.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Evidence.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'Evidence.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'Evidence.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'Evidence.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'Evidence.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'Evidence.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'Evidence.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'Evidence.title', 'min'=>0, 'max'=>1},
        'citeAsReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Citation'], 'type'=>'Reference', 'path'=>'Evidence.citeAs[x]', 'min'=>0, 'max'=>1},
        'citeAsMarkdown' => {'type'=>'markdown', 'path'=>'Evidence.citeAs[x]', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'Evidence.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'Evidence.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'Evidence.date', 'min'=>0, 'max'=>1},
        'approvalDate' => {'type'=>'date', 'path'=>'Evidence.approvalDate', 'min'=>0, 'max'=>1},
        'lastReviewDate' => {'type'=>'date', 'path'=>'Evidence.lastReviewDate', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'Evidence.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'Evidence.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'author' => {'type'=>'ContactDetail', 'path'=>'Evidence.author', 'min'=>0, 'max'=>Float::INFINITY},
        'editor' => {'type'=>'ContactDetail', 'path'=>'Evidence.editor', 'min'=>0, 'max'=>Float::INFINITY},
        'reviewer' => {'type'=>'ContactDetail', 'path'=>'Evidence.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
        'endorser' => {'type'=>'ContactDetail', 'path'=>'Evidence.endorser', 'min'=>0, 'max'=>Float::INFINITY},
        'useContext' => {'type'=>'UsageContext', 'path'=>'Evidence.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'purpose' => {'type'=>'markdown', 'path'=>'Evidence.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'Evidence.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'Evidence.copyrightLabel', 'min'=>0, 'max'=>1},
        'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'Evidence.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'Evidence.description', 'min'=>0, 'max'=>1},
        'assertion' => {'type'=>'markdown', 'path'=>'Evidence.assertion', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'Evidence.note', 'min'=>0, 'max'=>Float::INFINITY},
        'variableDefinition' => {'type'=>'Evidence::VariableDefinition', 'path'=>'Evidence.variableDefinition', 'min'=>1, 'max'=>Float::INFINITY},
        'synthesisType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/synthesis-type'=>['std-MA', 'IPD-MA', 'indirect-NMA', 'combined-NMA', 'range', 'classification', 'NotApplicable', 'pooled']}, 'type'=>'CodeableConcept', 'path'=>'Evidence.synthesisType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/synthesis-type'}},
        'studyDesign' => {'valid_codes'=>{'http://hl7.org/fhir/study-design'=>['SEVCO:01001', 'SEVCO:01003', 'SEVCO:01006', 'SEVCO:01007', 'SEVCO:01008', 'SEVCO:01009', 'SEVCO:01005', 'SEVCO:01004', 'SEVCO:01029', 'SEVCO:01041', 'SEVCO:01038', 'SEVCO:01030', 'SEVCO:01031', 'SEVCO:01032', 'SEVCO:01033', 'SEVCO:01034', 'SEVCO:01035', 'SEVCO:01036', 'SEVCO:01002', 'SEVCO:01037', 'SEVCO:01010', 'SEVCO:01011', 'SEVCO:01012', 'SEVCO:01024', 'SEVCO:01025', 'SEVCO:01013', 'SEVCO:01014', 'SEVCO:01020', 'SEVCO:01021', 'SEVCO:01015', 'SEVCO:01023', 'SEVCO:01016', 'SEVCO:01017', 'SEVCO:01022', 'SEVCO:01044', 'SEVCO:01027', 'SEVCO:01028', 'SEVCO:01018', 'SEVCO:01019', 'SEVCO:01045', 'SEVCO:01026', 'SEVCO:01039', 'SEVCO:01050', 'SEVCO:01040', 'SEVCO:01048', 'SEVCO:01046', 'SEVCO:01049', 'SEVCO:01042', 'SEVCO:01051', 'SEVCO:01086', 'SEVCO:01087', 'SEVCO:01060', 'SEVCO:01061', 'SEVCO:01062', 'SEVCO:01063', 'SEVCO:01064', 'SEVCO:01043', 'SEVCO:01052', 'SEVCO:01053', 'SEVCO:01054', 'SEVCO:01085', 'SEVCO:01089', 'SEVCO:01096', 'SEVCO:01097', 'SEVCO:01098', 'SEVCO:01088', 'SEVCO:01091', 'SEVCO:01090', 'SEVCO:01092', 'SEVCO:01093', 'SEVCO:01094', 'SEVCO:01095']}, 'type'=>'CodeableConcept', 'path'=>'Evidence.studyDesign', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/study-design'}},
        'statistic' => {'type'=>'Evidence::Statistic', 'path'=>'Evidence.statistic', 'min'=>0, 'max'=>Float::INFINITY},
        'certainty' => {'type'=>'Evidence::Certainty', 'path'=>'Evidence.certainty', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class VariableDefinition < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'VariableDefinition.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'VariableDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'VariableDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'markdown', 'path'=>'VariableDefinition.description', 'min'=>0, 'max'=>1},
          'note' => {'type'=>'Annotation', 'path'=>'VariableDefinition.note', 'min'=>0, 'max'=>Float::INFINITY},
          'variableRole' => {'valid_codes'=>{'http://hl7.org/fhir/variable-role'=>['population', 'exposure', 'outcome', 'covariate']}, 'type'=>'code', 'path'=>'VariableDefinition.variableRole', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/variable-role'}},
          'roleSubtype' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/variable-role'=>['population', 'subpopulation', 'exposure', 'referenceExposure', 'measuredVariable', 'confounder', 'measuredVariableA', 'measuredVariableB', 'measuredVariableAB']}, 'type'=>'CodeableConcept', 'path'=>'VariableDefinition.roleSubtype', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/variable-role-subtype'}},
          'comparatorCategory' => {'type'=>'string', 'path'=>'VariableDefinition.comparatorCategory', 'min'=>0, 'max'=>1},
          'observed' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'VariableDefinition.observed', 'min'=>0, 'max'=>1},
          'intended' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'VariableDefinition.intended', 'min'=>0, 'max'=>1},
          'directnessMatch' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/directness'=>['low', 'moderate', 'high', 'exact']}, 'type'=>'CodeableConcept', 'path'=>'VariableDefinition.directnessMatch', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/directness'}}
        }

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :description        # 0-1 markdown
        attr_accessor :note               # 0-* [ Annotation ]
        attr_accessor :variableRole       # 1-1 code
        attr_accessor :roleSubtype        # 0-1 CodeableConcept
        attr_accessor :comparatorCategory # 0-1 string
        attr_accessor :observed           # 0-1 Reference(Group|EvidenceVariable)
        attr_accessor :intended           # 0-1 Reference(Group|EvidenceVariable)
        attr_accessor :directnessMatch    # 0-1 CodeableConcept
      end

      class Statistic < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Statistic.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Statistic.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Statistic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'markdown', 'path'=>'Statistic.description', 'min'=>0, 'max'=>1},
          'note' => {'type'=>'Annotation', 'path'=>'Statistic.note', 'min'=>0, 'max'=>Float::INFINITY},
          'statisticType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/statistic-type'=>['absolute-MedianDiff', 'C25463', '0000301', 'predictedRisk', 'descriptive', 'C93150', 'C16726', 'rate-ratio', 'C25564', 'C53319', '0000457', 'C28007', 'C25570', 'C16932', 'C65172', 'C17010', 'C44256', '0000565', 'C93152', '0000424', 'C65171', '0000100']}, 'type'=>'CodeableConcept', 'path'=>'Statistic.statisticType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/statistic-type'}},
          'category' => {'type'=>'CodeableConcept', 'path'=>'Statistic.category', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'Statistic.quantity', 'min'=>0, 'max'=>1},
          'numberOfEvents' => {'type'=>'unsignedInt', 'path'=>'Statistic.numberOfEvents', 'min'=>0, 'max'=>1},
          'numberAffected' => {'type'=>'unsignedInt', 'path'=>'Statistic.numberAffected', 'min'=>0, 'max'=>1},
          'sampleSize' => {'type'=>'Evidence::Statistic::SampleSize', 'path'=>'Statistic.sampleSize', 'min'=>0, 'max'=>1},
          'attributeEstimate' => {'type'=>'Evidence::Statistic::AttributeEstimate', 'path'=>'Statistic.attributeEstimate', 'min'=>0, 'max'=>Float::INFINITY},
          'modelCharacteristic' => {'type'=>'Evidence::Statistic::ModelCharacteristic', 'path'=>'Statistic.modelCharacteristic', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class SampleSize < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'SampleSize.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'SampleSize.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'SampleSize.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'description' => {'type'=>'markdown', 'path'=>'SampleSize.description', 'min'=>0, 'max'=>1},
            'note' => {'type'=>'Annotation', 'path'=>'SampleSize.note', 'min'=>0, 'max'=>Float::INFINITY},
            'numberOfStudies' => {'type'=>'unsignedInt', 'path'=>'SampleSize.numberOfStudies', 'min'=>0, 'max'=>1},
            'numberOfParticipants' => {'type'=>'unsignedInt', 'path'=>'SampleSize.numberOfParticipants', 'min'=>0, 'max'=>1},
            'knownDataCount' => {'type'=>'unsignedInt', 'path'=>'SampleSize.knownDataCount', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :description          # 0-1 markdown
          attr_accessor :note                 # 0-* [ Annotation ]
          attr_accessor :numberOfStudies      # 0-1 unsignedInt
          attr_accessor :numberOfParticipants # 0-1 unsignedInt
          attr_accessor :knownDataCount       # 0-1 unsignedInt
        end

        class AttributeEstimate < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'AttributeEstimate.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'AttributeEstimate.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'AttributeEstimate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'description' => {'type'=>'markdown', 'path'=>'AttributeEstimate.description', 'min'=>0, 'max'=>1},
            'note' => {'type'=>'Annotation', 'path'=>'AttributeEstimate.note', 'min'=>0, 'max'=>Float::INFINITY},
            'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/attribute-estimate-type'=>['0000419', 'C53324', '0000455', '0000420', 'C53245', 'C44185', 'C38013', 'C53322', '0000037', '0000421', 'C48918']}, 'type'=>'CodeableConcept', 'path'=>'AttributeEstimate.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/attribute-estimate-type'}},
            'quantity' => {'type'=>'Quantity', 'path'=>'AttributeEstimate.quantity', 'min'=>0, 'max'=>1},
            'level' => {'type'=>'decimal', 'path'=>'AttributeEstimate.level', 'min'=>0, 'max'=>1},
            'range' => {'type'=>'Range', 'path'=>'AttributeEstimate.range', 'min'=>0, 'max'=>1},
            'attributeEstimate' => {'type'=>'Evidence::Statistic::AttributeEstimate', 'path'=>'AttributeEstimate.attributeEstimate', 'min'=>0, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :description       # 0-1 markdown
          attr_accessor :note              # 0-* [ Annotation ]
          attr_accessor :type              # 0-1 CodeableConcept
          attr_accessor :quantity          # 0-1 Quantity
          attr_accessor :level             # 0-1 decimal
          attr_accessor :range             # 0-1 Range
          attr_accessor :attributeEstimate # 0-* [ Evidence::Statistic::AttributeEstimate ]
        end

        class ModelCharacteristic < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'value' => ['Quantity', 'Range', 'CodeableConcept']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'ModelCharacteristic.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'ModelCharacteristic.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'ModelCharacteristic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'valid_codes'=>{'http://hl7.org/fhir/statistic-model-code'=>['oneTailedTest', 'twoTailedTest', 'zTest', 'oneSampleTTest', 'twoSampleTTest', 'pairedTTest', 'chiSquareTest', 'chiSquareTestTrend', 'pearsonCorrelation', 'anova', 'anovaOneWay', 'anovaTwoWay', 'anovaTwoWayReplication', 'manova', 'anovaThreeWay', 'signTest', 'wilcoxonSignedRankTest', 'wilcoxonRankSumTest', 'mannWhitneyUTest', 'fishersExactTest', 'mcnemarsTest', 'kruskalWallisTest', 'spearmanCorrelation', 'kendallCorrelation', 'friedmanTest', 'goodmanKruskasGamma', 'glm', 'glmProbit', 'glmLogit', 'glmIdentity', 'glmLog', 'glmGeneralizedLogit', 'glmm', 'glmmProbit', 'glmmLogit', 'glmmIdentity', 'glmmLog', 'glmmGeneralizedLogit', 'linearRegression', 'logisticRegression', 'polynomialRegression', 'coxProportionalHazards', 'binomialDistributionRegression', 'multinomialDistributionRegression', 'poissonRegression', 'negativeBinomialRegression', 'zeroCellConstant', 'zeroCellContinuityCorrection', 'adjusted', 'interactionTerm', 'manteHaenszelMethod', 'metaAnalysis', 'inverseVariance', 'petoMethod', 'hartungKnapp', 'modifiedHartungKnapp', 'effectsFixed', 'effectsRandom', 'chiSquareTestHomogeneity', 'dersimonianLairdMethod', 'pauleMandelMethod', 'restrictedLikelihood', 'maximumLikelihood', 'empiricalBayes', 'hunterSchmidt', 'sidikJonkman', 'hedgesMethod', 'tauDersimonianLaird', 'tauPauleMandel', 'tauRestrictedMaximumLikelihood', 'tauMaximumLikelihood', 'tauEmpiricalBayes', 'tauHunterSchmidt', 'tauSidikJonkman', 'tauHedges', 'poolMantelHaenzsel', 'poolInverseVariance', 'poolPeto', 'poolGeneralizedLinearMixedModel']}, 'type'=>'CodeableConcept', 'path'=>'ModelCharacteristic.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/statistic-model-code'}},
            'valueQuantity' => {'type'=>'Quantity', 'path'=>'ModelCharacteristic.value[x]', 'min'=>0, 'max'=>1},
            'valueRange' => {'type'=>'Range', 'path'=>'ModelCharacteristic.value[x]', 'min'=>0, 'max'=>1},
            'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'ModelCharacteristic.value[x]', 'min'=>0, 'max'=>1},
            'intended' => {'type'=>'boolean', 'path'=>'ModelCharacteristic.intended', 'min'=>0, 'max'=>1},
            'applied' => {'type'=>'boolean', 'path'=>'ModelCharacteristic.applied', 'min'=>0, 'max'=>1},
            'variable' => {'type'=>'Evidence::Statistic::ModelCharacteristic::Variable', 'path'=>'ModelCharacteristic.variable', 'min'=>0, 'max'=>Float::INFINITY},
            'attribute' => {'type'=>'Evidence::Statistic::AttributeEstimate', 'path'=>'ModelCharacteristic.attribute', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Variable < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Variable.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Variable.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Variable.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'variableDefinition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'Variable.variableDefinition', 'min'=>1, 'max'=>1},
              'handling' => {'valid_codes'=>{'http://hl7.org/fhir/variable-handling'=>['continuous', 'dichotomous', 'ordinal', 'polychotomous']}, 'type'=>'code', 'path'=>'Variable.handling', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/variable-handling'}},
              'valueCategory' => {'type'=>'CodeableConcept', 'path'=>'Variable.valueCategory', 'min'=>0, 'max'=>Float::INFINITY},
              'valueQuantity' => {'type'=>'Quantity', 'path'=>'Variable.valueQuantity', 'min'=>0, 'max'=>Float::INFINITY},
              'valueRange' => {'type'=>'Range', 'path'=>'Variable.valueRange', 'min'=>0, 'max'=>Float::INFINITY}
            }

            attr_accessor :id                 # 0-1 string
            attr_accessor :extension          # 0-* [ Extension ]
            attr_accessor :modifierExtension  # 0-* [ Extension ]
            attr_accessor :variableDefinition # 1-1 Reference(Group|EvidenceVariable)
            attr_accessor :handling           # 0-1 code
            attr_accessor :valueCategory      # 0-* [ CodeableConcept ]
            attr_accessor :valueQuantity      # 0-* [ Quantity ]
            attr_accessor :valueRange         # 0-* [ Range ]
          end

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :code                 # 1-1 CodeableConcept
          attr_accessor :valueQuantity        # 0-1 Quantity
          attr_accessor :valueRange           # 0-1 Range
          attr_accessor :valueCodeableConcept # 0-1 CodeableConcept
          attr_accessor :intended             # 0-1 boolean
          attr_accessor :applied              # 0-1 boolean
          attr_accessor :variable             # 0-* [ Evidence::Statistic::ModelCharacteristic::Variable ]
          attr_accessor :attribute            # 0-* [ Evidence::Statistic::AttributeEstimate ]
        end

        attr_accessor :id                  # 0-1 string
        attr_accessor :extension           # 0-* [ Extension ]
        attr_accessor :modifierExtension   # 0-* [ Extension ]
        attr_accessor :description         # 0-1 markdown
        attr_accessor :note                # 0-* [ Annotation ]
        attr_accessor :statisticType       # 0-1 CodeableConcept
        attr_accessor :category            # 0-1 CodeableConcept
        attr_accessor :quantity            # 0-1 Quantity
        attr_accessor :numberOfEvents      # 0-1 unsignedInt
        attr_accessor :numberAffected      # 0-1 unsignedInt
        attr_accessor :sampleSize          # 0-1 Evidence::Statistic::SampleSize
        attr_accessor :attributeEstimate   # 0-* [ Evidence::Statistic::AttributeEstimate ]
        attr_accessor :modelCharacteristic # 0-* [ Evidence::Statistic::ModelCharacteristic ]
      end

      class Certainty < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Certainty.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Certainty.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Certainty.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'markdown', 'path'=>'Certainty.description', 'min'=>0, 'max'=>1},
          'note' => {'type'=>'Annotation', 'path'=>'Certainty.note', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/certainty-type'=>['Overall', 'RiskOfBias', 'Inconsistency', 'Indirectness', 'Imprecision', 'PublicationBias', 'DoseResponseGradient', 'PlausibleConfounding', 'LargeEffect']}, 'type'=>'CodeableConcept', 'path'=>'Certainty.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/certainty-type'}},
          'rating' => {'valid_codes'=>{'http://hl7.org/fhir/certainty-rating'=>['high', 'moderate', 'low', 'very-low', 'no-concern', 'serious-concern', 'very-serious-concern', 'extremely-serious-concern', 'present', 'absent', 'no-change', 'downcode1', 'downcode2', 'downcode3', 'upcode1', 'upcode2']}, 'type'=>'CodeableConcept', 'path'=>'Certainty.rating', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/certainty-rating'}},
          'rater' => {'type'=>'string', 'path'=>'Certainty.rater', 'min'=>0, 'max'=>1},
          'subcomponent' => {'type'=>'Evidence::Certainty', 'path'=>'Certainty.subcomponent', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :description       # 0-1 markdown
        attr_accessor :note              # 0-* [ Annotation ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :rating            # 0-1 CodeableConcept
        attr_accessor :rater             # 0-1 string
        attr_accessor :subcomponent      # 0-* [ Evidence::Certainty ]
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
      attr_accessor :citeAsReference        # 0-1 Reference(Citation)
      attr_accessor :citeAsMarkdown         # 0-1 markdown
      attr_accessor :status                 # 1-1 code
      attr_accessor :experimental           # 0-1 boolean
      attr_accessor :date                   # 0-1 dateTime
      attr_accessor :approvalDate           # 0-1 date
      attr_accessor :lastReviewDate         # 0-1 date
      attr_accessor :publisher              # 0-1 string
      attr_accessor :contact                # 0-* [ ContactDetail ]
      attr_accessor :author                 # 0-* [ ContactDetail ]
      attr_accessor :editor                 # 0-* [ ContactDetail ]
      attr_accessor :reviewer               # 0-* [ ContactDetail ]
      attr_accessor :endorser               # 0-* [ ContactDetail ]
      attr_accessor :useContext             # 0-* [ UsageContext ]
      attr_accessor :purpose                # 0-1 markdown
      attr_accessor :copyright              # 0-1 markdown
      attr_accessor :copyrightLabel         # 0-1 string
      attr_accessor :relatedArtifact        # 0-* [ RelatedArtifact ]
      attr_accessor :description            # 0-1 markdown
      attr_accessor :assertion              # 0-1 markdown
      attr_accessor :note                   # 0-* [ Annotation ]
      attr_accessor :variableDefinition     # 1-* [ Evidence::VariableDefinition ]
      attr_accessor :synthesisType          # 0-1 CodeableConcept
      attr_accessor :studyDesign            # 0-* [ CodeableConcept ]
      attr_accessor :statistic              # 0-* [ Evidence::Statistic ]
      attr_accessor :certainty              # 0-* [ Evidence::Certainty ]

      def resourceType
        'Evidence'
      end
    end
  end
end