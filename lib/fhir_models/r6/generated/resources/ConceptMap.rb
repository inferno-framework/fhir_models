module FHIR
  module R6
    class ConceptMap < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding'],
        'sourceScope' => ['uri', 'canonical'],
        'targetScope' => ['uri', 'canonical']
      }
      SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'derived-from', 'description', 'effective', 'identifier', 'jurisdiction', 'mapping-property', 'name', 'other-map', 'predecessor', 'publisher', 'source-code', 'source-group-system', 'source-scope', 'source-scope-uri', 'status', 'target-code', 'target-group-system', 'target-scope', 'target-scope-uri', 'title', 'topic', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ConceptMap.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ConceptMap.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ConceptMap.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ConceptMap.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ConceptMap.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ConceptMap.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ConceptMap.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ConceptMap.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'ConceptMap.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'ConceptMap.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'ConceptMap.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'ConceptMap.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'ConceptMap.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'ConceptMap.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'ConceptMap.title', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'ConceptMap.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'ConceptMap.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'ConceptMap.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'ConceptMap.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'ConceptMap.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'ConceptMap.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'ConceptMap.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'ConceptMap.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'purpose' => {'type'=>'markdown', 'path'=>'ConceptMap.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'ConceptMap.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'ConceptMap.copyrightLabel', 'min'=>0, 'max'=>1},
        'approvalDate' => {'type'=>'date', 'path'=>'ConceptMap.approvalDate', 'min'=>0, 'max'=>1},
        'lastReviewDate' => {'type'=>'date', 'path'=>'ConceptMap.lastReviewDate', 'min'=>0, 'max'=>1},
        'effectivePeriod' => {'type'=>'Period', 'path'=>'ConceptMap.effectivePeriod', 'min'=>0, 'max'=>1},
        'topic' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/definition-use'=>['fhir-structure', 'custom-resource', 'dam', 'wire-format', 'archetype', 'template'], 'http://terminology.hl7.org/CodeSystem/definition-topic'=>['treatment', 'education', 'assessment']}, 'type'=>'CodeableConcept', 'path'=>'ConceptMap.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/definition-topic'}},
        'author' => {'type'=>'ContactDetail', 'path'=>'ConceptMap.author', 'min'=>0, 'max'=>Float::INFINITY},
        'editor' => {'type'=>'ContactDetail', 'path'=>'ConceptMap.editor', 'min'=>0, 'max'=>Float::INFINITY},
        'reviewer' => {'type'=>'ContactDetail', 'path'=>'ConceptMap.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
        'endorser' => {'type'=>'ContactDetail', 'path'=>'ConceptMap.endorser', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'ConceptMap.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
        'property' => {'type'=>'ConceptMap::Property', 'path'=>'ConceptMap.property', 'min'=>0, 'max'=>Float::INFINITY},
        'additionalAttribute' => {'type'=>'ConceptMap::AdditionalAttribute', 'path'=>'ConceptMap.additionalAttribute', 'min'=>0, 'max'=>Float::INFINITY},
        'sourceScopeUri' => {'type'=>'uri', 'path'=>'ConceptMap.sourceScope[x]', 'min'=>0, 'max'=>1},
        'sourceScopeCanonical' => {'type'=>'canonical', 'path'=>'ConceptMap.sourceScope[x]', 'min'=>0, 'max'=>1},
        'targetScopeUri' => {'type'=>'uri', 'path'=>'ConceptMap.targetScope[x]', 'min'=>0, 'max'=>1},
        'targetScopeCanonical' => {'type'=>'canonical', 'path'=>'ConceptMap.targetScope[x]', 'min'=>0, 'max'=>1},
        'group' => {'type'=>'ConceptMap::Group', 'path'=>'ConceptMap.group', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Property < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'code', 'path'=>'Property.code', 'min'=>1, 'max'=>1},
          'uri' => {'type'=>'uri', 'path'=>'Property.uri', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Property.description', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/conceptmap-property-type'=>['Coding', 'string', 'integer', 'boolean', 'dateTime', 'decimal', 'code']}, 'type'=>'code', 'path'=>'Property.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conceptmap-property-type'}},
          'system' => {'type'=>'canonical', 'path'=>'Property.system', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 code
        attr_accessor :uri               # 0-1 uri
        attr_accessor :description       # 0-1 string
        attr_accessor :type              # 1-1 code
        attr_accessor :system            # 0-1 canonical
      end

      class AdditionalAttribute < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'AdditionalAttribute.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'AdditionalAttribute.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'AdditionalAttribute.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'code', 'path'=>'AdditionalAttribute.code', 'min'=>1, 'max'=>1},
          'uri' => {'type'=>'uri', 'path'=>'AdditionalAttribute.uri', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'AdditionalAttribute.description', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/conceptmap-attribute-type'=>['code', 'Coding', 'string', 'boolean', 'Quantity']}, 'type'=>'code', 'path'=>'AdditionalAttribute.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conceptmap-attribute-type'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 code
        attr_accessor :uri               # 0-1 uri
        attr_accessor :description       # 0-1 string
        attr_accessor :type              # 1-1 code
      end

      class Group < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'source' => {'type'=>'canonical', 'path'=>'Group.source', 'min'=>0, 'max'=>1},
          'target' => {'type'=>'canonical', 'path'=>'Group.target', 'min'=>0, 'max'=>1},
          'element' => {'type'=>'ConceptMap::Group::Element', 'path'=>'Group.element', 'min'=>1, 'max'=>Float::INFINITY},
          'unmapped' => {'type'=>'ConceptMap::Group::Unmapped', 'path'=>'Group.unmapped', 'min'=>0, 'max'=>1}
        }

        class Element < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Element.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Element.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Element.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'type'=>'code', 'path'=>'Element.code', 'min'=>0, 'max'=>1},
            'display' => {'type'=>'string', 'path'=>'Element.display', 'min'=>0, 'max'=>1},
            'valueSet' => {'type'=>'canonical', 'path'=>'Element.valueSet', 'min'=>0, 'max'=>1},
            'noMap' => {'type'=>'boolean', 'path'=>'Element.noMap', 'min'=>0, 'max'=>1},
            'target' => {'type'=>'ConceptMap::Group::Element::Target', 'path'=>'Element.target', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Target < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'code' => {'type'=>'code', 'path'=>'Target.code', 'min'=>0, 'max'=>1},
              'display' => {'type'=>'string', 'path'=>'Target.display', 'min'=>0, 'max'=>1},
              'valueSet' => {'type'=>'canonical', 'path'=>'Target.valueSet', 'min'=>0, 'max'=>1},
              'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/concept-map-relationship'=>['related-to', 'equivalent', 'source-is-narrower-than-target', 'source-is-broader-than-target', 'not-related-to']}, 'type'=>'code', 'path'=>'Target.relationship', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/concept-map-relationship'}},
              'comment' => {'type'=>'string', 'path'=>'Target.comment', 'min'=>0, 'max'=>1},
              'property' => {'type'=>'ConceptMap::Group::Element::Target::Property', 'path'=>'Target.property', 'min'=>0, 'max'=>Float::INFINITY},
              'dependsOn' => {'type'=>'ConceptMap::Group::Element::Target::DependsOn', 'path'=>'Target.dependsOn', 'min'=>0, 'max'=>Float::INFINITY},
              'product' => {'type'=>'ConceptMap::Group::Element::Target::DependsOn', 'path'=>'Target.product', 'min'=>0, 'max'=>Float::INFINITY}
            }

            class Property < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              MULTIPLE_TYPES = {
                'value' => ['Coding', 'string', 'integer', 'boolean', 'dateTime', 'decimal', 'code']
              }
              METADATA = {
                'id' => {'type'=>'string', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'code' => {'type'=>'code', 'path'=>'Property.code', 'min'=>1, 'max'=>1},
                'valueCoding' => {'type'=>'Coding', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
                'valueString' => {'type'=>'string', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
                'valueInteger' => {'type'=>'integer', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
                'valueBoolean' => {'type'=>'boolean', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
                'valueDateTime' => {'type'=>'dateTime', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
                'valueDecimal' => {'type'=>'decimal', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
                'valueCode' => {'type'=>'code', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :code              # 1-1 code
              attr_accessor :valueCoding       # 1-1 Coding
              attr_accessor :valueString       # 1-1 string
              attr_accessor :valueInteger      # 1-1 integer
              attr_accessor :valueBoolean      # 1-1 boolean
              attr_accessor :valueDateTime     # 1-1 dateTime
              attr_accessor :valueDecimal      # 1-1 decimal
              attr_accessor :valueCode         # 1-1 code
            end

            class DependsOn < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              MULTIPLE_TYPES = {
                'value' => ['code', 'Coding', 'string', 'boolean', 'Quantity']
              }
              METADATA = {
                'id' => {'type'=>'string', 'path'=>'DependsOn.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'DependsOn.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'DependsOn.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'attribute' => {'type'=>'code', 'path'=>'DependsOn.attribute', 'min'=>1, 'max'=>1},
                'valueCode' => {'type'=>'code', 'path'=>'DependsOn.value[x]', 'min'=>0, 'max'=>1},
                'valueCoding' => {'type'=>'Coding', 'path'=>'DependsOn.value[x]', 'min'=>0, 'max'=>1},
                'valueString' => {'type'=>'string', 'path'=>'DependsOn.value[x]', 'min'=>0, 'max'=>1},
                'valueBoolean' => {'type'=>'boolean', 'path'=>'DependsOn.value[x]', 'min'=>0, 'max'=>1},
                'valueQuantity' => {'type'=>'Quantity', 'path'=>'DependsOn.value[x]', 'min'=>0, 'max'=>1},
                'valueSet' => {'type'=>'canonical', 'path'=>'DependsOn.valueSet', 'min'=>0, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :attribute         # 1-1 code
              attr_accessor :valueCode         # 0-1 code
              attr_accessor :valueCoding       # 0-1 Coding
              attr_accessor :valueString       # 0-1 string
              attr_accessor :valueBoolean      # 0-1 boolean
              attr_accessor :valueQuantity     # 0-1 Quantity
              attr_accessor :valueSet          # 0-1 canonical
            end

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :code              # 0-1 code
            attr_accessor :display           # 0-1 string
            attr_accessor :valueSet          # 0-1 canonical
            attr_accessor :relationship      # 1-1 code
            attr_accessor :comment           # 0-1 string
            attr_accessor :property          # 0-* [ ConceptMap::Group::Element::Target::Property ]
            attr_accessor :dependsOn         # 0-* [ ConceptMap::Group::Element::Target::DependsOn ]
            attr_accessor :product           # 0-* [ ConceptMap::Group::Element::Target::DependsOn ]
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :code              # 0-1 code
          attr_accessor :display           # 0-1 string
          attr_accessor :valueSet          # 0-1 canonical
          attr_accessor :noMap             # 0-1 boolean
          attr_accessor :target            # 0-* [ ConceptMap::Group::Element::Target ]
        end

        class Unmapped < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Unmapped.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Unmapped.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Unmapped.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'mode' => {'valid_codes'=>{'http://hl7.org/fhir/conceptmap-unmapped-mode'=>['use-source-code', 'fixed', 'other-map']}, 'type'=>'code', 'path'=>'Unmapped.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/conceptmap-unmapped-mode'}},
            'code' => {'type'=>'code', 'path'=>'Unmapped.code', 'min'=>0, 'max'=>1},
            'display' => {'type'=>'string', 'path'=>'Unmapped.display', 'min'=>0, 'max'=>1},
            'valueSet' => {'type'=>'canonical', 'path'=>'Unmapped.valueSet', 'min'=>0, 'max'=>1},
            'relationship' => {'valid_codes'=>{'http://hl7.org/fhir/concept-map-relationship'=>['related-to', 'equivalent', 'source-is-narrower-than-target', 'source-is-broader-than-target', 'not-related-to']}, 'type'=>'code', 'path'=>'Unmapped.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/concept-map-relationship'}},
            'otherMap' => {'type'=>'canonical', 'path'=>'Unmapped.otherMap', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :mode              # 1-1 code
          attr_accessor :code              # 0-1 code
          attr_accessor :display           # 0-1 string
          attr_accessor :valueSet          # 0-1 canonical
          attr_accessor :relationship      # 0-1 code
          attr_accessor :otherMap          # 0-1 canonical
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :source            # 0-1 canonical
        attr_accessor :target            # 0-1 canonical
        attr_accessor :element           # 1-* [ ConceptMap::Group::Element ]
        attr_accessor :unmapped          # 0-1 ConceptMap::Group::Unmapped
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
      attr_accessor :status                 # 1-1 code
      attr_accessor :experimental           # 0-1 boolean
      attr_accessor :date                   # 0-1 dateTime
      attr_accessor :publisher              # 0-1 string
      attr_accessor :contact                # 0-* [ ContactDetail ]
      attr_accessor :description            # 0-1 markdown
      attr_accessor :useContext             # 0-* [ UsageContext ]
      attr_accessor :jurisdiction           # 0-* [ CodeableConcept ]
      attr_accessor :purpose                # 0-1 markdown
      attr_accessor :copyright              # 0-1 markdown
      attr_accessor :copyrightLabel         # 0-1 string
      attr_accessor :approvalDate           # 0-1 date
      attr_accessor :lastReviewDate         # 0-1 date
      attr_accessor :effectivePeriod        # 0-1 Period
      attr_accessor :topic                  # 0-* [ CodeableConcept ]
      attr_accessor :author                 # 0-* [ ContactDetail ]
      attr_accessor :editor                 # 0-* [ ContactDetail ]
      attr_accessor :reviewer               # 0-* [ ContactDetail ]
      attr_accessor :endorser               # 0-* [ ContactDetail ]
      attr_accessor :relatedArtifact        # 0-* [ RelatedArtifact ]
      attr_accessor :property               # 0-* [ ConceptMap::Property ]
      attr_accessor :additionalAttribute    # 0-* [ ConceptMap::AdditionalAttribute ]
      attr_accessor :sourceScopeUri         # 0-1 uri
      attr_accessor :sourceScopeCanonical   # 0-1 canonical
      attr_accessor :targetScopeUri         # 0-1 uri
      attr_accessor :targetScopeCanonical   # 0-1 canonical
      attr_accessor :group                  # 0-* [ ConceptMap::Group ]

      def resourceType
        'ConceptMap'
      end
    end
  end
end