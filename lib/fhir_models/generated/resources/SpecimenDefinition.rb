module FHIR
  module build.fhir.org
    class SpecimenDefinition < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding'],
        'subject' => ['CodeableConcept', 'Reference']
      }
      SEARCH_PARAMS = ['container', 'experimental', 'identifier', 'is-derived', 'status', 'title', 'type', 'type-tested', 'url']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'SpecimenDefinition.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'SpecimenDefinition.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'SpecimenDefinition.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'SpecimenDefinition.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'SpecimenDefinition.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'SpecimenDefinition.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'SpecimenDefinition.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'SpecimenDefinition.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'SpecimenDefinition.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'SpecimenDefinition.identifier', 'min'=>0, 'max'=>1},
        'version' => {'type'=>'string', 'path'=>'SpecimenDefinition.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'SpecimenDefinition.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'SpecimenDefinition.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'SpecimenDefinition.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'SpecimenDefinition.title', 'min'=>0, 'max'=>1},
        'derivedFromCanonical' => {'type'=>'canonical', 'path'=>'SpecimenDefinition.derivedFromCanonical', 'min'=>0, 'max'=>Float::INFINITY},
        'derivedFromUri' => {'type'=>'uri', 'path'=>'SpecimenDefinition.derivedFromUri', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'SpecimenDefinition.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'SpecimenDefinition.experimental', 'min'=>0, 'max'=>1},
        'subjectCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.subject[x]', 'min'=>0, 'max'=>1},
        'subjectReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'SpecimenDefinition.subject[x]', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'SpecimenDefinition.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'SpecimenDefinition.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'SpecimenDefinition.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'SpecimenDefinition.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'SpecimenDefinition.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'jurisdiction' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.jurisdiction', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'purpose' => {'type'=>'markdown', 'path'=>'SpecimenDefinition.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'SpecimenDefinition.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'SpecimenDefinition.copyrightLabel', 'min'=>0, 'max'=>1},
        'approvalDate' => {'type'=>'date', 'path'=>'SpecimenDefinition.approvalDate', 'min'=>0, 'max'=>1},
        'lastReviewDate' => {'type'=>'date', 'path'=>'SpecimenDefinition.lastReviewDate', 'min'=>0, 'max'=>1},
        'effectivePeriod' => {'type'=>'Period', 'path'=>'SpecimenDefinition.effectivePeriod', 'min'=>0, 'max'=>1},
        'typeCollected' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0487'=>['ABS', '...', 'ACNE', 'ACNFLD', 'AIRS', 'ALL', 'AMN', 'AMP', 'ANGI', 'ARTC', 'ASERU', 'ASP', 'ATTE', 'AUTOA', 'AUTOC', 'AUTP', 'BBL', 'BCYST', 'BDY', 'BIFL', 'BITE', 'BLD', 'BLDA', 'BLDCO', 'BLDV', 'BLEB', 'BLIST', 'BOIL', 'BON', 'BOWL', 'BPH', 'BPU', 'BRN', 'BRSH', 'BRTH', 'BRUS', 'BUB', 'BULLA', 'BX', 'CALC', 'BONE', 'CARBU', 'CAT', 'CBITE', 'CDM', 'CLIPP', 'CNJT', 'CNL', 'COL', 'CONE', 'CSCR', 'CSERU', 'CSF', 'CSITE', 'CSMY', 'CST', 'CSVR', 'CTP', 'CUR', 'CVM', 'CVPS', 'CVPT', 'CYN', 'CYST', 'DBITE', 'DCS', 'DEC', 'DEION', 'DIA', 'DIAF', 'DISCHG', 'DIV', 'DRN', 'DRNG', 'DRNGP', 'DUFL', 'EARW', 'EBRUSH', 'EEYE', 'EFF', 'EFFUS', 'EFOD', 'EISO', 'ELT', 'ENVIR', 'EOS', 'EOTH', 'ESOI', 'ESOS', 'ETA', 'ETTP', 'ETTUB', 'EWHI', 'EXG', 'EXS', 'EXUDTE', 'FAW', 'FBLOOD', 'FGA', 'FIB', 'FIST', 'FLD', 'FLT', 'FLU', 'FLUID', 'FOLEY', 'FRS', 'FSCLP', 'FUR', 'GAS', 'GASA', 'GASAN', 'GASBR', 'GASD', 'GAST', 'GENL', 'GENV', 'GRAFT', 'GRAFTS', 'GRANU', 'GROSH', 'GSOL', 'GSPEC', 'GT', 'GTUBE', 'HAR', 'HBITE', 'HBLUD', 'HEMAQ', 'HEMO', 'HERNI', 'HEV', 'HIC', 'HYDC', 'IBITE', 'ICYST', 'IDC', 'IHG', 'ILEO', 'ILLEG', 'IMP', 'INCI', 'INFIL', 'INS', 'INTRD', 'ISLT', 'IT', 'IUD', 'IVCAT', 'IVFLD', 'IVTIP', 'JEJU', 'JNTFLD', 'JP', 'KELOI', 'KIDFLD', 'LAVG', 'LAVGG', 'LAVGP', 'LAVPG', 'LENS1', 'LENS2', 'LESN', 'LIQ', 'LIQO', 'LNA', 'LNV', 'LSAC', 'LYM', 'MAC', 'MAHUR', 'MAR', 'MASS', 'MBLD', 'MEC', 'MILK', 'MLK', 'MUCOS', 'MUCUS', 'NAIL', 'NASDR', 'NEDL', 'NEPH', 'NGASP', 'NGAST', 'NGS', 'NODUL', 'NSECR', 'ORH', 'ORL', 'OTH', 'PACEM', 'PAFL', 'PCFL', 'PDSIT', 'PDTS', 'PELVA', 'PENIL', 'PERIA', 'PILOC', 'PINS', 'PIS', 'PLAN', 'PLAS', 'PLB', 'PLC', 'PLEVS', 'PLR', 'PMN', 'PND', 'POL', 'POPGS', 'POPLG', 'POPLV', 'PORTA', 'PPP', 'PROST', 'PRP', 'PSC', 'PUNCT', 'PUS', 'PUSFR', 'PUST', 'QC3', 'RANDU', 'RBC', 'RBITE', 'RECT', 'RECTA', 'RENALC', 'RENC', 'RES', 'SAL', 'SCAR', 'SCLV', 'SCROA', 'SECRE', 'SER', 'SHU', 'SHUNF', 'SHUNT', 'SITE', 'SKBP', 'SKN', 'SMM', 'SMN', 'SNV', 'SPRM', 'SPRP', 'SPRPB', 'SPS', 'SPT', 'SPTC', 'SPTT', 'SPUT1', 'SPUTIN', 'SPUTSP', 'STER', 'STL', 'STONE', 'SUBMA', 'SUBMX', 'SUMP', 'SUP', 'SUTUR', 'SWGZ', 'SWT', 'TASP', 'TEAR', 'THRB', 'TISS', 'TISU', 'TLC', 'TRAC', 'TRANS', 'TSERU', 'TSTES', 'TTRA', 'TUBES', 'TUMOR', 'TZANC', 'UDENT', 'UMED', 'UR', 'URC', 'URINB', 'URINC', 'URINM', 'URINN', 'URINP', 'URNS', 'URT', 'USCOP', 'USPEC', 'USUB', 'VASTIP', 'VENT', 'VITF', 'VOM', 'WASH', 'WASI', 'WAT', 'WB', 'WBC', 'WEN', 'WICK', 'WND', 'WNDA', 'WNDD', 'WNDE', 'WORM', 'WRT', 'WWA', 'WWO', 'WWT']}, 'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.typeCollected', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0487'}},
        'patientPreparation' => {'valid_codes'=>{'http://snomed.info/sct'=>['703763000', '2546009', '3658006', '41847000', '115499008', '115500004', '255214003', '255226008', '255240009', '255241008', '255242001', '255243006', '255244000', '255245004', '255246003', '255247007', '255248002', '255270004', '255398004', '255399007', '255407002', '255410009', '255566006', '255614006', '255615007', '255616008', '255617004', '261829003', '262459003', '263659003', '263675000', '263678003', '263844007', '271872005', '276986009', '276987000', '282032007', '303111005', '303112003', '303113008', '303114002', '303115001', '307159006', '307166007', '307429007', '309601007', '309604004', '309605003', '309606002', '371578004', '450426006', '703760002', '703761003', '703762005', '703764006', '703765007', '703766008', '703767004', '703768009', '703769001', '703770000', '703771001', '703772008', '703773003', '703774009', '703775005', '707707000', '707708005', '707709002', '707710007', '707712004', '707714003', '707715002', '707716001', '707717005', '707718000', '707719008', '707720002', '707721003', '707722005', '707723000', '707757008', '707758003', '707759006', '707760001', '707761002', '707762009', '707763004', '707764005', '707765006', '707815009', '707816005', '707817001', '707818006', '707819003', '707820009', '713152004', '713153009', '723238007', '723279008', '726054005', '726055006', '726056007', '733986001', '733987005', '733988000', '737382006', '739029001', '739030006', '739031005', '762642007', '762643002', '764868004', '767023003', '1156670009', '1156671008', '1156672001', '1156673006', '1156674000', '1156675004', '1156676003', '1156677007', '1156678002', '1156679005', '1156680008', '1156681007', '1156682000', '1156683005', '1156684004', '1157245009', '1179769002', '1179770001', '1186727009', '1193538001']}, 'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.patientPreparation', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/prepare-patient-prior-specimen-collection'}},
        'timeAspect' => {'type'=>'string', 'path'=>'SpecimenDefinition.timeAspect', 'min'=>0, 'max'=>1},
        'collection' => {'valid_codes'=>{'http://snomed.info/sct'=>['129316008', '129314006', '129300006', '129304002', '129323009', '73416001', '225113003', '70777001', '386089008', '278450005']}, 'type'=>'CodeableConcept', 'path'=>'SpecimenDefinition.collection', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/specimen-collection'}},
        'typeTested' => {'type'=>'SpecimenDefinition::TypeTested', 'path'=>'SpecimenDefinition.typeTested', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class TypeTested < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'TypeTested.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'TypeTested.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'TypeTested.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'isDerived' => {'type'=>'boolean', 'path'=>'TypeTested.isDerived', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0487'=>['ABS', '...', 'ACNE', 'ACNFLD', 'AIRS', 'ALL', 'AMN', 'AMP', 'ANGI', 'ARTC', 'ASERU', 'ASP', 'ATTE', 'AUTOA', 'AUTOC', 'AUTP', 'BBL', 'BCYST', 'BDY', 'BIFL', 'BITE', 'BLD', 'BLDA', 'BLDCO', 'BLDV', 'BLEB', 'BLIST', 'BOIL', 'BON', 'BOWL', 'BPH', 'BPU', 'BRN', 'BRSH', 'BRTH', 'BRUS', 'BUB', 'BULLA', 'BX', 'CALC', 'BONE', 'CARBU', 'CAT', 'CBITE', 'CDM', 'CLIPP', 'CNJT', 'CNL', 'COL', 'CONE', 'CSCR', 'CSERU', 'CSF', 'CSITE', 'CSMY', 'CST', 'CSVR', 'CTP', 'CUR', 'CVM', 'CVPS', 'CVPT', 'CYN', 'CYST', 'DBITE', 'DCS', 'DEC', 'DEION', 'DIA', 'DIAF', 'DISCHG', 'DIV', 'DRN', 'DRNG', 'DRNGP', 'DUFL', 'EARW', 'EBRUSH', 'EEYE', 'EFF', 'EFFUS', 'EFOD', 'EISO', 'ELT', 'ENVIR', 'EOS', 'EOTH', 'ESOI', 'ESOS', 'ETA', 'ETTP', 'ETTUB', 'EWHI', 'EXG', 'EXS', 'EXUDTE', 'FAW', 'FBLOOD', 'FGA', 'FIB', 'FIST', 'FLD', 'FLT', 'FLU', 'FLUID', 'FOLEY', 'FRS', 'FSCLP', 'FUR', 'GAS', 'GASA', 'GASAN', 'GASBR', 'GASD', 'GAST', 'GENL', 'GENV', 'GRAFT', 'GRAFTS', 'GRANU', 'GROSH', 'GSOL', 'GSPEC', 'GT', 'GTUBE', 'HAR', 'HBITE', 'HBLUD', 'HEMAQ', 'HEMO', 'HERNI', 'HEV', 'HIC', 'HYDC', 'IBITE', 'ICYST', 'IDC', 'IHG', 'ILEO', 'ILLEG', 'IMP', 'INCI', 'INFIL', 'INS', 'INTRD', 'ISLT', 'IT', 'IUD', 'IVCAT', 'IVFLD', 'IVTIP', 'JEJU', 'JNTFLD', 'JP', 'KELOI', 'KIDFLD', 'LAVG', 'LAVGG', 'LAVGP', 'LAVPG', 'LENS1', 'LENS2', 'LESN', 'LIQ', 'LIQO', 'LNA', 'LNV', 'LSAC', 'LYM', 'MAC', 'MAHUR', 'MAR', 'MASS', 'MBLD', 'MEC', 'MILK', 'MLK', 'MUCOS', 'MUCUS', 'NAIL', 'NASDR', 'NEDL', 'NEPH', 'NGASP', 'NGAST', 'NGS', 'NODUL', 'NSECR', 'ORH', 'ORL', 'OTH', 'PACEM', 'PAFL', 'PCFL', 'PDSIT', 'PDTS', 'PELVA', 'PENIL', 'PERIA', 'PILOC', 'PINS', 'PIS', 'PLAN', 'PLAS', 'PLB', 'PLC', 'PLEVS', 'PLR', 'PMN', 'PND', 'POL', 'POPGS', 'POPLG', 'POPLV', 'PORTA', 'PPP', 'PROST', 'PRP', 'PSC', 'PUNCT', 'PUS', 'PUSFR', 'PUST', 'QC3', 'RANDU', 'RBC', 'RBITE', 'RECT', 'RECTA', 'RENALC', 'RENC', 'RES', 'SAL', 'SCAR', 'SCLV', 'SCROA', 'SECRE', 'SER', 'SHU', 'SHUNF', 'SHUNT', 'SITE', 'SKBP', 'SKN', 'SMM', 'SMN', 'SNV', 'SPRM', 'SPRP', 'SPRPB', 'SPS', 'SPT', 'SPTC', 'SPTT', 'SPUT1', 'SPUTIN', 'SPUTSP', 'STER', 'STL', 'STONE', 'SUBMA', 'SUBMX', 'SUMP', 'SUP', 'SUTUR', 'SWGZ', 'SWT', 'TASP', 'TEAR', 'THRB', 'TISS', 'TISU', 'TLC', 'TRAC', 'TRANS', 'TSERU', 'TSTES', 'TTRA', 'TUBES', 'TUMOR', 'TZANC', 'UDENT', 'UMED', 'UR', 'URC', 'URINB', 'URINC', 'URINM', 'URINN', 'URINP', 'URNS', 'URT', 'USCOP', 'USPEC', 'USUB', 'VASTIP', 'VENT', 'VITF', 'VOM', 'WASH', 'WASI', 'WAT', 'WB', 'WBC', 'WEN', 'WICK', 'WND', 'WNDA', 'WNDD', 'WNDE', 'WORM', 'WRT', 'WWA', 'WWO', 'WWT']}, 'type'=>'CodeableConcept', 'path'=>'TypeTested.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0487'}},
          'preference' => {'valid_codes'=>{'http://hl7.org/fhir/specimen-contained-preference'=>['preferred', 'alternate']}, 'type'=>'code', 'path'=>'TypeTested.preference', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/specimen-contained-preference'}},
          'container' => {'type'=>'SpecimenDefinition::TypeTested::Container', 'path'=>'TypeTested.container', 'min'=>0, 'max'=>1},
          'requirement' => {'type'=>'markdown', 'path'=>'TypeTested.requirement', 'min'=>0, 'max'=>1},
          'retentionTime' => {'type'=>'Duration', 'path'=>'TypeTested.retentionTime', 'min'=>0, 'max'=>1},
          'singleUse' => {'type'=>'boolean', 'path'=>'TypeTested.singleUse', 'min'=>0, 'max'=>1},
          'rejectionCriterion' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/rejection-criteria'=>['hemolized', 'insufficient', 'broken', 'clotted', 'wrong-temperature']}, 'type'=>'CodeableConcept', 'path'=>'TypeTested.rejectionCriterion', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/rejection-criteria'}},
          'handling' => {'type'=>'SpecimenDefinition::TypeTested::Handling', 'path'=>'TypeTested.handling', 'min'=>0, 'max'=>Float::INFINITY},
          'testingDestination' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0074'=>['AU', 'BG', 'BLB', 'CG', 'CUS', 'CTH', 'CT', 'CH', 'CP', 'EC', 'EN', 'GE', 'HM', 'IMG', 'ICU', 'IMM', 'LAB', 'MB', 'MCB', 'MYC', 'NMS', 'NMR', 'NRS', 'OUS', 'OT', 'OTH', 'OSL', 'PAR', 'PHR', 'PAT', 'PT', 'PHY', 'PF', 'RAD', 'RX', 'RUS', 'RC', 'RT', 'SR', 'SP', 'TX', 'VUS', 'VR', 'URN', 'XRC']}, 'type'=>'CodeableConcept', 'path'=>'TypeTested.testingDestination', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/diagnostic-service-sections'}}
        }

        class Container < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'minimumVolume' => ['Quantity', 'string']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Container.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Container.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Container.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'material' => {'valid_codes'=>{'http://snomed.info/sct'=>['32039001', '61088005', '425620007']}, 'type'=>'CodeableConcept', 'path'=>'Container.material', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/container-material'}},
            'type' => {'valid_codes'=>{'http://snomed.info/sct'=>['706041008', '22566001', '463568005', '464784003', '465046006', '465091002', '465141003', '466421006', '466447002', '466623002', '466704003', '467030004', '467131002', '467182004', '467330006', '467431009', '467499008', '467647004', '467743009', '467989009', '468131000', '468200003', '468981005', '468999002', '469287008', '469322002', '469454007', '470547006', '470597005', '700855008', '700905004', '700906003', '700955007', '700956008', '700957004', '701394007', '701516009', '701720006', '702120003', '702223006', '702224000', '702232008', '702244006', '702256007', '702264001', '702268003', '702269006', '702275002', '702276001', '702277005', '702278000', '702279008', '702280006', '702281005', '702282003', '702283008', '702284002', '702285001', '702286000', '702287009', '702288004', '702289007', '702290003', '702292006', '702293001', '702294007', '702295008', '702296009', '702297000', '702298005', '702299002', '702300005', '702301009', '702302002', '702303007', '702304001', '702305000', '702306004', '702307008', '702308003', '702309006', '702310001', '706042001', '706044000', '706045004', '706046003', '706047007', '706048002', '706049005', '706050005', '706051009', '706052002', '706053007', '706054001', '706055000', '706056004', '706057008', '706058003', '706067003', '706071000', '712485008', '713951005', '714731008', '718301008', '718302001', '718590003', '719915009', '720367009', '733479001', '733713006', '738512001', '767382000', '767383005', '767384004', '767385003', '767387006', '767389009', '767390000', '767660003', '874799005', '878860002', '1141762001', '1141810006', '1141885009', '1202028007']}, 'type'=>'CodeableConcept', 'path'=>'Container.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/specimen-container-type'}},
            'cap' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/container-cap'=>['red', 'yellow', 'dark-yellow', 'grey', 'light-blue', 'black', 'green', 'light-green', 'lavender', 'brown', 'white', 'pink']}, 'type'=>'CodeableConcept', 'path'=>'Container.cap', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/container-cap'}},
            'description' => {'type'=>'markdown', 'path'=>'Container.description', 'min'=>0, 'max'=>1},
            'capacity' => {'type'=>'Quantity', 'path'=>'Container.capacity', 'min'=>0, 'max'=>1},
            'minimumVolumeQuantity' => {'type'=>'Quantity', 'path'=>'Container.minimumVolume[x]', 'min'=>0, 'max'=>1},
            'minimumVolumeString' => {'type'=>'string', 'path'=>'Container.minimumVolume[x]', 'min'=>0, 'max'=>1},
            'additive' => {'type'=>'SpecimenDefinition::TypeTested::Container::Additive', 'path'=>'Container.additive', 'min'=>0, 'max'=>Float::INFINITY},
            'preparation' => {'type'=>'markdown', 'path'=>'Container.preparation', 'min'=>0, 'max'=>1}
          }

          class Additive < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            MULTIPLE_TYPES = {
              'additive' => ['CodeableConcept', 'Reference']
            }
            METADATA = {
              'id' => {'type'=>'string', 'path'=>'Additive.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'Additive.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'Additive.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'additiveCodeableConcept' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0371'=>['F10', 'C32', 'C38', 'HCL6', 'ACDA', 'ACDB', 'ACET', 'AMIES', 'HEPA', 'BACTM', 'BOR', 'BOUIN', 'BF10', 'WEST', 'BSKM', 'CARS', 'CARY', 'CHLTM', 'CTAD', 'ENT', 'ENT+', 'JKM', 'KARN', 'LIA', 'HEPL', 'M4', 'M4RT', 'M5', 'MICHTM', 'MMDTM', 'HNO3', 'NONE', 'PAGE', 'PHENOL', 'KOX', 'EDTK', 'EDTK15', 'EDTK75', 'PVA', 'RLM', 'SST', 'SILICA', 'NAF', 'FL100', 'FL10', 'NAPS', 'HEPN', 'EDTN', 'SPS', 'STUTM', 'THROM', 'FDP', 'THYMOL', 'THYO', 'TOLU', 'URETM', 'VIRTM']}, 'type'=>'CodeableConcept', 'path'=>'Additive.additive[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0371'}},
              'additiveReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/SubstanceDefinition'], 'type'=>'Reference', 'path'=>'Additive.additive[x]', 'min'=>1, 'max'=>1}
            }

            attr_accessor :id                      # 0-1 string
            attr_accessor :extension               # 0-* [ Extension ]
            attr_accessor :modifierExtension       # 0-* [ Extension ]
            attr_accessor :additiveCodeableConcept # 1-1 CodeableConcept
            attr_accessor :additiveReference       # 1-1 Reference(SubstanceDefinition)
          end

          attr_accessor :id                    # 0-1 string
          attr_accessor :extension             # 0-* [ Extension ]
          attr_accessor :modifierExtension     # 0-* [ Extension ]
          attr_accessor :material              # 0-1 CodeableConcept
          attr_accessor :type                  # 0-1 CodeableConcept
          attr_accessor :cap                   # 0-1 CodeableConcept
          attr_accessor :description           # 0-1 markdown
          attr_accessor :capacity              # 0-1 Quantity
          attr_accessor :minimumVolumeQuantity # 0-1 Quantity
          attr_accessor :minimumVolumeString   # 0-1 string
          attr_accessor :additive              # 0-* [ SpecimenDefinition::TypeTested::Container::Additive ]
          attr_accessor :preparation           # 0-1 markdown
        end

        class Handling < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Handling.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Handling.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Handling.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'temperatureQualifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/handling-condition'=>['room', 'refrigerated', 'frozen']}, 'type'=>'CodeableConcept', 'path'=>'Handling.temperatureQualifier', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/handling-condition'}},
            'temperatureRange' => {'type'=>'Range', 'path'=>'Handling.temperatureRange', 'min'=>0, 'max'=>1},
            'maxDuration' => {'type'=>'Duration', 'path'=>'Handling.maxDuration', 'min'=>0, 'max'=>1},
            'instruction' => {'type'=>'markdown', 'path'=>'Handling.instruction', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                   # 0-1 string
          attr_accessor :extension            # 0-* [ Extension ]
          attr_accessor :modifierExtension    # 0-* [ Extension ]
          attr_accessor :temperatureQualifier # 0-1 CodeableConcept
          attr_accessor :temperatureRange     # 0-1 Range
          attr_accessor :maxDuration          # 0-1 Duration
          attr_accessor :instruction          # 0-1 markdown
        end

        attr_accessor :id                 # 0-1 string
        attr_accessor :extension          # 0-* [ Extension ]
        attr_accessor :modifierExtension  # 0-* [ Extension ]
        attr_accessor :isDerived          # 0-1 boolean
        attr_accessor :type               # 0-1 CodeableConcept
        attr_accessor :preference         # 1-1 code
        attr_accessor :container          # 0-1 SpecimenDefinition::TypeTested::Container
        attr_accessor :requirement        # 0-1 markdown
        attr_accessor :retentionTime      # 0-1 Duration
        attr_accessor :singleUse          # 0-1 boolean
        attr_accessor :rejectionCriterion # 0-* [ CodeableConcept ]
        attr_accessor :handling           # 0-* [ SpecimenDefinition::TypeTested::Handling ]
        attr_accessor :testingDestination # 0-* [ CodeableConcept ]
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
      attr_accessor :identifier             # 0-1 Identifier
      attr_accessor :version                # 0-1 string
      attr_accessor :versionAlgorithmString # 0-1 string
      attr_accessor :versionAlgorithmCoding # 0-1 Coding
      attr_accessor :name                   # 0-1 string
      attr_accessor :title                  # 0-1 string
      attr_accessor :derivedFromCanonical   # 0-* [ canonical ]
      attr_accessor :derivedFromUri         # 0-* [ uri ]
      attr_accessor :status                 # 1-1 code
      attr_accessor :experimental           # 0-1 boolean
      attr_accessor :subjectCodeableConcept # 0-1 CodeableConcept
      attr_accessor :subjectReference       # 0-1 Reference(Group)
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
      attr_accessor :typeCollected          # 0-1 CodeableConcept
      attr_accessor :patientPreparation     # 0-* [ CodeableConcept ]
      attr_accessor :timeAspect             # 0-1 string
      attr_accessor :collection             # 0-* [ CodeableConcept ]
      attr_accessor :typeTested             # 0-* [ SpecimenDefinition::TypeTested ]

      def resourceType
        'SpecimenDefinition'
      end
    end
  end
end