module FHIR
  module build.fhir.org
    class DataRequirement < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'subject' => ['CodeableConcept', 'Reference']
      }
      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'DataRequirement.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'DataRequirement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['Base', 'Element', 'BackboneElement', 'DataType', 'Address', 'Annotation', 'Attachment', 'Availability', 'BackboneType', 'Dosage', 'ElementDefinition', 'MarketingStatus', 'ProductShelfLife', 'RelativeTime', 'Timing', 'CodeableConcept', 'CodeableReference', 'Coding', 'ContactDetail', 'ContactPoint', 'Contributor', 'DataRequirement', 'Expression', 'ExtendedContactDetail', 'Extension', 'HumanName', 'Identifier', 'Meta', 'MonetaryComponent', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'PrimitiveType', 'base64Binary', 'boolean', 'date', 'dateTime', 'decimal', 'instant', 'integer', 'positiveInt', 'unsignedInt', 'integer64', 'string', 'code', 'id', 'markdown', 'time', 'uri', 'canonical', 'oid', 'url', 'uuid', 'Quantity', 'Age', 'Count', 'Distance', 'Duration', 'Range', 'Ratio', 'RatioRange', 'Reference', 'RelatedArtifact', 'SampledData', 'Signature', 'TriggerDefinition', 'UsageContext', 'VirtualServiceDetail', 'xhtml', 'Resource', 'Binary', 'Bundle', 'DomainResource', 'Account', 'ActivityDefinition', 'ActorDefinition', 'AdministrableProductDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'ArtifactAssessment', 'AuditEvent', 'Basic', 'BiologicallyDerivedProduct', 'BiologicallyDerivedProductDispense', 'BodyStructure', 'CanonicalResource', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'ChargeItemDefinition', 'Citation', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'ClinicalUseDefinition', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'ConditionDefinition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'Device', 'DeviceAlert', 'DeviceAssociation', 'DeviceDefinition', 'DeviceDispense', 'DeviceMetric', 'DeviceRequest', 'DeviceUsage', 'DiagnosticReport', 'DocumentReference', 'Encounter', 'EncounterHistory', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceReport', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'FormularyItem', 'GenomicStudy', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingSelection', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'Ingredient', 'InsurancePlan', 'InsuranceProduct', 'InventoryItem', 'InventoryReport', 'Invoice', 'Library', 'Linkage', 'List', 'Location', 'ManufacturedItemDefinition', 'Measure', 'MeasureReport', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProductDefinition', 'MessageDefinition', 'MessageHeader', 'MetadataResource', 'MolecularDefinition', 'MolecularSequence', 'NamingSystem', 'NutritionIntake', 'NutritionOrder', 'NutritionProduct', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'Organization', 'OrganizationAffiliation', 'PackagedProductDefinition', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Permission', 'Person', 'PersonalRelationship', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RegulatedAuthorization', 'RelatedPerson', 'RequestOrchestration', 'Requirements', 'ResearchStudy', 'ResearchSubject', 'RiskAssessment', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'SubscriptionStatus', 'SubscriptionTopic', 'Substance', 'SubstanceDefinition', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestPlan', 'TestReport', 'TestScript', 'Transport', 'ValueSet', 'VerificationResult', 'VisionPrescription', 'Parameters']}, 'type'=>'code', 'path'=>'DataRequirement.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fhir-types'}},
        'profile' => {'type'=>'canonical', 'path'=>'DataRequirement.profile', 'min'=>0, 'max'=>Float::INFINITY},
        'subjectCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['CareTeam', 'Device', 'Group', 'HealthcareService', 'Location', 'Organization', 'Patient', 'Practitioner', 'PractitionerRole', 'RelatedPerson']}, 'type'=>'CodeableConcept', 'path'=>'DataRequirement.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/participant-resource-types'}},
        'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'DataRequirement.subject[x]', 'min'=>0, 'max'=>1},
        'mustSupport' => {'type'=>'string', 'path'=>'DataRequirement.mustSupport', 'min'=>0, 'max'=>Float::INFINITY},
        'codeFilter' => {'type'=>'DataRequirement::CodeFilter', 'path'=>'DataRequirement.codeFilter', 'min'=>0, 'max'=>Float::INFINITY},
        'dateFilter' => {'type'=>'DataRequirement::DateFilter', 'path'=>'DataRequirement.dateFilter', 'min'=>0, 'max'=>Float::INFINITY},
        'valueFilter' => {'type'=>'DataRequirement::ValueFilter', 'path'=>'DataRequirement.valueFilter', 'min'=>0, 'max'=>Float::INFINITY},
        'limit' => {'type'=>'positiveInt', 'path'=>'DataRequirement.limit', 'min'=>0, 'max'=>1},
        'sort' => {'type'=>'DataRequirement::Sort', 'path'=>'DataRequirement.sort', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class CodeFilter < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'CodeFilter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CodeFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'CodeFilter.path', 'min'=>0, 'max'=>1},
          'searchParam' => {'type'=>'string', 'path'=>'CodeFilter.searchParam', 'min'=>0, 'max'=>1},
          'valueSet' => {'type'=>'canonical', 'path'=>'CodeFilter.valueSet', 'min'=>0, 'max'=>1},
          'code' => {'type'=>'Coding', 'path'=>'CodeFilter.code', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id          # 0-1 string
        attr_accessor :extension   # 0-* [ Extension ]
        attr_accessor :path        # 0-1 string
        attr_accessor :searchParam # 0-1 string
        attr_accessor :valueSet    # 0-1 canonical
        attr_accessor :code        # 0-* [ Coding ]
      end

      class DateFilter < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['dateTime', 'Period', 'Duration']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'DateFilter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'DateFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'DateFilter.path', 'min'=>0, 'max'=>1},
          'searchParam' => {'type'=>'string', 'path'=>'DateFilter.searchParam', 'min'=>0, 'max'=>1},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1},
          'valuePeriod' => {'type'=>'Period', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1},
          'valueDuration' => {'type'=>'Duration', 'path'=>'DateFilter.value[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id            # 0-1 string
        attr_accessor :extension     # 0-* [ Extension ]
        attr_accessor :path          # 0-1 string
        attr_accessor :searchParam   # 0-1 string
        attr_accessor :valueDateTime # 0-1 dateTime
        attr_accessor :valuePeriod   # 0-1 Period
        attr_accessor :valueDuration # 0-1 Duration
      end

      class ValueFilter < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['dateTime', 'Period', 'Duration']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ValueFilter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ValueFilter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'ValueFilter.path', 'min'=>0, 'max'=>1},
          'searchParam' => {'type'=>'string', 'path'=>'ValueFilter.searchParam', 'min'=>0, 'max'=>1},
          'comparator' => {'valid_codes'=>{'http://hl7.org/fhir/search-comparator'=>['eq', 'gt', 'lt', 'ge', 'le', 'sa', 'eb']}, 'type'=>'code', 'path'=>'ValueFilter.comparator', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/value-filter-comparator'}},
          'valueDateTime' => {'type'=>'dateTime', 'path'=>'ValueFilter.value[x]', 'min'=>0, 'max'=>1},
          'valuePeriod' => {'type'=>'Period', 'path'=>'ValueFilter.value[x]', 'min'=>0, 'max'=>1},
          'valueDuration' => {'type'=>'Duration', 'path'=>'ValueFilter.value[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id            # 0-1 string
        attr_accessor :extension     # 0-* [ Extension ]
        attr_accessor :path          # 0-1 string
        attr_accessor :searchParam   # 0-1 string
        attr_accessor :comparator    # 0-1 code
        attr_accessor :valueDateTime # 0-1 dateTime
        attr_accessor :valuePeriod   # 0-1 Period
        attr_accessor :valueDuration # 0-1 Duration
      end

      class Sort < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Sort.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Sort.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'path' => {'type'=>'string', 'path'=>'Sort.path', 'min'=>1, 'max'=>1},
          'direction' => {'valid_codes'=>{'http://hl7.org/fhir/sort-direction'=>['ascending', 'descending']}, 'type'=>'code', 'path'=>'Sort.direction', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/sort-direction'}}
        }

        attr_accessor :id        # 0-1 string
        attr_accessor :extension # 0-* [ Extension ]
        attr_accessor :path      # 1-1 string
        attr_accessor :direction # 1-1 code
      end

      attr_accessor :id                     # 0-1 string
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :type                   # 1-1 code
      attr_accessor :profile                # 0-* [ canonical ]
      attr_accessor :subjectCodeableConcept # 0-1 CodeableConcept
      attr_accessor :subjectReference       # 0-1 Reference(Group)
      attr_accessor :mustSupport            # 0-* [ string ]
      attr_accessor :codeFilter             # 0-* [ DataRequirement::CodeFilter ]
      attr_accessor :dateFilter             # 0-* [ DataRequirement::DateFilter ]
      attr_accessor :valueFilter            # 0-* [ DataRequirement::ValueFilter ]
      attr_accessor :limit                  # 0-1 positiveInt
      attr_accessor :sort                   # 0-* [ DataRequirement::Sort ]
    end
  end
end