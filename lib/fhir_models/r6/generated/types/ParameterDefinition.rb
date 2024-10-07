module FHIR
  module build.fhir.org
    class ParameterDefinition < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = []
      METADATA = {
        'id' => {'type'=>'string', 'path'=>'ParameterDefinition.id', 'min'=>0, 'max'=>1},
        'extension' => {'type'=>'Extension', 'path'=>'ParameterDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'code', 'path'=>'ParameterDefinition.name', 'min'=>0, 'max'=>1},
        'use' => {'valid_codes'=>{'http://hl7.org/fhir/operation-parameter-use'=>['in', 'out']}, 'type'=>'code', 'path'=>'ParameterDefinition.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/operation-parameter-use'}},
        'min' => {'type'=>'integer', 'path'=>'ParameterDefinition.min', 'min'=>0, 'max'=>1},
        'max' => {'type'=>'string', 'path'=>'ParameterDefinition.max', 'min'=>0, 'max'=>1},
        'documentation' => {'type'=>'string', 'path'=>'ParameterDefinition.documentation', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['Base', 'Element', 'BackboneElement', 'DataType', 'Address', 'Annotation', 'Attachment', 'Availability', 'BackboneType', 'Dosage', 'ElementDefinition', 'MarketingStatus', 'ProductShelfLife', 'RelativeTime', 'Timing', 'CodeableConcept', 'CodeableReference', 'Coding', 'ContactDetail', 'ContactPoint', 'Contributor', 'DataRequirement', 'Expression', 'ExtendedContactDetail', 'Extension', 'HumanName', 'Identifier', 'Meta', 'MonetaryComponent', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'PrimitiveType', 'base64Binary', 'boolean', 'date', 'dateTime', 'decimal', 'instant', 'integer', 'positiveInt', 'unsignedInt', 'integer64', 'string', 'code', 'id', 'markdown', 'time', 'uri', 'canonical', 'oid', 'url', 'uuid', 'Quantity', 'Age', 'Count', 'Distance', 'Duration', 'Range', 'Ratio', 'RatioRange', 'Reference', 'RelatedArtifact', 'SampledData', 'Signature', 'TriggerDefinition', 'UsageContext', 'VirtualServiceDetail', 'xhtml', 'Resource', 'Binary', 'Bundle', 'DomainResource', 'Account', 'ActivityDefinition', 'ActorDefinition', 'AdministrableProductDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'ArtifactAssessment', 'AuditEvent', 'Basic', 'BiologicallyDerivedProduct', 'BiologicallyDerivedProductDispense', 'BodyStructure', 'CanonicalResource', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'ChargeItemDefinition', 'Citation', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'ClinicalUseDefinition', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'ConditionDefinition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'Device', 'DeviceAlert', 'DeviceAssociation', 'DeviceDefinition', 'DeviceDispense', 'DeviceMetric', 'DeviceRequest', 'DeviceUsage', 'DiagnosticReport', 'DocumentReference', 'Encounter', 'EncounterHistory', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceReport', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'FormularyItem', 'GenomicStudy', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingSelection', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'Ingredient', 'InsurancePlan', 'InsuranceProduct', 'InventoryItem', 'InventoryReport', 'Invoice', 'Library', 'Linkage', 'List', 'Location', 'ManufacturedItemDefinition', 'Measure', 'MeasureReport', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProductDefinition', 'MessageDefinition', 'MessageHeader', 'MetadataResource', 'MolecularDefinition', 'MolecularSequence', 'NamingSystem', 'NutritionIntake', 'NutritionOrder', 'NutritionProduct', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'Organization', 'OrganizationAffiliation', 'PackagedProductDefinition', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Permission', 'Person', 'PersonalRelationship', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RegulatedAuthorization', 'RelatedPerson', 'RequestOrchestration', 'Requirements', 'ResearchStudy', 'ResearchSubject', 'RiskAssessment', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'SubscriptionStatus', 'SubscriptionTopic', 'Substance', 'SubstanceDefinition', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestPlan', 'TestReport', 'TestScript', 'Transport', 'ValueSet', 'VerificationResult', 'VisionPrescription', 'Parameters']}, 'type'=>'code', 'path'=>'ParameterDefinition.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fhir-types'}},
        'profile' => {'type'=>'canonical', 'path'=>'ParameterDefinition.profile', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id            # 0-1 string
      attr_accessor :extension     # 0-* [ Extension ]
      attr_accessor :name          # 0-1 code
      attr_accessor :use           # 1-1 code
      attr_accessor :min           # 0-1 integer
      attr_accessor :max           # 0-1 string
      attr_accessor :documentation # 0-1 string
      attr_accessor :type          # 1-1 code
      attr_accessor :profile       # 0-1 canonical
    end
  end
end