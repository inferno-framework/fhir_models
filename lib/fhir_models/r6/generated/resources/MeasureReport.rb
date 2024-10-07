module FHIR
  module R6
    class MeasureReport < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['date', 'evaluated-resource', 'identifier', 'location', 'measure', 'patient', 'period', 'reporter', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MeasureReport.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MeasureReport.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MeasureReport.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'MeasureReport.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MeasureReport.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MeasureReport.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MeasureReport.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MeasureReport.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MeasureReport.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/measure-report-status'=>['complete', 'pending', 'error']}, 'type'=>'code', 'path'=>'MeasureReport.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-report-status'}},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/measure-report-type'=>['individual', 'subject-list', 'summary', 'data-exchange']}, 'type'=>'code', 'path'=>'MeasureReport.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-report-type'}},
        'dataUpdateType' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/submit-data-update-type'=>['incremental', 'snapshot']}, 'type'=>'code', 'path'=>'MeasureReport.dataUpdateType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/submit-data-update-type'}},
        'measure' => {'type'=>'canonical', 'path'=>'MeasureReport.measure', 'min'=>0, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'MeasureReport.subject', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'MeasureReport.date', 'min'=>0, 'max'=>1},
        'reporter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MeasureReport.reporter', 'min'=>0, 'max'=>1},
        'reportingVendor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MeasureReport.reportingVendor', 'min'=>0, 'max'=>1},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'MeasureReport.location', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'MeasureReport.period', 'min'=>1, 'max'=>1},
        'inputParameters' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Parameters'], 'type'=>'Reference', 'path'=>'MeasureReport.inputParameters', 'min'=>0, 'max'=>1},
        'scoring' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-scoring'=>['attestation', 'proportion', 'ratio', 'continuous-variable', 'cohort', 'composite']}, 'type'=>'CodeableConcept', 'path'=>'MeasureReport.scoring', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/measure-scoring'}},
        'improvementNotation' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-improvement-notation'=>['increase', 'decrease']}, 'type'=>'CodeableConcept', 'path'=>'MeasureReport.improvementNotation', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-improvement-notation'}},
        'group' => {'type'=>'MeasureReport::Group', 'path'=>'MeasureReport.group', 'min'=>0, 'max'=>Float::INFINITY},
        'supplementalData' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MeasureReport.supplementalData', 'min'=>0, 'max'=>Float::INFINITY},
        'evaluatedResource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MeasureReport.evaluatedResource', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Group < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'measureScore' => ['Quantity', 'dateTime', 'CodeableConcept', 'Period', 'Range', 'Duration']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'linkId' => {'type'=>'string', 'path'=>'Group.linkId', 'min'=>0, 'max'=>1},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-group-example'=>['primary-rate', 'secondary-rate']}, 'type'=>'CodeableConcept', 'path'=>'Group.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-group-example'}},
          'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Group.subject', 'min'=>0, 'max'=>1},
          'population' => {'type'=>'MeasureReport::Group::Population', 'path'=>'Group.population', 'min'=>0, 'max'=>Float::INFINITY},
          'measureScoreQuantity' => {'type'=>'Quantity', 'path'=>'Group.measureScore[x]', 'min'=>0, 'max'=>1},
          'measureScoreDateTime' => {'type'=>'dateTime', 'path'=>'Group.measureScore[x]', 'min'=>0, 'max'=>1},
          'measureScoreCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Group.measureScore[x]', 'min'=>0, 'max'=>1},
          'measureScorePeriod' => {'type'=>'Period', 'path'=>'Group.measureScore[x]', 'min'=>0, 'max'=>1},
          'measureScoreRange' => {'type'=>'Range', 'path'=>'Group.measureScore[x]', 'min'=>0, 'max'=>1},
          'measureScoreDuration' => {'type'=>'Duration', 'path'=>'Group.measureScore[x]', 'min'=>0, 'max'=>1},
          'stratifier' => {'type'=>'MeasureReport::Group::Stratifier', 'path'=>'Group.stratifier', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Population < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Population.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Population.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Population.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'linkId' => {'type'=>'string', 'path'=>'Population.linkId', 'min'=>0, 'max'=>1},
            'code' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-population'=>['initial-population', 'numerator', 'numerator-exclusion', 'denominator', 'denominator-exclusion', 'denominator-exception', 'measure-population', 'measure-population-exclusion', 'measure-observation']}, 'type'=>'CodeableConcept', 'path'=>'Population.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-population'}},
            'count' => {'type'=>'integer', 'path'=>'Population.count', 'min'=>0, 'max'=>1},
            'subjectResults' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/List'], 'type'=>'Reference', 'path'=>'Population.subjectResults', 'min'=>0, 'max'=>1},
            'subjectReport' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MeasureReport'], 'type'=>'Reference', 'path'=>'Population.subjectReport', 'min'=>0, 'max'=>Float::INFINITY},
            'subjects' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Population.subjects', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :linkId            # 0-1 string
          attr_accessor :code              # 0-1 CodeableConcept
          attr_accessor :count             # 0-1 integer
          attr_accessor :subjectResults    # 0-1 Reference(List)
          attr_accessor :subjectReport     # 0-* [ Reference(MeasureReport) ]
          attr_accessor :subjects          # 0-1 Reference(Group)
        end

        class Stratifier < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Stratifier.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Stratifier.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Stratifier.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'linkId' => {'type'=>'string', 'path'=>'Stratifier.linkId', 'min'=>0, 'max'=>1},
            'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-stratifier-example'=>['age', 'gender', 'region']}, 'type'=>'CodeableConcept', 'path'=>'Stratifier.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-stratifier-example'}},
            'stratum' => {'type'=>'MeasureReport::Group::Stratifier::Stratum', 'path'=>'Stratifier.stratum', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Stratum < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'value' => ['CodeableConcept', 'boolean', 'Quantity', 'Range', 'Reference'],
              'measureScore' => ['Quantity', 'dateTime', 'CodeableConcept', 'Period', 'Range', 'Duration']
            }
            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Stratum.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Stratum.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Stratum.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'valueCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/measurereport-stratifier-value-example'=>['northwest', 'northeast', 'southwest', 'southeast']}, 'type'=>'CodeableConcept', 'path'=>'Stratum.value[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measurereport-stratifier-value-example'}},
              'valueBoolean' => {'type'=>'boolean', 'path'=>'Stratum.value[x]', 'min'=>0, 'max'=>1},
              'valueQuantity' => {'type'=>'Quantity', 'path'=>'Stratum.value[x]', 'min'=>0, 'max'=>1},
              'valueRange' => {'type'=>'Range', 'path'=>'Stratum.value[x]', 'min'=>0, 'max'=>1},
              'valueReference' => {'type'=>'Reference', 'path'=>'Stratum.value[x]', 'min'=>0, 'max'=>1},
              'component' => {'type'=>'MeasureReport::Group::Stratifier::Stratum::Component', 'path'=>'Stratum.component', 'min'=>0, 'max'=>Float::INFINITY},
              'population' => {'type'=>'MeasureReport::Group::Stratifier::Stratum::Population', 'path'=>'Stratum.population', 'min'=>0, 'max'=>Float::INFINITY},
              'measureScoreQuantity' => {'type'=>'Quantity', 'path'=>'Stratum.measureScore[x]', 'min'=>0, 'max'=>1},
              'measureScoreDateTime' => {'type'=>'dateTime', 'path'=>'Stratum.measureScore[x]', 'min'=>0, 'max'=>1},
              'measureScoreCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Stratum.measureScore[x]', 'min'=>0, 'max'=>1},
              'measureScorePeriod' => {'type'=>'Period', 'path'=>'Stratum.measureScore[x]', 'min'=>0, 'max'=>1},
              'measureScoreRange' => {'type'=>'Range', 'path'=>'Stratum.measureScore[x]', 'min'=>0, 'max'=>1},
              'measureScoreDuration' => {'type'=>'Duration', 'path'=>'Stratum.measureScore[x]', 'min'=>0, 'max'=>1}
            }

            class Component < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              MULTIPLE_TYPES = {
                'value' => ['CodeableConcept', 'boolean', 'Quantity', 'Range', 'Reference']
              }
              METADATA = {
                'id' => {'type'=>'string', 'path'=>'Component.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Component.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Component.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'linkId' => {'type'=>'string', 'path'=>'Component.linkId', 'min'=>0, 'max'=>1},
                'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-stratifier-example'=>['age', 'gender', 'region']}, 'type'=>'CodeableConcept', 'path'=>'Component.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-stratifier-example'}},
                'valueCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/measurereport-stratifier-value-example'=>['northwest', 'northeast', 'southwest', 'southeast']}, 'type'=>'CodeableConcept', 'path'=>'Component.value[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measurereport-stratifier-value-example'}},
                'valueBoolean' => {'type'=>'boolean', 'path'=>'Component.value[x]', 'min'=>1, 'max'=>1},
                'valueQuantity' => {'type'=>'Quantity', 'path'=>'Component.value[x]', 'min'=>1, 'max'=>1},
                'valueRange' => {'type'=>'Range', 'path'=>'Component.value[x]', 'min'=>1, 'max'=>1},
                'valueReference' => {'type'=>'Reference', 'path'=>'Component.value[x]', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                   # 0-1 string
              attr_accessor :extension            # 0-* [ Extension ]
              attr_accessor :modifierExtension    # 0-* [ Extension ]
              attr_accessor :linkId               # 0-1 string
              attr_accessor :code                 # 1-1 CodeableConcept
              attr_accessor :valueCodeableConcept # 1-1 CodeableConcept
              attr_accessor :valueBoolean         # 1-1 boolean
              attr_accessor :valueQuantity        # 1-1 Quantity
              attr_accessor :valueRange           # 1-1 Range
              attr_accessor :valueReference       # 1-1 Reference()
            end

            class Population < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              METADATA = {
                'id' => {'type'=>'string', 'path'=>'Population.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Population.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Population.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'linkId' => {'type'=>'string', 'path'=>'Population.linkId', 'min'=>0, 'max'=>1},
                'code' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-population'=>['initial-population', 'numerator', 'numerator-exclusion', 'denominator', 'denominator-exclusion', 'denominator-exception', 'measure-population', 'measure-population-exclusion', 'measure-observation']}, 'type'=>'CodeableConcept', 'path'=>'Population.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-population'}},
                'count' => {'type'=>'integer', 'path'=>'Population.count', 'min'=>0, 'max'=>1},
                'subjectResults' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/List'], 'type'=>'Reference', 'path'=>'Population.subjectResults', 'min'=>0, 'max'=>1},
                'subjectReport' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MeasureReport'], 'type'=>'Reference', 'path'=>'Population.subjectReport', 'min'=>0, 'max'=>Float::INFINITY},
                'subjects' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Population.subjects', 'min'=>0, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :linkId            # 0-1 string
              attr_accessor :code              # 0-1 CodeableConcept
              attr_accessor :count             # 0-1 integer
              attr_accessor :subjectResults    # 0-1 Reference(List)
              attr_accessor :subjectReport     # 0-* [ Reference(MeasureReport) ]
              attr_accessor :subjects          # 0-1 Reference(Group)
            end

            attr_accessor :id                          # 0-1 string
            attr_accessor :extension                   # 0-* [ Extension ]
            attr_accessor :modifierExtension           # 0-* [ Extension ]
            attr_accessor :valueCodeableConcept        # 0-1 CodeableConcept
            attr_accessor :valueBoolean                # 0-1 boolean
            attr_accessor :valueQuantity               # 0-1 Quantity
            attr_accessor :valueRange                  # 0-1 Range
            attr_accessor :valueReference              # 0-1 Reference()
            attr_accessor :component                   # 0-* [ MeasureReport::Group::Stratifier::Stratum::Component ]
            attr_accessor :population                  # 0-* [ MeasureReport::Group::Stratifier::Stratum::Population ]
            attr_accessor :measureScoreQuantity        # 0-1 Quantity
            attr_accessor :measureScoreDateTime        # 0-1 dateTime
            attr_accessor :measureScoreCodeableConcept # 0-1 CodeableConcept
            attr_accessor :measureScorePeriod          # 0-1 Period
            attr_accessor :measureScoreRange           # 0-1 Range
            attr_accessor :measureScoreDuration        # 0-1 Duration
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :linkId            # 0-1 string
          attr_accessor :code              # 0-1 CodeableConcept
          attr_accessor :stratum           # 0-* [ MeasureReport::Group::Stratifier::Stratum ]
        end

        attr_accessor :id                          # 0-1 string
        attr_accessor :extension                   # 0-* [ Extension ]
        attr_accessor :modifierExtension           # 0-* [ Extension ]
        attr_accessor :linkId                      # 0-1 string
        attr_accessor :code                        # 0-1 CodeableConcept
        attr_accessor :subject                     # 0-1 Reference(CareTeam|Device|Group|HealthcareService|Location|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson)
        attr_accessor :population                  # 0-* [ MeasureReport::Group::Population ]
        attr_accessor :measureScoreQuantity        # 0-1 Quantity
        attr_accessor :measureScoreDateTime        # 0-1 dateTime
        attr_accessor :measureScoreCodeableConcept # 0-1 CodeableConcept
        attr_accessor :measureScorePeriod          # 0-1 Period
        attr_accessor :measureScoreRange           # 0-1 Range
        attr_accessor :measureScoreDuration        # 0-1 Duration
        attr_accessor :stratifier                  # 0-* [ MeasureReport::Group::Stratifier ]
      end

      attr_accessor :id                  # 0-1 id
      attr_accessor :meta                # 0-1 Meta
      attr_accessor :implicitRules       # 0-1 uri
      attr_accessor :language            # 0-1 code
      attr_accessor :text                # 0-1 Narrative
      attr_accessor :contained           # 0-* [ Resource ]
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :identifier          # 0-* [ Identifier ]
      attr_accessor :status              # 1-1 code
      attr_accessor :type                # 1-1 code
      attr_accessor :dataUpdateType      # 0-1 code
      attr_accessor :measure             # 0-1 canonical
      attr_accessor :subject             # 0-1 Reference(CareTeam|Device|Group|HealthcareService|Location|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson)
      attr_accessor :date                # 0-1 dateTime
      attr_accessor :reporter            # 0-1 Reference(Practitioner|PractitionerRole|Organization|Group)
      attr_accessor :reportingVendor     # 0-1 Reference(Organization)
      attr_accessor :location            # 0-1 Reference(Location)
      attr_accessor :period              # 1-1 Period
      attr_accessor :inputParameters     # 0-1 Reference(Parameters)
      attr_accessor :scoring             # 0-1 CodeableConcept
      attr_accessor :improvementNotation # 0-1 CodeableConcept
      attr_accessor :group               # 0-* [ MeasureReport::Group ]
      attr_accessor :supplementalData    # 0-* [ Reference(Resource) ]
      attr_accessor :evaluatedResource   # 0-* [ Reference(Resource) ]

      def resourceType
        'MeasureReport'
      end
    end
  end
end