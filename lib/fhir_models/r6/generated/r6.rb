module FHIR
  module build.fhir.org

    PRIMITIVES = {
      'base64Binary' => {'type'=>'string', 'regex'=>'(?:[A-Za-z0-9+/]{4})*(?:[A-Za-z0-9+/]{2}==|[A-Za-z0-9+/]{3}=)?'},
      'boolean' => {'type'=>'boolean', 'regex'=>'true|false'},
      'canonical' => {'type'=>'string', 'regex'=>'\\S*'},
      'code' => {'type'=>'string', 'regex'=>'[^\\s]+( [^\\s]+)*'},
      'date' => {'type'=>'date', 'regex'=>'([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)(-(0[1-9]|1[0-2])(-(0[1-9]|[1-2][0-9]|3[0-1]))?)?'},
      'dateTime' => {'type'=>'datetime', 'regex'=>'([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)(-(0[1-9]|1[0-2])(-(0[1-9]|[1-2][0-9]|3[0-1])(T([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\\.[0-9]{1,9})?)?)?(Z|(\\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00)?)?)?'},
      'decimal' => {'type'=>'decimal', 'regex'=>'-?(0|[1-9][0-9]{0,17})(\\.[0-9]{1,17})?([eE][+-]?[0-9]{1,9}})?'},
      'id' => {'type'=>'string', 'regex'=>'[A-Za-z0-9\\-\\.]{1,64}'},
      'instant' => {'type'=>'datetime', 'regex'=>'([0-9]([0-9]([0-9][1-9]|[1-9]0)|[1-9]00)|[1-9]000)-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])T([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\\.[0-9]{1,9})?(Z|(\\+|-)((0[0-9]|1[0-3]):[0-5][0-9]|14:00))'},
      'integer' => {'type'=>'integer', 'regex'=>'[0]|[-+]?[1-9][0-9]*'},
      'integer64' => {'type'=>'integer', 'regex'=>'[0]|[-+]?[1-9][0-9]*'},
      'markdown' => {'type'=>'string', 'regex'=>'^[\\s\\S]+$'},
      'oid' => {'type'=>'string', 'regex'=>'urn:oid:[0-2](\\.(0|[1-9][0-9]*))+'},
      'positiveInt' => {'type'=>'string', 'regex'=>'[1-9][0-9]*'},
      'string' => {'type'=>'string', 'regex'=>'^[\\s\\S]+$'},
      'time' => {'type'=>'time', 'regex'=>'([01][0-9]|2[0-3]):[0-5][0-9]:([0-5][0-9]|60)(\\.[0-9]{1,9})?'},
      'unsignedInt' => {'type'=>'string', 'regex'=>'[0]|([1-9][0-9]*)'},
      'uri' => {'type'=>'string', 'regex'=>'\\S*'},
      'url' => {'type'=>'string', 'regex'=>'\\S*'},
      'uuid' => {'type'=>'string', 'regex'=>'urn:uuid:[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}'},
      'xhtml' => {'type'=>'string'}
    }
    TYPES = ['Element', 'BackboneElement', 'Address', 'Age', 'Annotation', 'Attachment', 'Availability', 'BackboneType', 'Base', 'CodeableConcept', 'CodeableReference', 'Coding', 'ContactDetail', 'ContactPoint', 'Contributor', 'Count', 'DataRequirement', 'DataType', 'Distance', 'Dosage', 'Duration', 'ElementDefinition', 'Expression', 'ExtendedContactDetail', 'Extension', 'HumanName', 'Identifier', 'MarketingStatus', 'Meta', 'MonetaryComponent', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'PrimitiveType', 'ProductShelfLife', 'Quantity', 'Range', 'Ratio', 'RatioRange', 'Reference', 'RelatedArtifact', 'RelativeTime', 'SampledData', 'Signature', 'Timing', 'TriggerDefinition', 'UsageContext', 'VirtualServiceDetail']
    RESOURCES = ['Resource', 'Account', 'ActivityDefinition', 'ActorDefinition', 'AdministrableProductDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'ArtifactAssessment', 'AuditEvent', 'Basic', 'Binary', 'BiologicallyDerivedProduct', 'BiologicallyDerivedProductDispense', 'BodyStructure', 'Bundle', 'CanonicalResource', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'ChargeItemDefinition', 'Citation', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'ClinicalUseDefinition', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'ConditionDefinition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'Device', 'DeviceAlert', 'DeviceAssociation', 'DeviceDefinition', 'DeviceDispense', 'DeviceMetric', 'DeviceRequest', 'DeviceUsage', 'DiagnosticReport', 'DocumentReference', 'DomainResource', 'Encounter', 'EncounterHistory', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceReport', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'FormularyItem', 'GenomicStudy', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingSelection', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'Ingredient', 'InsurancePlan', 'InsuranceProduct', 'InventoryItem', 'InventoryReport', 'Invoice', 'Library', 'Linkage', 'List', 'Location', 'ManufacturedItemDefinition', 'Measure', 'MeasureReport', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProductDefinition', 'MessageDefinition', 'MessageHeader', 'MetadataResource', 'MolecularDefinition', 'MolecularSequence', 'NamingSystem', 'NutritionIntake', 'NutritionOrder', 'NutritionProduct', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'Organization', 'OrganizationAffiliation', 'PackagedProductDefinition', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Permission', 'Person', 'PersonalRelationship', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RegulatedAuthorization', 'RelatedPerson', 'RequestOrchestration', 'Requirements', 'ResearchStudy', 'ResearchSubject', 'RiskAssessment', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'SubscriptionStatus', 'SubscriptionTopic', 'Substance', 'SubstanceDefinition', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestPlan', 'TestReport', 'TestScript', 'Transport', 'ValueSet', 'VerificationResult', 'VisionPrescription']

  end
end