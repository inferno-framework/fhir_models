module FHIR
  module build.fhir.org
    class TestScript < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding']
      }
      SEARCH_PARAMS = ['artifact', 'conformance', 'context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'description', 'identifier', 'jurisdiction', 'name', 'phase', 'publisher', 'scope-artifact-conformance', 'scope-artifact-phase', 'status', 'testscript-capability', 'title', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'TestScript.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'TestScript.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'TestScript.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'TestScript.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'TestScript.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'TestScript.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'TestScript.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'TestScript.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'TestScript.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'TestScript.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'TestScript.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'TestScript.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'TestScript.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'TestScript.name', 'min'=>1, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'TestScript.title', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'TestScript.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'TestScript.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'TestScript.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'TestScript.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'TestScript.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'TestScript.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'TestScript.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'TestScript.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'purpose' => {'type'=>'markdown', 'path'=>'TestScript.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'TestScript.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'TestScript.copyrightLabel', 'min'=>0, 'max'=>1},
        'origin' => {'type'=>'TestScript::Origin', 'path'=>'TestScript.origin', 'min'=>0, 'max'=>Float::INFINITY},
        'destination' => {'type'=>'TestScript::Destination', 'path'=>'TestScript.destination', 'min'=>0, 'max'=>Float::INFINITY},
        'metadata' => {'type'=>'TestScript::Metadata', 'path'=>'TestScript.metadata', 'min'=>0, 'max'=>1},
        'scope' => {'type'=>'TestScript::Scope', 'path'=>'TestScript.scope', 'min'=>0, 'max'=>Float::INFINITY},
        'fixture' => {'type'=>'TestScript::Fixture', 'path'=>'TestScript.fixture', 'min'=>0, 'max'=>Float::INFINITY},
        'profile' => {'type'=>'canonical', 'path'=>'TestScript.profile', 'min'=>0, 'max'=>Float::INFINITY},
        'variable' => {'type'=>'TestScript::Variable', 'path'=>'TestScript.variable', 'min'=>0, 'max'=>Float::INFINITY},
        'setup' => {'type'=>'TestScript::Setup', 'path'=>'TestScript.setup', 'min'=>0, 'max'=>1},
        'test' => {'type'=>'TestScript::Test', 'path'=>'TestScript.test', 'min'=>0, 'max'=>Float::INFINITY},
        'teardown' => {'type'=>'TestScript::Teardown', 'path'=>'TestScript.teardown', 'min'=>0, 'max'=>1},
        'common' => {'type'=>'TestScript::Common', 'path'=>'TestScript.common', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Origin < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Origin.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Origin.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Origin.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'index' => {'type'=>'integer', 'path'=>'Origin.index', 'min'=>1, 'max'=>1},
          'profile' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/testscript-profile-origin-types'=>['FHIR-Client', 'FHIR-SDC-FormFiller']}, 'type'=>'Coding', 'path'=>'Origin.profile', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-profile-origin-types'}},
          'url' => {'type'=>'url', 'path'=>'Origin.url', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :index             # 1-1 integer
        attr_accessor :profile           # 1-1 Coding
        attr_accessor :url               # 0-1 url
      end

      class Destination < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Destination.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Destination.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Destination.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'index' => {'type'=>'integer', 'path'=>'Destination.index', 'min'=>1, 'max'=>1},
          'profile' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/testscript-profile-destination-types'=>['FHIR-Server', 'FHIR-SDC-FormManager', 'FHIR-SDC-FormProcessor', 'FHIR-SDC-FormReceiver']}, 'type'=>'Coding', 'path'=>'Destination.profile', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-profile-destination-types'}},
          'url' => {'type'=>'url', 'path'=>'Destination.url', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :index             # 1-1 integer
        attr_accessor :profile           # 1-1 Coding
        attr_accessor :url               # 0-1 url
      end

      class Metadata < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Metadata.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Metadata.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Metadata.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'link' => {'type'=>'TestScript::Metadata::Link', 'path'=>'Metadata.link', 'min'=>0, 'max'=>Float::INFINITY},
          'capability' => {'type'=>'TestScript::Metadata::Capability', 'path'=>'Metadata.capability', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Link < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Link.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Link.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Link.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'url' => {'type'=>'uri', 'path'=>'Link.url', 'min'=>1, 'max'=>1},
            'description' => {'type'=>'string', 'path'=>'Link.description', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :url               # 1-1 uri
          attr_accessor :description       # 0-1 string
        end

        class Capability < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Capability.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Capability.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Capability.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'required' => {'type'=>'boolean', 'path'=>'Capability.required', 'min'=>1, 'max'=>1},
            'validated' => {'type'=>'boolean', 'path'=>'Capability.validated', 'min'=>1, 'max'=>1},
            'description' => {'type'=>'string', 'path'=>'Capability.description', 'min'=>0, 'max'=>1},
            'origin' => {'type'=>'integer', 'path'=>'Capability.origin', 'min'=>0, 'max'=>Float::INFINITY},
            'destination' => {'type'=>'integer', 'path'=>'Capability.destination', 'min'=>0, 'max'=>1},
            'link' => {'type'=>'uri', 'path'=>'Capability.link', 'min'=>0, 'max'=>Float::INFINITY},
            'capabilities' => {'type'=>'canonical', 'path'=>'Capability.capabilities', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :required          # 1-1 boolean
          attr_accessor :validated         # 1-1 boolean
          attr_accessor :description       # 0-1 string
          attr_accessor :origin            # 0-* [ integer ]
          attr_accessor :destination       # 0-1 integer
          attr_accessor :link              # 0-* [ uri ]
          attr_accessor :capabilities      # 1-1 canonical
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :link              # 0-* [ TestScript::Metadata::Link ]
        attr_accessor :capability        # 1-* [ TestScript::Metadata::Capability ]
      end

      class Scope < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Scope.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Scope.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Scope.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'artifact' => {'type'=>'canonical', 'path'=>'Scope.artifact', 'min'=>1, 'max'=>1},
          'conformance' => {'valid_codes'=>{'http://hl7.org/fhir/testscript-scope-conformance-codes'=>['required', 'optional', 'strict']}, 'type'=>'CodeableConcept', 'path'=>'Scope.conformance', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-scope-conformance-codes'}},
          'phase' => {'valid_codes'=>{'http://hl7.org/fhir/testscript-scope-phase-codes'=>['unit', 'integration', 'production']}, 'type'=>'CodeableConcept', 'path'=>'Scope.phase', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-scope-phase-codes'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :artifact          # 1-1 canonical
        attr_accessor :conformance       # 0-1 CodeableConcept
        attr_accessor :phase             # 0-1 CodeableConcept
      end

      class Fixture < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Fixture.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Fixture.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Fixture.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'autocreate' => {'type'=>'boolean', 'path'=>'Fixture.autocreate', 'min'=>1, 'max'=>1},
          'autodelete' => {'type'=>'boolean', 'path'=>'Fixture.autodelete', 'min'=>1, 'max'=>1},
          'resource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Fixture.resource', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :autocreate        # 1-1 boolean
        attr_accessor :autodelete        # 1-1 boolean
        attr_accessor :resource          # 0-1 Reference(Resource)
      end

      class Variable < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Variable.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Variable.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Variable.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Variable.name', 'min'=>1, 'max'=>1},
          'defaultValue' => {'type'=>'string', 'path'=>'Variable.defaultValue', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Variable.description', 'min'=>0, 'max'=>1},
          'expression' => {'type'=>'string', 'path'=>'Variable.expression', 'min'=>0, 'max'=>1},
          'headerField' => {'type'=>'string', 'path'=>'Variable.headerField', 'min'=>0, 'max'=>1},
          'hint' => {'type'=>'string', 'path'=>'Variable.hint', 'min'=>0, 'max'=>1},
          'path' => {'type'=>'string', 'path'=>'Variable.path', 'min'=>0, 'max'=>1},
          'sourceId' => {'type'=>'id', 'path'=>'Variable.sourceId', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :defaultValue      # 0-1 string
        attr_accessor :description       # 0-1 string
        attr_accessor :expression        # 0-1 string
        attr_accessor :headerField       # 0-1 string
        attr_accessor :hint              # 0-1 string
        attr_accessor :path              # 0-1 string
        attr_accessor :sourceId          # 0-1 id
      end

      class Setup < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Setup.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Setup.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Setup.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'action' => {'type'=>'TestScript::Setup::Action', 'path'=>'Setup.action', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Action < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'common' => {'type'=>'TestScript::Setup::Action::Common', 'path'=>'Action.common', 'min'=>0, 'max'=>1},
            'operation' => {'type'=>'TestScript::Setup::Action::Operation', 'path'=>'Action.operation', 'min'=>0, 'max'=>1},
            'assert' => {'type'=>'TestScript::Setup::Action::Assert', 'path'=>'Action.assert', 'min'=>0, 'max'=>1}
          }

          class Common < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Common.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Common.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Common.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'testScript' => {'type'=>'canonical', 'path'=>'Common.testScript', 'min'=>0, 'max'=>1},
              'keyRef' => {'type'=>'id', 'path'=>'Common.keyRef', 'min'=>1, 'max'=>1},
              'parameter' => {'type'=>'TestScript::Setup::Action::Common::Parameter', 'path'=>'Common.parameter', 'min'=>0, 'max'=>Float::INFINITY}
            }

            class Parameter < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              METADATA = {
                'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'name' => {'type'=>'string', 'path'=>'Parameter.name', 'min'=>1, 'max'=>1},
                'value' => {'type'=>'string', 'path'=>'Parameter.value', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :name              # 1-1 string
              attr_accessor :value             # 1-1 string
            end

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :testScript        # 0-1 canonical
            attr_accessor :keyRef            # 1-1 id
            attr_accessor :parameter         # 0-* [ TestScript::Setup::Action::Common::Parameter ]
          end

          class Operation < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Operation.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Operation.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Operation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'type' => {'valid_codes'=>{'http://hl7.org/fhir/restful-interaction'=>['read', 'vread', 'update', 'update-conditional', 'patch', 'patch-conditional', 'delete', 'delete-conditional-single', 'delete-conditional-multiple', 'delete-history', 'delete-history-version', 'history', 'history-instance', 'history-type', 'history-system', 'create', 'create-conditional', 'search', 'search-type', 'search-system', 'search-compartment', 'capabilities', 'transaction', 'batch', 'operation']}, 'type'=>'Coding', 'path'=>'Operation.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/testscript-operation-codes'}},
              'resource' => {'type'=>'uri', 'path'=>'Operation.resource', 'min'=>0, 'max'=>1},
              'label' => {'type'=>'string', 'path'=>'Operation.label', 'min'=>0, 'max'=>1},
              'description' => {'type'=>'string', 'path'=>'Operation.description', 'min'=>0, 'max'=>1},
              'accept' => {'type'=>'code', 'path'=>'Operation.accept', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
              'contentType' => {'type'=>'code', 'path'=>'Operation.contentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
              'destination' => {'type'=>'integer', 'path'=>'Operation.destination', 'min'=>0, 'max'=>1},
              'encodeRequestUrl' => {'type'=>'boolean', 'path'=>'Operation.encodeRequestUrl', 'min'=>1, 'max'=>1},
              'method' => {'local_name'=>'local_method', 'valid_codes'=>{'http://hl7.org/fhir/http-operations'=>['delete', 'get', 'options', 'patch', 'post', 'put', 'head']}, 'type'=>'code', 'path'=>'Operation.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/http-operations'}},
              'origin' => {'type'=>'integer', 'path'=>'Operation.origin', 'min'=>0, 'max'=>1},
              'params' => {'type'=>'string', 'path'=>'Operation.params', 'min'=>0, 'max'=>1},
              'requestHeader' => {'type'=>'TestScript::Setup::Action::Operation::RequestHeader', 'path'=>'Operation.requestHeader', 'min'=>0, 'max'=>Float::INFINITY},
              'requestId' => {'type'=>'id', 'path'=>'Operation.requestId', 'min'=>0, 'max'=>1},
              'responseId' => {'type'=>'id', 'path'=>'Operation.responseId', 'min'=>0, 'max'=>1},
              'sourceId' => {'type'=>'id', 'path'=>'Operation.sourceId', 'min'=>0, 'max'=>1},
              'targetId' => {'type'=>'id', 'path'=>'Operation.targetId', 'min'=>0, 'max'=>1},
              'url' => {'type'=>'string', 'path'=>'Operation.url', 'min'=>0, 'max'=>1}
            }

            class RequestHeader < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              METADATA = {
                'id' => {'type'=>'string', 'path'=>'RequestHeader.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'RequestHeader.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'RequestHeader.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'field' => {'type'=>'string', 'path'=>'RequestHeader.field', 'min'=>1, 'max'=>1},
                'value' => {'type'=>'string', 'path'=>'RequestHeader.value', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :field             # 1-1 string
              attr_accessor :value             # 1-1 string
            end

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :type              # 0-1 Coding
            attr_accessor :resource          # 0-1 uri
            attr_accessor :label             # 0-1 string
            attr_accessor :description       # 0-1 string
            attr_accessor :accept            # 0-1 code
            attr_accessor :contentType       # 0-1 code
            attr_accessor :destination       # 0-1 integer
            attr_accessor :encodeRequestUrl  # 1-1 boolean
            attr_accessor :local_method      # 0-1 code
            attr_accessor :origin            # 0-1 integer
            attr_accessor :params            # 0-1 string
            attr_accessor :requestHeader     # 0-* [ TestScript::Setup::Action::Operation::RequestHeader ]
            attr_accessor :requestId         # 0-1 id
            attr_accessor :responseId        # 0-1 id
            attr_accessor :sourceId          # 0-1 id
            attr_accessor :targetId          # 0-1 id
            attr_accessor :url               # 0-1 string
          end

          class Assert < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Assert.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Assert.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Assert.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'label' => {'type'=>'string', 'path'=>'Assert.label', 'min'=>0, 'max'=>1},
              'description' => {'type'=>'string', 'path'=>'Assert.description', 'min'=>0, 'max'=>1},
              'direction' => {'valid_codes'=>{'http://hl7.org/fhir/assert-direction-codes'=>['response', 'request']}, 'type'=>'code', 'path'=>'Assert.direction', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/assert-direction-codes'}},
              'compareToSourceId' => {'type'=>'string', 'path'=>'Assert.compareToSourceId', 'min'=>0, 'max'=>1},
              'compareToSourceExpression' => {'type'=>'string', 'path'=>'Assert.compareToSourceExpression', 'min'=>0, 'max'=>1},
              'compareToSourcePath' => {'type'=>'string', 'path'=>'Assert.compareToSourcePath', 'min'=>0, 'max'=>1},
              'contentType' => {'type'=>'code', 'path'=>'Assert.contentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
              'defaultManualCompletion' => {'valid_codes'=>{'http://hl7.org/fhir/assert-manual-completion-codes'=>['fail', 'pass', 'skip', 'stop']}, 'type'=>'code', 'path'=>'Assert.defaultManualCompletion', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/assert-manual-completion-codes'}},
              'expression' => {'type'=>'string', 'path'=>'Assert.expression', 'min'=>0, 'max'=>1},
              'headerField' => {'type'=>'string', 'path'=>'Assert.headerField', 'min'=>0, 'max'=>1},
              'minimumId' => {'type'=>'string', 'path'=>'Assert.minimumId', 'min'=>0, 'max'=>1},
              'navigationLinks' => {'type'=>'boolean', 'path'=>'Assert.navigationLinks', 'min'=>0, 'max'=>1},
              'operator' => {'valid_codes'=>{'http://hl7.org/fhir/assert-operator-codes'=>['equals', 'notEquals', 'in', 'notIn', 'greaterThan', 'lessThan', 'empty', 'notEmpty', 'contains', 'notContains', 'eval', 'manualEval']}, 'type'=>'code', 'path'=>'Assert.operator', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/assert-operator-codes'}},
              'path' => {'type'=>'string', 'path'=>'Assert.path', 'min'=>0, 'max'=>1},
              'requestMethod' => {'valid_codes'=>{'http://hl7.org/fhir/http-operations'=>['delete', 'get', 'options', 'patch', 'post', 'put', 'head']}, 'type'=>'code', 'path'=>'Assert.requestMethod', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/http-operations'}},
              'requestURL' => {'type'=>'string', 'path'=>'Assert.requestURL', 'min'=>0, 'max'=>1},
              'resource' => {'type'=>'uri', 'path'=>'Assert.resource', 'min'=>0, 'max'=>1},
              'response' => {'valid_codes'=>{'http://hl7.org/fhir/assert-response-code-types'=>['continue', 'switchingProtocols', 'okay', 'created', 'accepted', 'nonAuthoritativeInformation', 'noContent', 'resetContent', 'partialContent', 'multipleChoices', 'movedPermanently', 'found', 'seeOther', 'notModified', 'useProxy', 'temporaryRedirect', 'permanentRedirect', 'badRequest', 'unauthorized', 'paymentRequired', 'forbidden', 'notFound', 'methodNotAllowed', 'notAcceptable', 'proxyAuthenticationRequired', 'requestTimeout', 'conflict', 'gone', 'lengthRequired', 'preconditionFailed', 'contentTooLarge', 'uriTooLong', 'unsupportedMediaType', 'rangeNotSatisfiable', 'expectationFailed', 'misdirectedRequest', 'unprocessableContent', 'upgradeRequired', 'internalServerError', 'notImplemented', 'badGateway', 'serviceUnavailable', 'gatewayTimeout', 'httpVersionNotSupported']}, 'type'=>'code', 'path'=>'Assert.response', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/assert-response-code-types'}},
              'responseCode' => {'type'=>'string', 'path'=>'Assert.responseCode', 'min'=>0, 'max'=>1},
              'sourceId' => {'type'=>'id', 'path'=>'Assert.sourceId', 'min'=>0, 'max'=>1},
              'stopTestOnFail' => {'type'=>'boolean', 'path'=>'Assert.stopTestOnFail', 'min'=>1, 'max'=>1},
              'validateProfileId' => {'type'=>'id', 'path'=>'Assert.validateProfileId', 'min'=>0, 'max'=>1},
              'value' => {'type'=>'string', 'path'=>'Assert.value', 'min'=>0, 'max'=>1},
              'warningOnly' => {'type'=>'boolean', 'path'=>'Assert.warningOnly', 'min'=>1, 'max'=>1},
              'requirement' => {'type'=>'TestScript::Setup::Action::Assert::Requirement', 'path'=>'Assert.requirement', 'min'=>0, 'max'=>Float::INFINITY}
            }

            class Requirement < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              METADATA = {
                'id' => {'type'=>'string', 'path'=>'Requirement.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Requirement.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Requirement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'reference' => {'type'=>'canonical', 'path'=>'Requirement.reference', 'min'=>1, 'max'=>1},
                'key' => {'type'=>'id', 'path'=>'Requirement.key', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :reference         # 1-1 canonical
              attr_accessor :key               # 1-1 id
            end

            attr_accessor :id                        # 0-1 string
            attr_accessor :extension                 # 0-* [ Extension ]
            attr_accessor :modifierExtension         # 0-* [ Extension ]
            attr_accessor :label                     # 0-1 string
            attr_accessor :description               # 0-1 string
            attr_accessor :direction                 # 0-1 code
            attr_accessor :compareToSourceId         # 0-1 string
            attr_accessor :compareToSourceExpression # 0-1 string
            attr_accessor :compareToSourcePath       # 0-1 string
            attr_accessor :contentType               # 0-1 code
            attr_accessor :defaultManualCompletion   # 0-1 code
            attr_accessor :expression                # 0-1 string
            attr_accessor :headerField               # 0-1 string
            attr_accessor :minimumId                 # 0-1 string
            attr_accessor :navigationLinks           # 0-1 boolean
            attr_accessor :operator                  # 0-1 code
            attr_accessor :path                      # 0-1 string
            attr_accessor :requestMethod             # 0-1 code
            attr_accessor :requestURL                # 0-1 string
            attr_accessor :resource                  # 0-1 uri
            attr_accessor :response                  # 0-1 code
            attr_accessor :responseCode              # 0-1 string
            attr_accessor :sourceId                  # 0-1 id
            attr_accessor :stopTestOnFail            # 1-1 boolean
            attr_accessor :validateProfileId         # 0-1 id
            attr_accessor :value                     # 0-1 string
            attr_accessor :warningOnly               # 1-1 boolean
            attr_accessor :requirement               # 0-* [ TestScript::Setup::Action::Assert::Requirement ]
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :common            # 0-1 TestScript::Setup::Action::Common
          attr_accessor :operation         # 0-1 TestScript::Setup::Action::Operation
          attr_accessor :assert            # 0-1 TestScript::Setup::Action::Assert
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :action            # 0-* [ TestScript::Setup::Action ]
      end

      class Test < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Test.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Test.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Test.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Test.name', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Test.description', 'min'=>0, 'max'=>1},
          'action' => {'type'=>'TestScript::Test::Action', 'path'=>'Test.action', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Action < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'common' => {'type'=>'TestScript::Setup::Action::Common', 'path'=>'Action.common', 'min'=>0, 'max'=>1},
            'operation' => {'type'=>'TestScript::Setup::Action::Operation', 'path'=>'Action.operation', 'min'=>0, 'max'=>1},
            'assert' => {'type'=>'TestScript::Setup::Action::Assert', 'path'=>'Action.assert', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :common            # 0-1 TestScript::Setup::Action::Common
          attr_accessor :operation         # 0-1 TestScript::Setup::Action::Operation
          attr_accessor :assert            # 0-1 TestScript::Setup::Action::Assert
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 0-1 string
        attr_accessor :description       # 0-1 string
        attr_accessor :action            # 0-* [ TestScript::Test::Action ]
      end

      class Teardown < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Teardown.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Teardown.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Teardown.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'action' => {'type'=>'TestScript::Teardown::Action', 'path'=>'Teardown.action', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Action < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'common' => {'type'=>'TestScript::Setup::Action::Common', 'path'=>'Action.common', 'min'=>0, 'max'=>1},
            'operation' => {'type'=>'TestScript::Setup::Action::Operation', 'path'=>'Action.operation', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :common            # 0-1 TestScript::Setup::Action::Common
          attr_accessor :operation         # 1-1 TestScript::Setup::Action::Operation
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :action            # 1-* [ TestScript::Teardown::Action ]
      end

      class Common < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Common.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Common.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Common.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'key' => {'type'=>'id', 'path'=>'Common.key', 'min'=>1, 'max'=>1},
          'name' => {'type'=>'string', 'path'=>'Common.name', 'min'=>0, 'max'=>1},
          'description' => {'type'=>'string', 'path'=>'Common.description', 'min'=>0, 'max'=>1},
          'parameter' => {'type'=>'TestScript::Common::Parameter', 'path'=>'Common.parameter', 'min'=>0, 'max'=>Float::INFINITY},
          'action' => {'type'=>'TestScript::Common::Action', 'path'=>'Common.action', 'min'=>1, 'max'=>Float::INFINITY}
        }

        class Parameter < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'string', 'path'=>'Parameter.name', 'min'=>0, 'max'=>1},
            'description' => {'type'=>'string', 'path'=>'Parameter.description', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 0-1 string
          attr_accessor :description       # 0-1 string
        end

        class Action < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Action.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Action.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Action.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'operation' => {'type'=>'TestScript::Setup::Action::Operation', 'path'=>'Action.operation', 'min'=>0, 'max'=>1},
            'assert' => {'type'=>'TestScript::Setup::Action::Assert', 'path'=>'Action.assert', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :operation         # 0-1 TestScript::Setup::Action::Operation
          attr_accessor :assert            # 0-1 TestScript::Setup::Action::Assert
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :key               # 1-1 id
        attr_accessor :name              # 0-1 string
        attr_accessor :description       # 0-1 string
        attr_accessor :parameter         # 0-* [ TestScript::Common::Parameter ]
        attr_accessor :action            # 1-* [ TestScript::Common::Action ]
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
      attr_accessor :name                   # 1-1 string
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
      attr_accessor :origin                 # 0-* [ TestScript::Origin ]
      attr_accessor :destination            # 0-* [ TestScript::Destination ]
      attr_accessor :metadata               # 0-1 TestScript::Metadata
      attr_accessor :scope                  # 0-* [ TestScript::Scope ]
      attr_accessor :fixture                # 0-* [ TestScript::Fixture ]
      attr_accessor :profile                # 0-* [ canonical ]
      attr_accessor :variable               # 0-* [ TestScript::Variable ]
      attr_accessor :setup                  # 0-1 TestScript::Setup
      attr_accessor :test                   # 0-* [ TestScript::Test ]
      attr_accessor :teardown               # 0-1 TestScript::Teardown
      attr_accessor :common                 # 0-* [ TestScript::Common ]

      def resourceType
        'TestScript'
      end
    end
  end
end