module FHIR
  module build.fhir.org
    class StructureMap < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding']
      }
      SEARCH_PARAMS = ['context', 'context-quantity', 'context-type', 'context-type-quantity', 'context-type-value', 'date', 'description', 'identifier', 'jurisdiction', 'name', 'publisher', 'status', 'title', 'url', 'version']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'StructureMap.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'StructureMap.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'StructureMap.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'StructureMap.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'StructureMap.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'StructureMap.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'StructureMap.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'StructureMap.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'StructureMap.url', 'min'=>1, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'StructureMap.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'StructureMap.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'StructureMap.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'StructureMap.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'StructureMap.name', 'min'=>1, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'StructureMap.title', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'StructureMap.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'StructureMap.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'StructureMap.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'StructureMap.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'StructureMap.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'StructureMap.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'StructureMap.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'StructureMap.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'purpose' => {'type'=>'markdown', 'path'=>'StructureMap.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'StructureMap.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'StructureMap.copyrightLabel', 'min'=>0, 'max'=>1},
        'structure' => {'type'=>'StructureMap::Structure', 'path'=>'StructureMap.structure', 'min'=>0, 'max'=>Float::INFINITY},
        'import' => {'type'=>'canonical', 'path'=>'StructureMap.import', 'min'=>0, 'max'=>Float::INFINITY},
        'const' => {'type'=>'StructureMap::Const', 'path'=>'StructureMap.const', 'min'=>0, 'max'=>Float::INFINITY},
        'group' => {'type'=>'StructureMap::Group', 'path'=>'StructureMap.group', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Structure < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Structure.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Structure.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Structure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'url' => {'type'=>'canonical', 'path'=>'Structure.url', 'min'=>1, 'max'=>1},
          'mode' => {'valid_codes'=>{'http://hl7.org/fhir/map-model-mode'=>['source', 'queried', 'target', 'produced']}, 'type'=>'code', 'path'=>'Structure.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-model-mode'}},
          'alias' => {'type'=>'string', 'path'=>'Structure.alias', 'min'=>0, 'max'=>1},
          'documentation' => {'type'=>'string', 'path'=>'Structure.documentation', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :url               # 1-1 canonical
        attr_accessor :mode              # 1-1 code
        attr_accessor :alias             # 0-1 string
        attr_accessor :documentation     # 0-1 string
      end

      class Const < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Const.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Const.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Const.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'id', 'path'=>'Const.name', 'min'=>0, 'max'=>1},
          'value' => {'type'=>'string', 'path'=>'Const.value', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 0-1 id
        attr_accessor :value             # 0-1 string
      end

      class Group < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'id', 'path'=>'Group.name', 'min'=>1, 'max'=>1},
          'extends' => {'type'=>'id', 'path'=>'Group.extends', 'min'=>0, 'max'=>1},
          'typeMode' => {'valid_codes'=>{'http://hl7.org/fhir/map-group-type-mode'=>['types', 'type-and-types']}, 'type'=>'code', 'path'=>'Group.typeMode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-group-type-mode'}},
          'documentation' => {'type'=>'string', 'path'=>'Group.documentation', 'min'=>0, 'max'=>1},
          'input' => {'type'=>'StructureMap::Group::Input', 'path'=>'Group.input', 'min'=>1, 'max'=>Float::INFINITY},
          'rule' => {'type'=>'StructureMap::Group::Rule', 'path'=>'Group.rule', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Input < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'id', 'path'=>'Input.name', 'min'=>1, 'max'=>1},
            'type' => {'type'=>'string', 'path'=>'Input.type', 'min'=>0, 'max'=>1},
            'mode' => {'valid_codes'=>{'http://hl7.org/fhir/map-input-mode'=>['source', 'target']}, 'type'=>'code', 'path'=>'Input.mode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-input-mode'}},
            'documentation' => {'type'=>'string', 'path'=>'Input.documentation', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 1-1 id
          attr_accessor :type              # 0-1 string
          attr_accessor :mode              # 1-1 code
          attr_accessor :documentation     # 0-1 string
        end

        class Rule < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Rule.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Rule.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Rule.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'name' => {'type'=>'id', 'path'=>'Rule.name', 'min'=>0, 'max'=>1},
            'source' => {'type'=>'StructureMap::Group::Rule::Source', 'path'=>'Rule.source', 'min'=>1, 'max'=>Float::INFINITY},
            'target' => {'type'=>'StructureMap::Group::Rule::Target', 'path'=>'Rule.target', 'min'=>0, 'max'=>Float::INFINITY},
            'rule' => {'type'=>'StructureMap::Group::Rule', 'path'=>'Rule.rule', 'min'=>0, 'max'=>Float::INFINITY},
            'dependent' => {'type'=>'StructureMap::Group::Rule::Dependent', 'path'=>'Rule.dependent', 'min'=>0, 'max'=>Float::INFINITY},
            'documentation' => {'type'=>'string', 'path'=>'Rule.documentation', 'min'=>0, 'max'=>1}
          }

          class Source < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Source.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Source.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Source.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'context' => {'type'=>'id', 'path'=>'Source.context', 'min'=>1, 'max'=>1},
              'min' => {'type'=>'integer', 'path'=>'Source.min', 'min'=>0, 'max'=>1},
              'max' => {'type'=>'string', 'path'=>'Source.max', 'min'=>0, 'max'=>1},
              'type' => {'type'=>'string', 'path'=>'Source.type', 'min'=>0, 'max'=>1},
              'defaultValue' => {'type'=>'string', 'path'=>'Source.defaultValue', 'min'=>0, 'max'=>1},
              'element' => {'type'=>'string', 'path'=>'Source.element', 'min'=>0, 'max'=>1},
              'listMode' => {'valid_codes'=>{'http://hl7.org/fhir/map-source-list-mode'=>['first', 'not_first', 'last', 'not_last', 'only_one']}, 'type'=>'code', 'path'=>'Source.listMode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-source-list-mode'}},
              'variable' => {'type'=>'id', 'path'=>'Source.variable', 'min'=>0, 'max'=>1},
              'condition' => {'type'=>'string', 'path'=>'Source.condition', 'min'=>0, 'max'=>1},
              'check' => {'type'=>'string', 'path'=>'Source.check', 'min'=>0, 'max'=>1},
              'logMessage' => {'type'=>'string', 'path'=>'Source.logMessage', 'min'=>0, 'max'=>1}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :context           # 1-1 id
            attr_accessor :min               # 0-1 integer
            attr_accessor :max               # 0-1 string
            attr_accessor :type              # 0-1 string
            attr_accessor :defaultValue      # 0-1 string
            attr_accessor :element           # 0-1 string
            attr_accessor :listMode          # 0-1 code
            attr_accessor :variable          # 0-1 id
            attr_accessor :condition         # 0-1 string
            attr_accessor :check             # 0-1 string
            attr_accessor :logMessage        # 0-1 string
          end

          class Target < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Target.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Target.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Target.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'context' => {'type'=>'string', 'path'=>'Target.context', 'min'=>0, 'max'=>1},
              'element' => {'type'=>'string', 'path'=>'Target.element', 'min'=>0, 'max'=>1},
              'variable' => {'type'=>'id', 'path'=>'Target.variable', 'min'=>0, 'max'=>1},
              'listMode' => {'valid_codes'=>{'http://hl7.org/fhir/map-target-list-mode'=>['first', 'share', 'last', 'single']}, 'type'=>'code', 'path'=>'Target.listMode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-target-list-mode'}},
              'listRuleId' => {'type'=>'id', 'path'=>'Target.listRuleId', 'min'=>0, 'max'=>1},
              'transform' => {'valid_codes'=>{'http://hl7.org/fhir/map-transform'=>['create', 'copy', 'truncate', 'escape', 'cast', 'append', 'translate', 'reference', 'dateOp', 'uuid', 'pointer', 'evaluate', 'cc', 'c', 'qty', 'id', 'cp']}, 'type'=>'code', 'path'=>'Target.transform', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/map-transform'}},
              'parameter' => {'type'=>'StructureMap::Group::Rule::Target::Parameter', 'path'=>'Target.parameter', 'min'=>0, 'max'=>Float::INFINITY}
            }

            class Parameter < Model
              include FHIR::Hashable
              include FHIR::Json
              include FHIR::Xml

              MULTIPLE_TYPES = {
                'value' => ['id', 'string', 'boolean', 'integer', 'decimal', 'date', 'time', 'dateTime']
              }
              METADATA = {
                'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
                'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
                'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
                'valueId' => {'type'=>'id', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
                'valueString' => {'type'=>'string', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
                'valueBoolean' => {'type'=>'boolean', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
                'valueInteger' => {'type'=>'integer', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
                'valueDecimal' => {'type'=>'decimal', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
                'valueDate' => {'type'=>'date', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
                'valueTime' => {'type'=>'time', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1},
                'valueDateTime' => {'type'=>'dateTime', 'path'=>'Parameter.value[x]', 'min'=>1, 'max'=>1}
              }

              attr_accessor :id                # 0-1 string
              attr_accessor :extension         # 0-* [ Extension ]
              attr_accessor :modifierExtension # 0-* [ Extension ]
              attr_accessor :valueId           # 1-1 id
              attr_accessor :valueString       # 1-1 string
              attr_accessor :valueBoolean      # 1-1 boolean
              attr_accessor :valueInteger      # 1-1 integer
              attr_accessor :valueDecimal      # 1-1 decimal
              attr_accessor :valueDate         # 1-1 date
              attr_accessor :valueTime         # 1-1 time
              attr_accessor :valueDateTime     # 1-1 dateTime
            end

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :context           # 0-1 string
            attr_accessor :element           # 0-1 string
            attr_accessor :variable          # 0-1 id
            attr_accessor :listMode          # 0-* [ code ]
            attr_accessor :listRuleId        # 0-1 id
            attr_accessor :transform         # 0-1 code
            attr_accessor :parameter         # 0-* [ StructureMap::Group::Rule::Target::Parameter ]
          end

          class Dependent < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Dependent.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Dependent.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Dependent.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'name' => {'type'=>'id', 'path'=>'Dependent.name', 'min'=>1, 'max'=>1},
              'parameter' => {'type'=>'StructureMap::Group::Rule::Target::Parameter', 'path'=>'Dependent.parameter', 'min'=>1, 'max'=>Float::INFINITY}
            }

            attr_accessor :id                # 0-1 string
            attr_accessor :extension         # 0-* [ Extension ]
            attr_accessor :modifierExtension # 0-* [ Extension ]
            attr_accessor :name              # 1-1 id
            attr_accessor :parameter         # 1-* [ StructureMap::Group::Rule::Target::Parameter ]
          end

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :name              # 0-1 id
          attr_accessor :source            # 1-* [ StructureMap::Group::Rule::Source ]
          attr_accessor :target            # 0-* [ StructureMap::Group::Rule::Target ]
          attr_accessor :rule              # 0-* [ StructureMap::Group::Rule ]
          attr_accessor :dependent         # 0-* [ StructureMap::Group::Rule::Dependent ]
          attr_accessor :documentation     # 0-1 string
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 id
        attr_accessor :extends           # 0-1 id
        attr_accessor :typeMode          # 0-1 code
        attr_accessor :documentation     # 0-1 string
        attr_accessor :input             # 1-* [ StructureMap::Group::Input ]
        attr_accessor :rule              # 0-* [ StructureMap::Group::Rule ]
      end

      attr_accessor :id                     # 0-1 id
      attr_accessor :meta                   # 0-1 Meta
      attr_accessor :implicitRules          # 0-1 uri
      attr_accessor :language               # 0-1 code
      attr_accessor :text                   # 0-1 Narrative
      attr_accessor :contained              # 0-* [ Resource ]
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :url                    # 1-1 uri
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
      attr_accessor :structure              # 0-* [ StructureMap::Structure ]
      attr_accessor :import                 # 0-* [ canonical ]
      attr_accessor :const                  # 0-* [ StructureMap::Const ]
      attr_accessor :group                  # 1-* [ StructureMap::Group ]

      def resourceType
        'StructureMap'
      end
    end
  end
end