module FHIR
  module R6
    class Consent < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['action', 'actor', 'category', 'controller', 'data', 'date', 'grantee', 'identifier', 'manager', 'patient', 'period', 'purpose', 'security-label', 'source-reference', 'status', 'subject', 'verified', 'verified-date']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Consent.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Consent.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Consent.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Consent.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Consent.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Consent.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Consent.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Consent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Consent.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/consent-state-codes'=>['draft', 'active', 'inactive', 'not-done', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'Consent.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-state-codes'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/consentscope'=>['adr', 'research', 'patient-privacy', 'treatment'], 'http://terminology.hl7.org/CodeSystem/consentcategorycodes'=>['acd', 'dnr', 'emrgonly', 'hcd', 'npp', 'polst', 'research', 'rsdid', 'rsreid'], 'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['_ActConsentType', 'ICOL', 'IDSCL', 'INFA', 'INFAO', 'INFASO', 'IRDSCL', 'RESEARCH', 'RSDID', 'RSREID'], 'http://loinc.org'=>['59284-0', '57016-8', '57017-6', '64292-6']}, 'type'=>'CodeableConcept', 'path'=>'Consent.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-category'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/ResearchSubject', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Consent.subject', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'date', 'path'=>'Consent.date', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'Consent.period', 'min'=>0, 'max'=>1},
        'grantor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Consent.grantor', 'min'=>0, 'max'=>Float::INFINITY},
        'grantee' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Consent.grantee', 'min'=>0, 'max'=>Float::INFINITY},
        'manager' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Consent.manager', 'min'=>0, 'max'=>Float::INFINITY},
        'controller' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Consent.controller', 'min'=>0, 'max'=>Float::INFINITY},
        'sourceAttachment' => {'type'=>'Attachment', 'path'=>'Consent.sourceAttachment', 'min'=>0, 'max'=>Float::INFINITY},
        'sourceReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Consent', 'http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Contract', 'http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse'], 'type'=>'Reference', 'path'=>'Consent.sourceReference', 'min'=>0, 'max'=>Float::INFINITY},
        'regulatoryBasis' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/consentpolicycodes'=>['cric', 'illinois-minor-procedure', 'hipaa-auth', 'hipaa-npp', 'hipaa-restrictions', 'hipaa-research', 'hipaa-self-pay', 'mdhhs-5515', 'nyssipp', 'va-10-0484', 'va-10-0485', 'va-10-5345', 'va-10-5345a', 'va-10-5345a-mhv', 'va-10-10116', 'va-21-4142', 'ssa-827', 'dch-3927', 'squaxin', 'nl-lsp', 'at-elga', 'nih-hipaa', 'nci', 'nih-grdr', 'nih-527', 'ga4gh', 'ch-epr']}, 'type'=>'CodeableConcept', 'path'=>'Consent.regulatoryBasis', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-policy'}},
        'policyBasis' => {'type'=>'Consent::PolicyBasis', 'path'=>'Consent.policyBasis', 'min'=>0, 'max'=>1},
        'policyText' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Consent.policyText', 'min'=>0, 'max'=>Float::INFINITY},
        'verification' => {'type'=>'Consent::Verification', 'path'=>'Consent.verification', 'min'=>0, 'max'=>Float::INFINITY},
        'decision' => {'valid_codes'=>{'http://hl7.org/fhir/consent-provision-type'=>['deny', 'permit']}, 'type'=>'code', 'path'=>'Consent.decision', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-provision-type'}},
        'provision' => {'type'=>'Consent::Provision', 'path'=>'Consent.provision', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class PolicyBasis < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'PolicyBasis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'PolicyBasis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'PolicyBasis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'PolicyBasis.reference', 'min'=>0, 'max'=>1},
          'uri' => {'type'=>'uri', 'path'=>'PolicyBasis.uri', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :reference         # 0-1 Reference(Resource)
        attr_accessor :uri               # 0-1 uri
      end

      class Verification < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Verification.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Verification.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Verification.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'verified' => {'type'=>'boolean', 'path'=>'Verification.verified', 'min'=>1, 'max'=>1},
          'verificationType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/consentverification'=>['family', 'validation']}, 'type'=>'CodeableConcept', 'path'=>'Verification.verificationType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-verification'}},
          'verifiedBy' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Verification.verifiedBy', 'min'=>0, 'max'=>1},
          'verifiedWith' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Verification.verifiedWith', 'min'=>0, 'max'=>1},
          'verificationDate' => {'type'=>'dateTime', 'path'=>'Verification.verificationDate', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :verified          # 1-1 boolean
        attr_accessor :verificationType  # 0-1 CodeableConcept
        attr_accessor :verifiedBy        # 0-1 Reference(Organization|Practitioner|PractitionerRole)
        attr_accessor :verifiedWith      # 0-1 Reference(Patient|RelatedPerson)
        attr_accessor :verificationDate  # 0-* [ dateTime ]
      end

      class Provision < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Provision.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Provision.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Provision.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'period' => {'type'=>'Period', 'path'=>'Provision.period', 'min'=>0, 'max'=>1},
          'actor' => {'type'=>'Consent::Provision::Actor', 'path'=>'Provision.actor', 'min'=>0, 'max'=>Float::INFINITY},
          'action' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/consentaction'=>['collect', 'access', 'use', 'disclose', 'correct']}, 'type'=>'CodeableConcept', 'path'=>'Provision.action', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-action'}},
          'securityLabel' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-Confidentiality'=>['N', 'R'], 'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['ETH', 'PSY', 'STD', 'NOAUTH', 'DELAU', 'NORDSCLCD'], 'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['TREAT', 'HPAYMT', 'ETREAT']}, 'type'=>'Coding', 'path'=>'Provision.securityLabel', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/security-label-examples'}},
          'purpose' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['PurposeOfUse', 'HMARKT', 'HOPERAT', 'CAREMGT', 'DONAT', 'FRAUD', 'GOV', 'HACCRED', 'HCOMPL', 'HDECD', 'HDIRECT', 'HDM', 'HLEGAL', 'HOUTCOMS', 'HPRGRP', 'HQUALIMP', 'HSYSADMIN', 'LABELING', 'METAMGT', 'MEMADMIN', 'MILCDM', 'PATADMIN', 'PATSFTY', 'PERFMSR', 'RECORDMGT', 'SYSDEV', 'HTEST', 'TRAIN', 'MLTRAINING', 'HPAYMT', 'CLMATTCH', 'COVAUTH', 'COVERAGE', 'ELIGDTRM', 'ELIGVER', 'ENROLLM', 'MILDCRG', 'REMITADV', 'PMTDS', 'HRESCH', 'BIORCH', 'CLINTRCH', 'CLINTRCHNPC', 'CLINTRCHPC', 'PRECLINTRCH', 'DSRCH', 'POARCH', 'TRANSRCH', 'PATRQT', 'FAMRQT', 'PWATRNY', 'SUPNWK', 'PUBHLTH', 'DISASTER', 'THREAT', 'TREAT', 'CLINTRL', 'COC', 'ETREAT', 'BTG', 'ERTREAT', 'POPHLTH', 'TREATDS']}, 'type'=>'Coding', 'path'=>'Provision.purpose', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-PurposeOfUse'}},
          'documentType' => {'valid_codes'=>{'urn:ietf:rfc:3986'=>['http://hl7.org/fhir/StructureDefinition/lipidprofile'], 'urn:ietf:bcp:13'=>['application/hl7-cda+xml']}, 'type'=>'Coding', 'path'=>'Provision.documentType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-content-class'}},
          'resourceType' => {'local_name'=>'local_resourceType', 'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['Account', 'ActivityDefinition', 'ActorDefinition', 'AdministrableProductDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'ArtifactAssessment', 'AuditEvent', 'Basic', 'Binary', 'BiologicallyDerivedProduct', 'BiologicallyDerivedProductDispense', 'BodyStructure', 'Bundle', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'ChargeItemDefinition', 'Citation', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'ClinicalUseDefinition', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'ConditionDefinition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'Device', 'DeviceAlert', 'DeviceAssociation', 'DeviceDefinition', 'DeviceDispense', 'DeviceMetric', 'DeviceRequest', 'DeviceUsage', 'DiagnosticReport', 'DocumentReference', 'Encounter', 'EncounterHistory', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceReport', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'FormularyItem', 'GenomicStudy', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingSelection', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'Ingredient', 'InsurancePlan', 'InsuranceProduct', 'InventoryItem', 'InventoryReport', 'Invoice', 'Library', 'Linkage', 'List', 'Location', 'ManufacturedItemDefinition', 'Measure', 'MeasureReport', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProductDefinition', 'MessageDefinition', 'MessageHeader', 'MolecularDefinition', 'MolecularSequence', 'NamingSystem', 'NutritionIntake', 'NutritionOrder', 'NutritionProduct', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'Organization', 'OrganizationAffiliation', 'PackagedProductDefinition', 'Parameters', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Permission', 'Person', 'PersonalRelationship', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RegulatedAuthorization', 'RelatedPerson', 'RequestOrchestration', 'Requirements', 'ResearchStudy', 'ResearchSubject', 'RiskAssessment', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'SubscriptionStatus', 'SubscriptionTopic', 'Substance', 'SubstanceDefinition', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestPlan', 'TestReport', 'TestScript', 'Transport', 'ValueSet', 'VerificationResult', 'VisionPrescription']}, 'type'=>'Coding', 'path'=>'Provision.resourceType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/resource-types'}},
          'code' => {'type'=>'CodeableConcept', 'path'=>'Provision.code', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-content-code'}},
          'dataPeriod' => {'type'=>'Period', 'path'=>'Provision.dataPeriod', 'min'=>0, 'max'=>1},
          'data' => {'type'=>'Consent::Provision::Data', 'path'=>'Provision.data', 'min'=>0, 'max'=>Float::INFINITY},
          'expression' => {'type'=>'Expression', 'path'=>'Provision.expression', 'min'=>0, 'max'=>1},
          'provision' => {'type'=>'Consent::Provision', 'path'=>'Provision.provision', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Actor < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Actor.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Actor.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Actor.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'role' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/provenance-participant-type'=>['enterer', 'performer', 'author', 'editor', 'verifier', 'legal', 'attester', 'informant', 'custodian', 'assembler', 'transformer', 'composer'], 'http://dicom.nema.org/resources/ontology/DCM'=>['110150', '110151', '110152', '110153', '110154', '110155'], 'http://terminology.hl7.org/CodeSystem/extra-security-role-type'=>['authserver', 'datacollector', 'dataprocessor', 'datasubject', 'humanuser']}, 'type'=>'CodeableConcept', 'path'=>'Actor.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/participation-role-type'}},
            'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Actor.reference', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :role              # 0-1 CodeableConcept
          attr_accessor :reference         # 0-1 Reference(Device|Group|CareTeam|Organization|Patient|Practitioner|RelatedPerson|PractitionerRole)
        end

        class Data < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Data.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Data.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Data.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'meaning' => {'valid_codes'=>{'http://hl7.org/fhir/consent-data-meaning'=>['instance', 'related', 'dependents', 'authoredby']}, 'type'=>'code', 'path'=>'Data.meaning', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/consent-data-meaning'}},
            'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Data.reference', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :meaning           # 1-1 code
          attr_accessor :reference         # 1-1 Reference(Resource)
        end

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :period             # 0-1 Period
        attr_accessor :actor              # 0-* [ Consent::Provision::Actor ]
        attr_accessor :action             # 0-* [ CodeableConcept ]
        attr_accessor :securityLabel      # 0-* [ Coding ]
        attr_accessor :purpose            # 0-* [ Coding ]
        attr_accessor :documentType       # 0-* [ Coding ]
        attr_accessor :local_resourceType # 0-* [ Coding ]
        attr_accessor :code               # 0-* [ CodeableConcept ]
        attr_accessor :dataPeriod         # 0-1 Period
        attr_accessor :data               # 0-* [ Consent::Provision::Data ]
        attr_accessor :expression         # 0-1 Expression
        attr_accessor :provision          # 0-* [ Consent::Provision ]
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
      attr_accessor :status            # 1-1 code
      attr_accessor :category          # 0-* [ CodeableConcept ]
      attr_accessor :subject           # 0-1 Reference(Patient|Practitioner|ResearchSubject|Group)
      attr_accessor :date              # 0-1 date
      attr_accessor :period            # 0-1 Period
      attr_accessor :grantor           # 0-* [ Reference(CareTeam|HealthcareService|Organization|Patient|Practitioner|RelatedPerson|PractitionerRole) ]
      attr_accessor :grantee           # 0-* [ Reference(CareTeam|HealthcareService|Organization|Patient|Practitioner|RelatedPerson|PractitionerRole) ]
      attr_accessor :manager           # 0-* [ Reference(HealthcareService|Organization|Patient|Practitioner) ]
      attr_accessor :controller        # 0-* [ Reference(HealthcareService|Organization|Patient|Practitioner) ]
      attr_accessor :sourceAttachment  # 0-* [ Attachment ]
      attr_accessor :sourceReference   # 0-* [ Reference(Consent|DocumentReference|Contract|QuestionnaireResponse) ]
      attr_accessor :regulatoryBasis   # 0-* [ CodeableConcept ]
      attr_accessor :policyBasis       # 0-1 Consent::PolicyBasis
      attr_accessor :policyText        # 0-* [ Reference(DocumentReference) ]
      attr_accessor :verification      # 0-* [ Consent::Verification ]
      attr_accessor :decision          # 0-1 code
      attr_accessor :provision         # 0-* [ Consent::Provision ]

      def resourceType
        'Consent'
      end
    end
  end
end