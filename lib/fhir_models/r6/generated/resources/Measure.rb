module FHIR
  module R6
    class Measure < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding'],
        'subject' => ['CodeableConcept', 'Reference']
      }
      SEARCH_PARAMS = ['composed-of', 'context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'depends-on', 'derived-from', 'description', 'effective', 'identifier', 'jurisdiction', 'name', 'predecessor', 'publisher', 'status', 'successor', 'title', 'topic', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Measure.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Measure.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Measure.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Measure.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Measure.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Measure.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Measure.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Measure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'Measure.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'Measure.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'Measure.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'Measure.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'Measure.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'Measure.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'Measure.title', 'min'=>0, 'max'=>1},
        'subtitle' => {'type'=>'string', 'path'=>'Measure.subtitle', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'Measure.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'Measure.experimental', 'min'=>0, 'max'=>1},
        'subjectCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['CareTeam', 'Device', 'Group', 'HealthcareService', 'Location', 'Organization', 'Patient', 'Practitioner', 'PractitionerRole', 'RelatedPerson']}, 'type'=>'CodeableConcept', 'path'=>'Measure.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/participant-resource-types'}},
        'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Measure.subject[x]', 'min'=>0, 'max'=>1},
        'basis' => {'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['Base', 'Element', 'BackboneElement', 'DataType', 'Address', 'Annotation', 'Attachment', 'Availability', 'BackboneType', 'Dosage', 'ElementDefinition', 'MarketingStatus', 'ProductShelfLife', 'RelativeTime', 'Timing', 'CodeableConcept', 'CodeableReference', 'Coding', 'ContactDetail', 'ContactPoint', 'Contributor', 'DataRequirement', 'Expression', 'ExtendedContactDetail', 'Extension', 'HumanName', 'Identifier', 'Meta', 'MonetaryComponent', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'PrimitiveType', 'base64Binary', 'boolean', 'date', 'dateTime', 'decimal', 'instant', 'integer', 'positiveInt', 'unsignedInt', 'integer64', 'string', 'code', 'id', 'markdown', 'time', 'uri', 'canonical', 'oid', 'url', 'uuid', 'Quantity', 'Age', 'Count', 'Distance', 'Duration', 'Range', 'Ratio', 'RatioRange', 'Reference', 'RelatedArtifact', 'SampledData', 'Signature', 'TriggerDefinition', 'UsageContext', 'VirtualServiceDetail', 'xhtml', 'Resource', 'Binary', 'Bundle', 'DomainResource', 'Account', 'ActivityDefinition', 'ActorDefinition', 'AdministrableProductDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'ArtifactAssessment', 'AuditEvent', 'Basic', 'BiologicallyDerivedProduct', 'BiologicallyDerivedProductDispense', 'BodyStructure', 'CanonicalResource', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'ChargeItemDefinition', 'Citation', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'ClinicalUseDefinition', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'ConditionDefinition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'Device', 'DeviceAlert', 'DeviceAssociation', 'DeviceDefinition', 'DeviceDispense', 'DeviceMetric', 'DeviceRequest', 'DeviceUsage', 'DiagnosticReport', 'DocumentReference', 'Encounter', 'EncounterHistory', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceReport', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'FormularyItem', 'GenomicStudy', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingSelection', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'Ingredient', 'InsurancePlan', 'InsuranceProduct', 'InventoryItem', 'InventoryReport', 'Invoice', 'Library', 'Linkage', 'List', 'Location', 'ManufacturedItemDefinition', 'Measure', 'MeasureReport', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProductDefinition', 'MessageDefinition', 'MessageHeader', 'MetadataResource', 'MolecularDefinition', 'MolecularSequence', 'NamingSystem', 'NutritionIntake', 'NutritionOrder', 'NutritionProduct', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'Organization', 'OrganizationAffiliation', 'PackagedProductDefinition', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Permission', 'Person', 'PersonalRelationship', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RegulatedAuthorization', 'RelatedPerson', 'RequestOrchestration', 'Requirements', 'ResearchStudy', 'ResearchSubject', 'RiskAssessment', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'SubscriptionStatus', 'SubscriptionTopic', 'Substance', 'SubstanceDefinition', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestPlan', 'TestReport', 'TestScript', 'Transport', 'ValueSet', 'VerificationResult', 'VisionPrescription', 'Parameters']}, 'type'=>'code', 'path'=>'Measure.basis', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fhir-types'}},
        'date' => {'type'=>'dateTime', 'path'=>'Measure.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'Measure.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'Measure.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'Measure.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'Measure.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'Measure.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'purpose' => {'type'=>'markdown', 'path'=>'Measure.purpose', 'min'=>0, 'max'=>1},
        'usage' => {'type'=>'markdown', 'path'=>'Measure.usage', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'Measure.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'Measure.copyrightLabel', 'min'=>0, 'max'=>1},
        'approvalDate' => {'type'=>'date', 'path'=>'Measure.approvalDate', 'min'=>0, 'max'=>1},
        'lastReviewDate' => {'type'=>'date', 'path'=>'Measure.lastReviewDate', 'min'=>0, 'max'=>1},
        'effectivePeriod' => {'type'=>'Period', 'path'=>'Measure.effectivePeriod', 'min'=>0, 'max'=>1},
        'topic' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/definition-use'=>['fhir-structure', 'custom-resource', 'dam', 'wire-format', 'archetype', 'template'], 'http://terminology.hl7.org/CodeSystem/definition-topic'=>['treatment', 'education', 'assessment']}, 'type'=>'CodeableConcept', 'path'=>'Measure.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/definition-topic'}},
        'author' => {'type'=>'ContactDetail', 'path'=>'Measure.author', 'min'=>0, 'max'=>Float::INFINITY},
        'editor' => {'type'=>'ContactDetail', 'path'=>'Measure.editor', 'min'=>0, 'max'=>Float::INFINITY},
        'reviewer' => {'type'=>'ContactDetail', 'path'=>'Measure.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
        'endorser' => {'type'=>'ContactDetail', 'path'=>'Measure.endorser', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'Measure.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
        'library' => {'type'=>'canonical', 'path'=>'Measure.library', 'min'=>0, 'max'=>Float::INFINITY},
        'disclaimer' => {'type'=>'markdown', 'path'=>'Measure.disclaimer', 'min'=>0, 'max'=>1},
        'scoring' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-scoring'=>['attestation', 'proportion', 'ratio', 'continuous-variable', 'cohort', 'composite']}, 'type'=>'CodeableConcept', 'path'=>'Measure.scoring', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/measure-scoring'}},
        'scoringUnit' => {'valid_codes'=>{'http://unitsofmeasure.org'=>['1', '/1000.d']}, 'type'=>'CodeableConcept', 'path'=>'Measure.scoringUnit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-scoring-unit'}},
        'compositeScoring' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/composite-measure-scoring'=>['opportunity', 'all-or-nothing', 'linear', 'weighted']}, 'type'=>'CodeableConcept', 'path'=>'Measure.compositeScoring', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/composite-measure-scoring'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-type'=>['process', 'outcome', 'structure', 'patient-reported-outcome', 'composite']}, 'type'=>'CodeableConcept', 'path'=>'Measure.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-type'}},
        'riskAdjustment' => {'type'=>'markdown', 'path'=>'Measure.riskAdjustment', 'min'=>0, 'max'=>1},
        'rateAggregation' => {'type'=>'markdown', 'path'=>'Measure.rateAggregation', 'min'=>0, 'max'=>1},
        'rationale' => {'type'=>'markdown', 'path'=>'Measure.rationale', 'min'=>0, 'max'=>1},
        'clinicalRecommendationStatement' => {'type'=>'markdown', 'path'=>'Measure.clinicalRecommendationStatement', 'min'=>0, 'max'=>1},
        'improvementNotation' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-improvement-notation'=>['increase', 'decrease']}, 'type'=>'CodeableConcept', 'path'=>'Measure.improvementNotation', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-improvement-notation'}},
        'term' => {'type'=>'Measure::Term', 'path'=>'Measure.term', 'min'=>0, 'max'=>Float::INFINITY},
        'guidance' => {'type'=>'markdown', 'path'=>'Measure.guidance', 'min'=>0, 'max'=>1},
        'group' => {'type'=>'Measure::Group', 'path'=>'Measure.group', 'min'=>0, 'max'=>Float::INFINITY},
        'supplementalData' => {'type'=>'Measure::SupplementalData', 'path'=>'Measure.supplementalData', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Term < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Term.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Term.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Term.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-definition-example'=>['screening', 'standardized-depression-screening-tool']}, 'type'=>'CodeableConcept', 'path'=>'Term.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-definition-example'}},
          'definition' => {'type'=>'markdown', 'path'=>'Term.definition', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 0-1 CodeableConcept
        attr_accessor :definition        # 0-1 markdown
      end

      class Group < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'subject' => ['CodeableConcept', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'linkId' => {'type'=>'string', 'path'=>'Group.linkId', 'min'=>0, 'max'=>1},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-group-example'=>['primary-rate', 'secondary-rate']}, 'type'=>'CodeableConcept', 'path'=>'Group.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-group-example'}},
          'description' => {'type'=>'markdown', 'path'=>'Group.description', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-type'=>['process', 'outcome', 'structure', 'patient-reported-outcome', 'composite']}, 'type'=>'CodeableConcept', 'path'=>'Group.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-type'}},
          'subjectCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['CareTeam', 'Device', 'Group', 'HealthcareService', 'Location', 'Organization', 'Patient', 'Practitioner', 'PractitionerRole', 'RelatedPerson']}, 'type'=>'CodeableConcept', 'path'=>'Group.subject[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/participant-resource-types'}},
          'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Group.subject[x]', 'min'=>0, 'max'=>1},
          'basis' => {'valid_codes'=>{'http://hl7.org/fhir/fhir-types'=>['Base', 'Element', 'BackboneElement', 'DataType', 'Address', 'Annotation', 'Attachment', 'Availability', 'BackboneType', 'Dosage', 'ElementDefinition', 'MarketingStatus', 'ProductShelfLife', 'RelativeTime', 'Timing', 'CodeableConcept', 'CodeableReference', 'Coding', 'ContactDetail', 'ContactPoint', 'Contributor', 'DataRequirement', 'Expression', 'ExtendedContactDetail', 'Extension', 'HumanName', 'Identifier', 'Meta', 'MonetaryComponent', 'Money', 'Narrative', 'ParameterDefinition', 'Period', 'PrimitiveType', 'base64Binary', 'boolean', 'date', 'dateTime', 'decimal', 'instant', 'integer', 'positiveInt', 'unsignedInt', 'integer64', 'string', 'code', 'id', 'markdown', 'time', 'uri', 'canonical', 'oid', 'url', 'uuid', 'Quantity', 'Age', 'Count', 'Distance', 'Duration', 'Range', 'Ratio', 'RatioRange', 'Reference', 'RelatedArtifact', 'SampledData', 'Signature', 'TriggerDefinition', 'UsageContext', 'VirtualServiceDetail', 'xhtml', 'Resource', 'Binary', 'Bundle', 'DomainResource', 'Account', 'ActivityDefinition', 'ActorDefinition', 'AdministrableProductDefinition', 'AdverseEvent', 'AllergyIntolerance', 'Appointment', 'AppointmentResponse', 'ArtifactAssessment', 'AuditEvent', 'Basic', 'BiologicallyDerivedProduct', 'BiologicallyDerivedProductDispense', 'BodyStructure', 'CanonicalResource', 'CapabilityStatement', 'CarePlan', 'CareTeam', 'ChargeItem', 'ChargeItemDefinition', 'Citation', 'Claim', 'ClaimResponse', 'ClinicalImpression', 'ClinicalUseDefinition', 'CodeSystem', 'Communication', 'CommunicationRequest', 'CompartmentDefinition', 'Composition', 'ConceptMap', 'Condition', 'ConditionDefinition', 'Consent', 'Contract', 'Coverage', 'CoverageEligibilityRequest', 'CoverageEligibilityResponse', 'DetectedIssue', 'Device', 'DeviceAlert', 'DeviceAssociation', 'DeviceDefinition', 'DeviceDispense', 'DeviceMetric', 'DeviceRequest', 'DeviceUsage', 'DiagnosticReport', 'DocumentReference', 'Encounter', 'EncounterHistory', 'Endpoint', 'EnrollmentRequest', 'EnrollmentResponse', 'EpisodeOfCare', 'EventDefinition', 'Evidence', 'EvidenceReport', 'EvidenceVariable', 'ExampleScenario', 'ExplanationOfBenefit', 'FamilyMemberHistory', 'Flag', 'FormularyItem', 'GenomicStudy', 'Goal', 'GraphDefinition', 'Group', 'GuidanceResponse', 'HealthcareService', 'ImagingSelection', 'ImagingStudy', 'Immunization', 'ImmunizationEvaluation', 'ImmunizationRecommendation', 'ImplementationGuide', 'Ingredient', 'InsurancePlan', 'InsuranceProduct', 'InventoryItem', 'InventoryReport', 'Invoice', 'Library', 'Linkage', 'List', 'Location', 'ManufacturedItemDefinition', 'Measure', 'MeasureReport', 'Medication', 'MedicationAdministration', 'MedicationDispense', 'MedicationKnowledge', 'MedicationRequest', 'MedicationStatement', 'MedicinalProductDefinition', 'MessageDefinition', 'MessageHeader', 'MetadataResource', 'MolecularDefinition', 'MolecularSequence', 'NamingSystem', 'NutritionIntake', 'NutritionOrder', 'NutritionProduct', 'Observation', 'ObservationDefinition', 'OperationDefinition', 'OperationOutcome', 'Organization', 'OrganizationAffiliation', 'PackagedProductDefinition', 'Patient', 'PaymentNotice', 'PaymentReconciliation', 'Permission', 'Person', 'PersonalRelationship', 'PlanDefinition', 'Practitioner', 'PractitionerRole', 'Procedure', 'Provenance', 'Questionnaire', 'QuestionnaireResponse', 'RegulatedAuthorization', 'RelatedPerson', 'RequestOrchestration', 'Requirements', 'ResearchStudy', 'ResearchSubject', 'RiskAssessment', 'Schedule', 'SearchParameter', 'ServiceRequest', 'Slot', 'Specimen', 'SpecimenDefinition', 'StructureDefinition', 'StructureMap', 'Subscription', 'SubscriptionStatus', 'SubscriptionTopic', 'Substance', 'SubstanceDefinition', 'SubstanceNucleicAcid', 'SubstancePolymer', 'SubstanceProtein', 'SubstanceReferenceInformation', 'SubstanceSourceMaterial', 'SupplyDelivery', 'SupplyRequest', 'Task', 'TerminologyCapabilities', 'TestPlan', 'TestReport', 'TestScript', 'Transport', 'ValueSet', 'VerificationResult', 'VisionPrescription', 'Parameters']}, 'type'=>'code', 'path'=>'Group.basis', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fhir-types'}},
          'scoring' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-scoring'=>['attestation', 'proportion', 'ratio', 'continuous-variable', 'cohort', 'composite']}, 'type'=>'CodeableConcept', 'path'=>'Group.scoring', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/measure-scoring'}},
          'scoringUnit' => {'valid_codes'=>{'http://unitsofmeasure.org'=>['1', '/1000.d']}, 'type'=>'CodeableConcept', 'path'=>'Group.scoringUnit', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-scoring-unit'}},
          'rateAggregation' => {'type'=>'markdown', 'path'=>'Group.rateAggregation', 'min'=>0, 'max'=>1},
          'improvementNotation' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-improvement-notation'=>['increase', 'decrease']}, 'type'=>'CodeableConcept', 'path'=>'Group.improvementNotation', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-improvement-notation'}},
          'library' => {'type'=>'canonical', 'path'=>'Group.library', 'min'=>0, 'max'=>Float::INFINITY},
          'population' => {'type'=>'Measure::Group::Population', 'path'=>'Group.population', 'min'=>0, 'max'=>Float::INFINITY},
          'stratifier' => {'type'=>'Measure::Group::Stratifier', 'path'=>'Group.stratifier', 'min'=>0, 'max'=>Float::INFINITY}
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
            'description' => {'type'=>'markdown', 'path'=>'Population.description', 'min'=>0, 'max'=>1},
            'criteria' => {'type'=>'Expression', 'path'=>'Population.criteria', 'min'=>0, 'max'=>1},
            'groupDefinition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Population.groupDefinition', 'min'=>0, 'max'=>1},
            'inputPopulationId' => {'type'=>'string', 'path'=>'Population.inputPopulationId', 'min'=>0, 'max'=>1},
            'aggregateMethod' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/measure-aggregate-method'=>['sum', 'average', 'median', 'minimum', 'maximum', 'count']}, 'type'=>'CodeableConcept', 'path'=>'Population.aggregateMethod', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-aggregate-method'}}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :linkId            # 0-1 string
          attr_accessor :code              # 0-1 CodeableConcept
          attr_accessor :description       # 0-1 markdown
          attr_accessor :criteria          # 0-1 Expression
          attr_accessor :groupDefinition   # 0-1 Reference(Group)
          attr_accessor :inputPopulationId # 0-1 string
          attr_accessor :aggregateMethod   # 0-1 CodeableConcept
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
            'description' => {'type'=>'markdown', 'path'=>'Stratifier.description', 'min'=>0, 'max'=>1},
            'criteria' => {'type'=>'Expression', 'path'=>'Stratifier.criteria', 'min'=>0, 'max'=>1},
            'groupDefinition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Stratifier.groupDefinition', 'min'=>0, 'max'=>1},
            'component' => {'type'=>'Measure::Group::Stratifier::Component', 'path'=>'Stratifier.component', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Component < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Component.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Component.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Component.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'linkId' => {'type'=>'string', 'path'=>'Component.linkId', 'min'=>0, 'max'=>1},
              'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-stratifier-example'=>['age', 'gender', 'region']}, 'type'=>'CodeableConcept', 'path'=>'Component.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-stratifier-example'}},
              'description' => {'type'=>'markdown', 'path'=>'Component.description', 'min'=>0, 'max'=>1},
              'criteria' => {'type'=>'Expression', 'path'=>'Component.criteria', 'min'=>0, 'max'=>1},
              'groupDefinition' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Component.groupDefinition', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :linkId            # 0-1 string
            attr_accessor :code              # 0-1 CodeableConcept
            attr_accessor :description       # 0-1 markdown
            attr_accessor :criteria          # 0-1 Expression
            attr_accessor :groupDefinition   # 0-1 Reference(Group)
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :linkId            # 0-1 string
          attr_accessor :code              # 0-1 CodeableConcept
          attr_accessor :description       # 0-1 markdown
          attr_accessor :criteria          # 0-1 Expression
          attr_accessor :groupDefinition   # 0-1 Reference(Group)
          attr_accessor :component         # 0-* [ Measure::Group::Stratifier::Component ]
        end

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :linkId                 # 0-1 string
        attr_accessor :code                   # 0-1 CodeableConcept
        attr_accessor :description            # 0-1 markdown
        attr_accessor :type                   # 0-* [ CodeableConcept ]
        attr_accessor :subjectCodeableConcept # 0-1 CodeableConcept
        attr_accessor :subjectReference       # 0-1 Reference(Group)
        attr_accessor :basis                  # 0-1 code
        attr_accessor :scoring                # 0-1 CodeableConcept
        attr_accessor :scoringUnit            # 0-1 CodeableConcept
        attr_accessor :rateAggregation        # 0-1 markdown
        attr_accessor :improvementNotation    # 0-1 CodeableConcept
        attr_accessor :library                # 0-* [ canonical ]
        attr_accessor :population             # 0-* [ Measure::Group::Population ]
        attr_accessor :stratifier             # 0-* [ Measure::Group::Stratifier ]
      end

      class SupplementalData < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'SupplementalData.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'SupplementalData.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'SupplementalData.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'linkId' => {'type'=>'string', 'path'=>'SupplementalData.linkId', 'min'=>0, 'max'=>1},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/measure-supplemental-data-example'=>['age', 'gender', 'ethnicity', 'payer']}, 'type'=>'CodeableConcept', 'path'=>'SupplementalData.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-supplemental-data-example'}},
          'usage' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/measure-data-usage'=>['supplemental-data', 'risk-adjustment-factor']}, 'type'=>'CodeableConcept', 'path'=>'SupplementalData.usage', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/measure-data-usage'}},
          'description' => {'type'=>'markdown', 'path'=>'SupplementalData.description', 'min'=>0, 'max'=>1},
          'criteria' => {'type'=>'Expression', 'path'=>'SupplementalData.criteria', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :linkId            # 0-1 string
        attr_accessor :code              # 0-1 CodeableConcept
        attr_accessor :usage             # 0-* [ CodeableConcept ]
        attr_accessor :description       # 0-1 markdown
        attr_accessor :criteria          # 1-1 Expression
      end

      attr_accessor :id                              # 0-1 id
      attr_accessor :meta                            # 0-1 Meta
      attr_accessor :implicitRules                   # 0-1 uri
      attr_accessor :language                        # 0-1 code
      attr_accessor :text                            # 0-1 Narrative
      attr_accessor :contained                       # 0-* [ Resource ]
      attr_accessor :extension                       # 0-* [ Extension ]
      attr_accessor :modifierExtension               # 0-* [ Extension ]
      attr_accessor :url                             # 0-1 uri
      attr_accessor :identifier                      # 0-* [ Identifier ]
      attr_accessor :version                         # 0-1 string
      attr_accessor :versionAlgorithmString          # 0-1 string
      attr_accessor :versionAlgorithmCoding          # 0-1 Coding
      attr_accessor :name                            # 0-1 string
      attr_accessor :title                           # 0-1 string
      attr_accessor :subtitle                        # 0-1 string
      attr_accessor :status                          # 1-1 code
      attr_accessor :experimental                    # 0-1 boolean
      attr_accessor :subjectCodeableConcept          # 0-1 CodeableConcept
      attr_accessor :subjectReference                # 0-1 Reference(Group)
      attr_accessor :basis                           # 0-1 code
      attr_accessor :date                            # 0-1 dateTime
      attr_accessor :publisher                       # 0-1 string
      attr_accessor :contact                         # 0-* [ ContactDetail ]
      attr_accessor :description                     # 0-1 markdown
      attr_accessor :useContext                      # 0-* [ UsageContext ]
      attr_accessor :jurisdiction                    # 0-* [ CodeableConcept ]
      attr_accessor :purpose                         # 0-1 markdown
      attr_accessor :usage                           # 0-1 markdown
      attr_accessor :copyright                       # 0-1 markdown
      attr_accessor :copyrightLabel                  # 0-1 string
      attr_accessor :approvalDate                    # 0-1 date
      attr_accessor :lastReviewDate                  # 0-1 date
      attr_accessor :effectivePeriod                 # 0-1 Period
      attr_accessor :topic                           # 0-* [ CodeableConcept ]
      attr_accessor :author                          # 0-* [ ContactDetail ]
      attr_accessor :editor                          # 0-* [ ContactDetail ]
      attr_accessor :reviewer                        # 0-* [ ContactDetail ]
      attr_accessor :endorser                        # 0-* [ ContactDetail ]
      attr_accessor :relatedArtifact                 # 0-* [ RelatedArtifact ]
      attr_accessor :library                         # 0-* [ canonical ]
      attr_accessor :disclaimer                      # 0-1 markdown
      attr_accessor :scoring                         # 0-1 CodeableConcept
      attr_accessor :scoringUnit                     # 0-1 CodeableConcept
      attr_accessor :compositeScoring                # 0-1 CodeableConcept
      attr_accessor :type                            # 0-* [ CodeableConcept ]
      attr_accessor :riskAdjustment                  # 0-1 markdown
      attr_accessor :rateAggregation                 # 0-1 markdown
      attr_accessor :rationale                       # 0-1 markdown
      attr_accessor :clinicalRecommendationStatement # 0-1 markdown
      attr_accessor :improvementNotation             # 0-1 CodeableConcept
      attr_accessor :term                            # 0-* [ Measure::Term ]
      attr_accessor :guidance                        # 0-1 markdown
      attr_accessor :group                           # 0-* [ Measure::Group ]
      attr_accessor :supplementalData                # 0-* [ Measure::SupplementalData ]

      def resourceType
        'Measure'
      end
    end
  end
end