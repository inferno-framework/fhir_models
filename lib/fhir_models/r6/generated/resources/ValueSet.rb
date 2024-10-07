module FHIR
  module R6
    class ValueSet < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding']
      }
      SEARCH_PARAMS = ['code', 'context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'derived-from', 'description', 'effective', 'expansion', 'identifier', 'jurisdiction', 'name', 'predecessor', 'publisher', 'reference', 'status', 'title', 'topic', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ValueSet.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ValueSet.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ValueSet.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ValueSet.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ValueSet.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ValueSet.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ValueSet.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ValueSet.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'ValueSet.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'ValueSet.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'ValueSet.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'ValueSet.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'ValueSet.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'ValueSet.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'ValueSet.title', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'ValueSet.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'ValueSet.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'ValueSet.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'ValueSet.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'ValueSet.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'ValueSet.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'ValueSet.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'ValueSet.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'immutable' => {'type'=>'boolean', 'path'=>'ValueSet.immutable', 'min'=>0, 'max'=>1},
        'purpose' => {'type'=>'markdown', 'path'=>'ValueSet.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'ValueSet.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'ValueSet.copyrightLabel', 'min'=>0, 'max'=>1},
        'approvalDate' => {'type'=>'date', 'path'=>'ValueSet.approvalDate', 'min'=>0, 'max'=>1},
        'lastReviewDate' => {'type'=>'date', 'path'=>'ValueSet.lastReviewDate', 'min'=>0, 'max'=>1},
        'effectivePeriod' => {'type'=>'Period', 'path'=>'ValueSet.effectivePeriod', 'min'=>0, 'max'=>1},
        'topic' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/definition-use'=>['fhir-structure', 'custom-resource', 'dam', 'wire-format', 'archetype', 'template'], 'http://terminology.hl7.org/CodeSystem/definition-topic'=>['treatment', 'education', 'assessment']}, 'type'=>'CodeableConcept', 'path'=>'ValueSet.topic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/definition-topic'}},
        'author' => {'type'=>'ContactDetail', 'path'=>'ValueSet.author', 'min'=>0, 'max'=>Float::INFINITY},
        'editor' => {'type'=>'ContactDetail', 'path'=>'ValueSet.editor', 'min'=>0, 'max'=>Float::INFINITY},
        'reviewer' => {'type'=>'ContactDetail', 'path'=>'ValueSet.reviewer', 'min'=>0, 'max'=>Float::INFINITY},
        'endorser' => {'type'=>'ContactDetail', 'path'=>'ValueSet.endorser', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'ValueSet.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
        'compose' => {'type'=>'ValueSet::Compose', 'path'=>'ValueSet.compose', 'min'=>0, 'max'=>1},
        'expansion' => {'type'=>'ValueSet::Expansion', 'path'=>'ValueSet.expansion', 'min'=>0, 'max'=>1},
        'scope' => {'type'=>'ValueSet::Scope', 'path'=>'ValueSet.scope', 'min'=>0, 'max'=>1}
      }

      class Compose < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Compose.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Compose.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Compose.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'lockedDate' => {'type'=>'date', 'path'=>'Compose.lockedDate', 'min'=>0, 'max'=>1},
          'inactive' => {'type'=>'boolean', 'path'=>'Compose.inactive', 'min'=>0, 'max'=>1},
          'include' => {'type'=>'ValueSet::Compose::Include', 'path'=>'Compose.include', 'min'=>1, 'max'=>Float::INFINITY},
          'exclude' => {'type'=>'ValueSet::Compose::Include', 'path'=>'Compose.exclude', 'min'=>0, 'max'=>Float::INFINITY},
          'property' => {'type'=>'string', 'path'=>'Compose.property', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Include < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Include.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Include.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Include.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'system' => {'type'=>'uri', 'path'=>'Include.system', 'min'=>0, 'max'=>1},
            'version' => {'type'=>'string', 'path'=>'Include.version', 'min'=>0, 'max'=>1},
            'concept' => {'type'=>'ValueSet::Compose::Include::Concept', 'path'=>'Include.concept', 'min'=>0, 'max'=>Float::INFINITY},
            'filter' => {'type'=>'ValueSet::Compose::Include::Filter', 'path'=>'Include.filter', 'min'=>0, 'max'=>Float::INFINITY},
            'valueSet' => {'type'=>'canonical', 'path'=>'Include.valueSet', 'min'=>0, 'max'=>Float::INFINITY},
            'copyright' => {'type'=>'markdown', 'path'=>'Include.copyright', 'min'=>0, 'max'=>1}
          }

          class Concept < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Concept.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Concept.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Concept.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'code' => {'type'=>'code', 'path'=>'Concept.code', 'min'=>1, 'max'=>1},
              'display' => {'type'=>'string', 'path'=>'Concept.display', 'min'=>0, 'max'=>1},
              'designation' => {'type'=>'ValueSet::Compose::Include::Concept::Designation', 'path'=>'Concept.designation', 'min'=>0, 'max'=>Float::INFINITY}
            }

            class Designation < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              METADATA = {
                'id' => {'type'=>'string', 'path'=>'Designation.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Designation.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Designation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'language' => {'type'=>'code', 'path'=>'Designation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
                'use' => {'valid_codes'=>{'http://snomed.info/sct'=>['900000000000003001', '900000000000013009']}, 'type'=>'Coding', 'path'=>'Designation.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/designation-use'}},
                'additionalUse' => {'valid_codes'=>{'http://snomed.info/sct'=>['900000000000003001', '900000000000013009']}, 'type'=>'Coding', 'path'=>'Designation.additionalUse', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/designation-use'}},
                'value' => {'type'=>'string', 'path'=>'Designation.value', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :language          # 0-1 code
              attr_accessor :use               # 0-1 Coding
              attr_accessor :additionalUse     # 0-* [ Coding ]
              attr_accessor :value             # 1-1 string
            end

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :code              # 1-1 code
            attr_accessor :display           # 0-1 string
            attr_accessor :designation       # 0-* [ ValueSet::Compose::Include::Concept::Designation ]
          end

          class Filter < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Filter.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Filter.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Filter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'property' => {'type'=>'code', 'path'=>'Filter.property', 'min'=>1, 'max'=>1},
              'op' => {'valid_codes'=>{'http://hl7.org/fhir/filter-operator'=>['=', 'is-a', 'descendent-of', 'is-not-a', 'regex', 'in', 'not-in', 'generalizes', 'child-of', 'descendent-leaf', 'exists']}, 'type'=>'code', 'path'=>'Filter.op', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/filter-operator'}},
              'value' => {'type'=>'string', 'path'=>'Filter.value', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :property          # 1-1 code
            attr_accessor :op                # 1-1 code
            attr_accessor :value             # 1-1 string
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :system            # 0-1 uri
          attr_accessor :version           # 0-1 string
          attr_accessor :concept           # 0-* [ ValueSet::Compose::Include::Concept ]
          attr_accessor :filter            # 0-* [ ValueSet::Compose::Include::Filter ]
          attr_accessor :valueSet          # 0-* [ canonical ]
          attr_accessor :copyright         # 0-1 markdown
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :lockedDate        # 0-1 date
        attr_accessor :inactive          # 0-1 boolean
        attr_accessor :include           # 1-* [ ValueSet::Compose::Include ]
        attr_accessor :exclude           # 0-* [ ValueSet::Compose::Include ]
        attr_accessor :property          # 0-* [ string ]
      end

      class Expansion < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Expansion.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Expansion.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Expansion.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'uri', 'path'=>'Expansion.identifier', 'min'=>0, 'max'=>1},
          'next' => {'type'=>'uri', 'path'=>'Expansion.next', 'min'=>0, 'max'=>1},
          'timestamp' => {'type'=>'dateTime', 'path'=>'Expansion.timestamp', 'min'=>1, 'max'=>1},
          'total' => {'type'=>'integer', 'path'=>'Expansion.total', 'min'=>0, 'max'=>1},
          'offset' => {'type'=>'integer', 'path'=>'Expansion.offset', 'min'=>0, 'max'=>1},
          'parameter' => {'type'=>'ValueSet::Expansion::Parameter', 'path'=>'Expansion.parameter', 'min'=>0, 'max'=>Float::INFINITY},
          'property' => {'type'=>'ValueSet::Expansion::Property', 'path'=>'Expansion.property', 'min'=>0, 'max'=>Float::INFINITY},
          'contains' => {'type'=>'ValueSet::Expansion::Contains', 'path'=>'Expansion.contains', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Parameter < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'value' => ['string', 'boolean', 'integer', 'decimal', 'uri', 'code', 'dateTime']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'string', 'path'=>'Parameter.name', 'min'=>1, 'max'=>1},
            'valueString' => {'type'=>'string', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
            'valueBoolean' => {'type'=>'boolean', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
            'valueInteger' => {'type'=>'integer', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
            'valueDecimal' => {'type'=>'decimal', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
            'valueUri' => {'type'=>'uri', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
            'valueCode' => {'type'=>'code', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1},
            'valueDateTime' => {'type'=>'dateTime', 'path'=>'Parameter.value[x]', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 string
          attr_accessor :valueString       # 0-1 string
          attr_accessor :valueBoolean      # 0-1 boolean
          attr_accessor :valueInteger      # 0-1 integer
          attr_accessor :valueDecimal      # 0-1 decimal
          attr_accessor :valueUri          # 0-1 uri
          attr_accessor :valueCode         # 0-1 code
          attr_accessor :valueDateTime     # 0-1 dateTime
        end

        class Property < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'type'=>'code', 'path'=>'Property.code', 'min'=>1, 'max'=>1},
            'uri' => {'type'=>'uri', 'path'=>'Property.uri', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :code              # 1-1 code
          attr_accessor :uri               # 0-1 uri
        end

        class Contains < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Contains.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Contains.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Contains.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'system' => {'type'=>'uri', 'path'=>'Contains.system', 'min'=>0, 'max'=>1},
            'abstract' => {'type'=>'boolean', 'path'=>'Contains.abstract', 'min'=>0, 'max'=>1},
            'inactive' => {'type'=>'boolean', 'path'=>'Contains.inactive', 'min'=>0, 'max'=>1},
            'version' => {'type'=>'string', 'path'=>'Contains.version', 'min'=>0, 'max'=>1},
            'code' => {'type'=>'code', 'path'=>'Contains.code', 'min'=>0, 'max'=>1},
            'display' => {'type'=>'string', 'path'=>'Contains.display', 'min'=>0, 'max'=>1},
            'designation' => {'type'=>'ValueSet::Compose::Include::Concept::Designation', 'path'=>'Contains.designation', 'min'=>0, 'max'=>Float::INFINITY},
            'property' => {'type'=>'ValueSet::Expansion::Contains::Property', 'path'=>'Contains.property', 'min'=>0, 'max'=>Float::INFINITY},
            'contains' => {'type'=>'ValueSet::Expansion::Contains', 'path'=>'Contains.contains', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Property < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'value' => ['code', 'Coding', 'string', 'integer', 'boolean', 'dateTime', 'decimal']
            }
            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Property.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Property.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Property.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'code' => {'type'=>'code', 'path'=>'Property.code', 'min'=>1, 'max'=>1},
              'valueCode' => {'type'=>'code', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
              'valueCoding' => {'type'=>'Coding', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
              'valueString' => {'type'=>'string', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
              'valueInteger' => {'type'=>'integer', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
              'valueBoolean' => {'type'=>'boolean', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
              'valueDateTime' => {'type'=>'dateTime', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
              'valueDecimal' => {'type'=>'decimal', 'path'=>'Property.value[x]', 'min'=>1, 'max'=>1},
              'subProperty' => {'type'=>'ValueSet::Expansion::Contains::Property::SubProperty', 'path'=>'Property.subProperty', 'min'=>0, 'max'=>Float::INFINITY}
            }

            class SubProperty < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              MULTIPLE_TYPES = {
                'value' => ['code', 'Coding', 'string', 'integer', 'boolean', 'dateTime', 'decimal']
              }
              METADATA = {
                'id' => {'type'=>'string', 'path'=>'SubProperty.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'SubProperty.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'SubProperty.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'code' => {'type'=>'code', 'path'=>'SubProperty.code', 'min'=>1, 'max'=>1},
                'valueCode' => {'type'=>'code', 'path'=>'SubProperty.value[x]', 'min'=>1, 'max'=>1},
                'valueCoding' => {'type'=>'Coding', 'path'=>'SubProperty.value[x]', 'min'=>1, 'max'=>1},
                'valueString' => {'type'=>'string', 'path'=>'SubProperty.value[x]', 'min'=>1, 'max'=>1},
                'valueInteger' => {'type'=>'integer', 'path'=>'SubProperty.value[x]', 'min'=>1, 'max'=>1},
                'valueBoolean' => {'type'=>'boolean', 'path'=>'SubProperty.value[x]', 'min'=>1, 'max'=>1},
                'valueDateTime' => {'type'=>'dateTime', 'path'=>'SubProperty.value[x]', 'min'=>1, 'max'=>1},
                'valueDecimal' => {'type'=>'decimal', 'path'=>'SubProperty.value[x]', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :code              # 1-1 code
              attr_accessor :valueCode         # 1-1 code
              attr_accessor :valueCoding       # 1-1 Coding
              attr_accessor :valueString       # 1-1 string
              attr_accessor :valueInteger      # 1-1 integer
              attr_accessor :valueBoolean      # 1-1 boolean
              attr_accessor :valueDateTime     # 1-1 dateTime
              attr_accessor :valueDecimal      # 1-1 decimal
            end

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :code              # 1-1 code
            attr_accessor :valueCode         # 1-1 code
            attr_accessor :valueCoding       # 1-1 Coding
            attr_accessor :valueString       # 1-1 string
            attr_accessor :valueInteger      # 1-1 integer
            attr_accessor :valueBoolean      # 1-1 boolean
            attr_accessor :valueDateTime     # 1-1 dateTime
            attr_accessor :valueDecimal      # 1-1 decimal
            attr_accessor :subProperty       # 0-* [ ValueSet::Expansion::Contains::Property::SubProperty ]
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :system            # 0-1 uri
          attr_accessor :abstract          # 0-1 boolean
          attr_accessor :inactive          # 0-1 boolean
          attr_accessor :version           # 0-1 string
          attr_accessor :code              # 0-1 code
          attr_accessor :display           # 0-1 string
          attr_accessor :designation       # 0-* [ ValueSet::Compose::Include::Concept::Designation ]
          attr_accessor :property          # 0-* [ ValueSet::Expansion::Contains::Property ]
          attr_accessor :contains          # 0-* [ ValueSet::Expansion::Contains ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :identifier        # 0-1 uri
        attr_accessor :next              # 0-1 uri
        attr_accessor :timestamp         # 1-1 dateTime
        attr_accessor :total             # 0-1 integer
        attr_accessor :offset            # 0-1 integer
        attr_accessor :parameter         # 0-* [ ValueSet::Expansion::Parameter ]
        attr_accessor :property          # 0-* [ ValueSet::Expansion::Property ]
        attr_accessor :contains          # 0-* [ ValueSet::Expansion::Contains ]
      end

      class Scope < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Scope.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Scope.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Scope.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'inclusionCriteria' => {'type'=>'markdown', 'path'=>'Scope.inclusionCriteria', 'min'=>0, 'max'=>1},
          'exclusionCriteria' => {'type'=>'markdown', 'path'=>'Scope.exclusionCriteria', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :inclusionCriteria # 0-1 markdown
        attr_accessor :exclusionCriteria # 0-1 markdown
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
      attr_accessor :immutable              # 0-1 boolean
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
      attr_accessor :compose                # 0-1 ValueSet::Compose
      attr_accessor :expansion              # 0-1 ValueSet::Expansion
      attr_accessor :scope                  # 0-1 ValueSet::Scope

      def resourceType
        'ValueSet'
      end
    end
  end
end