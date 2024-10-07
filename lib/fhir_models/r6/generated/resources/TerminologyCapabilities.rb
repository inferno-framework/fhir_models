module FHIR
  module build.fhir.org
    class TerminologyCapabilities < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding']
      }
      SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'description', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'title', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'TerminologyCapabilities.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'TerminologyCapabilities.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'TerminologyCapabilities.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'TerminologyCapabilities.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'TerminologyCapabilities.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'TerminologyCapabilities.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'TerminologyCapabilities.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'TerminologyCapabilities.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'TerminologyCapabilities.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'TerminologyCapabilities.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'TerminologyCapabilities.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'TerminologyCapabilities.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'TerminologyCapabilities.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'TerminologyCapabilities.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'TerminologyCapabilities.title', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'TerminologyCapabilities.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'TerminologyCapabilities.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'TerminologyCapabilities.date', 'min'=>1, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'TerminologyCapabilities.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'TerminologyCapabilities.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'TerminologyCapabilities.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'TerminologyCapabilities.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'TerminologyCapabilities.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'purpose' => {'type'=>'markdown', 'path'=>'TerminologyCapabilities.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'TerminologyCapabilities.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'TerminologyCapabilities.copyrightLabel', 'min'=>0, 'max'=>1},
        'kind' => {'valid_codes'=>{'http://hl7.org/fhir/capability-statement-kind'=>['instance', 'capability', 'requirements']}, 'type'=>'code', 'path'=>'TerminologyCapabilities.kind', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/capability-statement-kind'}},
        'software' => {'type'=>'TerminologyCapabilities::Software', 'path'=>'TerminologyCapabilities.software', 'min'=>0, 'max'=>1},
        'implementation' => {'type'=>'TerminologyCapabilities::Implementation', 'path'=>'TerminologyCapabilities.implementation', 'min'=>0, 'max'=>1},
        'lockedDate' => {'type'=>'boolean', 'path'=>'TerminologyCapabilities.lockedDate', 'min'=>0, 'max'=>1},
        'codeSystem' => {'type'=>'TerminologyCapabilities::CodeSystem', 'path'=>'TerminologyCapabilities.codeSystem', 'min'=>0, 'max'=>Float::INFINITY},
        'expansion' => {'type'=>'TerminologyCapabilities::Expansion', 'path'=>'TerminologyCapabilities.expansion', 'min'=>0, 'max'=>1},
        'codeSearch' => {'valid_codes'=>{'http://hl7.org/fhir/code-search-support'=>['in-compose', 'in-expansion', 'in-compose-or-expansion']}, 'type'=>'code', 'path'=>'TerminologyCapabilities.codeSearch', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/code-search-support'}},
        'validateCode' => {'type'=>'TerminologyCapabilities::ValidateCode', 'path'=>'TerminologyCapabilities.validateCode', 'min'=>0, 'max'=>1},
        'translation' => {'type'=>'TerminologyCapabilities::Translation', 'path'=>'TerminologyCapabilities.translation', 'min'=>0, 'max'=>1},
        'closure' => {'type'=>'TerminologyCapabilities::Closure', 'path'=>'TerminologyCapabilities.closure', 'min'=>0, 'max'=>1}
      }

      class Software < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Software.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Software.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Software.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Software.name', 'min'=>1, 'max'=>1},
          'version' => {'type'=>'string', 'path'=>'Software.version', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :version           # 0-1 string
      end

      class Implementation < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Implementation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Implementation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Implementation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'markdown', 'path'=>'Implementation.description', 'min'=>1, 'max'=>1},
          'url' => {'type'=>'url', 'path'=>'Implementation.url', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :description       # 1-1 markdown
        attr_accessor :url               # 0-1 url
      end

      class CodeSystem < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'CodeSystem.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CodeSystem.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'CodeSystem.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'uri' => {'type'=>'canonical', 'path'=>'CodeSystem.uri', 'min'=>0, 'max'=>1},
          'version' => {'type'=>'TerminologyCapabilities::CodeSystem::Version', 'path'=>'CodeSystem.version', 'min'=>0, 'max'=>Float::INFINITY},
          'content' => {'valid_codes'=>{'http://hl7.org/fhir/codesystem-content-mode'=>['not-present', 'example', 'fragment', 'complete', 'supplement']}, 'type'=>'code', 'path'=>'CodeSystem.content', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/codesystem-content-mode'}},
          'subsumption' => {'type'=>'boolean', 'path'=>'CodeSystem.subsumption', 'min'=>0, 'max'=>1}
        }

        class Version < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Version.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Version.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Version.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'type'=>'string', 'path'=>'Version.code', 'min'=>0, 'max'=>1},
            'isDefault' => {'type'=>'boolean', 'path'=>'Version.isDefault', 'min'=>0, 'max'=>1},
            'compositional' => {'type'=>'boolean', 'path'=>'Version.compositional', 'min'=>0, 'max'=>1},
            'language' => {'type'=>'code', 'path'=>'Version.language', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
            'filter' => {'type'=>'TerminologyCapabilities::CodeSystem::Version::Filter', 'path'=>'Version.filter', 'min'=>0, 'max'=>Float::INFINITY},
            'property' => {'type'=>'code', 'path'=>'Version.property', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class Filter < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Filter.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Filter.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Filter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'code' => {'type'=>'code', 'path'=>'Filter.code', 'min'=>1, 'max'=>1},
              'op' => {'type'=>'code', 'path'=>'Filter.op', 'min'=>1, 'max'=>Float::INFINITY}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :code              # 1-1 code
            attr_accessor :op                # 1-* [ code ]
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :code              # 0-1 string
          attr_accessor :isDefault         # 0-1 boolean
          attr_accessor :compositional     # 0-1 boolean
          attr_accessor :language          # 0-* [ code ]
          attr_accessor :filter            # 0-* [ TerminologyCapabilities::CodeSystem::Version::Filter ]
          attr_accessor :property          # 0-* [ code ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :uri               # 0-1 canonical
        attr_accessor :version           # 0-* [ TerminologyCapabilities::CodeSystem::Version ]
        attr_accessor :content           # 1-1 code
        attr_accessor :subsumption       # 0-1 boolean
      end

      class Expansion < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Expansion.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Expansion.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Expansion.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'hierarchical' => {'type'=>'boolean', 'path'=>'Expansion.hierarchical', 'min'=>0, 'max'=>1},
          'paging' => {'type'=>'boolean', 'path'=>'Expansion.paging', 'min'=>0, 'max'=>1},
          'incomplete' => {'type'=>'boolean', 'path'=>'Expansion.incomplete', 'min'=>0, 'max'=>1},
          'parameter' => {'type'=>'TerminologyCapabilities::Expansion::Parameter', 'path'=>'Expansion.parameter', 'min'=>0, 'max'=>Float::INFINITY},
          'textFilter' => {'type'=>'markdown', 'path'=>'Expansion.textFilter', 'min'=>0, 'max'=>1}
        }

        class Parameter < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'code', 'path'=>'Parameter.name', 'min'=>1, 'max'=>1},
            'documentation' => {'type'=>'markdown', 'path'=>'Parameter.documentation', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 code
          attr_accessor :documentation     # 0-1 markdown
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :hierarchical      # 0-1 boolean
        attr_accessor :paging            # 0-1 boolean
        attr_accessor :incomplete        # 0-1 boolean
        attr_accessor :parameter         # 0-* [ TerminologyCapabilities::Expansion::Parameter ]
        attr_accessor :textFilter        # 0-1 markdown
      end

      class ValidateCode < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ValidateCode.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ValidateCode.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ValidateCode.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'translations' => {'type'=>'boolean', 'path'=>'ValidateCode.translations', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :translations      # 1-1 boolean
      end

      class Translation < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Translation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Translation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Translation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'needsMap' => {'type'=>'boolean', 'path'=>'Translation.needsMap', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :needsMap          # 1-1 boolean
      end

      class Closure < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Closure.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Closure.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Closure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'translation' => {'type'=>'boolean', 'path'=>'Closure.translation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :translation       # 0-1 boolean
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
      attr_accessor :date                   # 1-1 dateTime
      attr_accessor :publisher              # 0-1 string
      attr_accessor :contact                # 0-* [ ContactDetail ]
      attr_accessor :description            # 0-1 markdown
      attr_accessor :useContext             # 0-* [ UsageContext ]
      attr_accessor :jurisdiction           # 0-* [ CodeableConcept ]
      attr_accessor :purpose                # 0-1 markdown
      attr_accessor :copyright              # 0-1 markdown
      attr_accessor :copyrightLabel         # 0-1 string
      attr_accessor :kind                   # 1-1 code
      attr_accessor :software               # 0-1 TerminologyCapabilities::Software
      attr_accessor :implementation         # 0-1 TerminologyCapabilities::Implementation
      attr_accessor :lockedDate             # 0-1 boolean
      attr_accessor :codeSystem             # 0-* [ TerminologyCapabilities::CodeSystem ]
      attr_accessor :expansion              # 0-1 TerminologyCapabilities::Expansion
      attr_accessor :codeSearch             # 0-1 code
      attr_accessor :validateCode           # 0-1 TerminologyCapabilities::ValidateCode
      attr_accessor :translation            # 0-1 TerminologyCapabilities::Translation
      attr_accessor :closure                # 0-1 TerminologyCapabilities::Closure

      def resourceType
        'TerminologyCapabilities'
      end
    end
  end
end