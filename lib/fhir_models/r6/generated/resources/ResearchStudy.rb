module FHIR
  module R6
    class ResearchStudy < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['classifier', 'condition', 'date', 'description', 'eligibility', 'focus-code', 'focus-reference', 'identifier', 'keyword', 'name', 'objective-description', 'objective-type', 'part-of', 'phase', 'progress-status-state-actual', 'progress-status-state-period', 'progress-status-state-period-actual', 'protocol', 'recruitment-actual', 'recruitment-target', 'region', 'site', 'status', 'study-design', 'title']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ResearchStudy.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ResearchStudy.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ResearchStudy.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ResearchStudy.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ResearchStudy.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ResearchStudy.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ResearchStudy.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ResearchStudy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'ResearchStudy.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'ResearchStudy.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'ResearchStudy.version', 'min'=>0, 'max'=>1},
        'name' => {'type'=>'string', 'path'=>'ResearchStudy.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'ResearchStudy.title', 'min'=>0, 'max'=>1},
        'label' => {'type'=>'ResearchStudy::Label', 'path'=>'ResearchStudy.label', 'min'=>0, 'max'=>Float::INFINITY},
        'protocol' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/PlanDefinition'], 'type'=>'Reference', 'path'=>'ResearchStudy.protocol', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ResearchStudy'], 'type'=>'Reference', 'path'=>'ResearchStudy.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedArtifact' => {'type'=>'RelatedArtifact', 'path'=>'ResearchStudy.relatedArtifact', 'min'=>0, 'max'=>Float::INFINITY},
        'date' => {'type'=>'dateTime', 'path'=>'ResearchStudy.date', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'ResearchStudy.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'primaryPurposeType' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-prim-purp-type'=>['treatment', 'prevention', 'diagnostic', 'supportive-care', 'screening', 'health-services-research', 'basic-science', 'device-feasibility']}, 'type'=>'CodeableConcept', 'path'=>'ResearchStudy.primaryPurposeType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-prim-purp-type'}},
        'phase' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-phase'=>['n-a', 'early-phase-1', 'phase-1', 'phase-1-phase-2', 'phase-2', 'phase-2-phase-3', 'phase-3', 'phase-4']}, 'type'=>'CodeableConcept', 'path'=>'ResearchStudy.phase', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-phase'}},
        'studyDesign' => {'valid_codes'=>{'http://hl7.org/fhir/study-design'=>['SEVCO:01001', 'SEVCO:01003', 'SEVCO:01006', 'SEVCO:01007', 'SEVCO:01008', 'SEVCO:01009', 'SEVCO:01005', 'SEVCO:01004', 'SEVCO:01029', 'SEVCO:01041', 'SEVCO:01038', 'SEVCO:01030', 'SEVCO:01031', 'SEVCO:01032', 'SEVCO:01033', 'SEVCO:01034', 'SEVCO:01035', 'SEVCO:01036', 'SEVCO:01002', 'SEVCO:01037', 'SEVCO:01010', 'SEVCO:01011', 'SEVCO:01012', 'SEVCO:01024', 'SEVCO:01025', 'SEVCO:01013', 'SEVCO:01014', 'SEVCO:01020', 'SEVCO:01021', 'SEVCO:01015', 'SEVCO:01023', 'SEVCO:01016', 'SEVCO:01017', 'SEVCO:01022', 'SEVCO:01044', 'SEVCO:01027', 'SEVCO:01028', 'SEVCO:01018', 'SEVCO:01019', 'SEVCO:01045', 'SEVCO:01026', 'SEVCO:01039', 'SEVCO:01050', 'SEVCO:01040', 'SEVCO:01048', 'SEVCO:01046', 'SEVCO:01049', 'SEVCO:01042', 'SEVCO:01051', 'SEVCO:01086', 'SEVCO:01087', 'SEVCO:01060', 'SEVCO:01061', 'SEVCO:01062', 'SEVCO:01063', 'SEVCO:01064', 'SEVCO:01043', 'SEVCO:01052', 'SEVCO:01053', 'SEVCO:01054', 'SEVCO:01085', 'SEVCO:01089', 'SEVCO:01096', 'SEVCO:01097', 'SEVCO:01098', 'SEVCO:01088', 'SEVCO:01091', 'SEVCO:01090', 'SEVCO:01092', 'SEVCO:01093', 'SEVCO:01094', 'SEVCO:01095']}, 'type'=>'CodeableConcept', 'path'=>'ResearchStudy.studyDesign', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/study-design'}},
        'focus' => {'type'=>'CodeableReference', 'path'=>'ResearchStudy.focus', 'min'=>0, 'max'=>Float::INFINITY},
        'condition' => {'valid_codes'=>{'http://snomed.info/sct'=>['404684003', '109006', '122003', '127009', '129007', '134006', '140004', '144008', '150003', '151004', '162004', '165002', '168000', '171008', '172001', '175004', '177007', '179005', '181007', '183005', '184004', '188001', '192008', '193003', '198007', '199004', '216004', '219006', '222008', '223003', '228007', '241006', '242004', '253005', '257006', '264008', '276008', '279001', '281004', '282006', '290006', '292003', '297009', '299007', '303002', '308006', '310008', '313005', '317006', '320003', '324007', '330007', '335002', '341009', '349006', '355001', '357009', '359007', '360002', '364006', '366008', '368009', '369001', '378007', '382009', '383004', '385006', '387003', '398002', '407000', '408005', '409002', '426008', '431005', '437009', '440009', '442001', '443006', '447007', '450005', '452002', '460001', '467003', '470004', '479003', '486006', '488007', '490008', '496002', '504009', '517007', '518002', '520004', '527001', '536002', '539009', '547009', '548004', '554003', '555002', '563001', '568005', '586008', '590005', '596004', '599006', '600009', '607007', '610000', '613003', '615005', '616006', '626004', '631002', '640003', '643001', '646009', '649002', '651003', '652005', '655007', '658009', '664002', '675003', '701003', '703000', '714002', '715001', '718004', '734001', '736004', '750009', '755004', '756003', '758002', '775008', '776009', '781000', '787001', '788006', '792004', '799008', '801006', '805002', '811004', '813001', '815008', '816009', '818005', '825003', '827006', '832007', '834008', '841002', '842009', '843004', '844005', '845006', '849000', '857002', '862001', '865004', '871005', '874002', '875001', '888003', '890002', '899001', '903008', '904002', '928000', '931004', '932006', '934007', '943003', '961007', '962000', '964004', '965003', '975000', '978003', '981008', '984000', '987007', '991002', '998008', '1003002', '1020003', '1023001', '1027000', '1031006', '1033009', '1034003', '1038000', '1045000', '1046004', '1051005', '1055001', '1059007', '1070000', '1073003', '1077002', '1079004', '1085006', '1089000', '1102005', '1107004', '1108009', '1111005', '1112003', '1116000', '1124005', '1125006', '1126007', '1131009', '1134001', '1135000', '1139006', '1140008', '1141007', '1145003', '1150009', '1151008', '1152001', '1155004', '1168007', '1184008', '1194003', '1196001', '1197005', '1201005', '1207009', '1208004', '1212005', '1214006', '1232006', '1239002', '1240000', '1259003', '1261007', '1264004', '1271009', '1280009', '1282001', '1284000', '1286003', '1287007', '1297003', '1308001', '1310004', '1318006', '1323006', '1332008', '1335005', '1343000', '1345007', '1351002', '1356007', '1361009', '1367008', '1370007', '1372004', '1376001', '1378000', '1380006', '1383008', '1384002', '1386000', '1387009', '1388004', '1393001', '1395008', '1402001', '1412008', '1415005', '1418007', '1426004', '1447000', '1469007', '1474004', '1475003', '1478001', '1479009', '1482004', '1486001', '1488000', '1489008', '1492007', '1493002', '1499003', '1512006', '1515008', '1518005', '1519002', '1521007', '1525003', '1531000', '1532007', '1534008', '1538006', '1539003', '1542009', '1544005', '1551001', '1556006', '1563006', '1567007', '1588003', '1592005', '1593000', '1606009', '1608005', '1639007', '1647007', '1648002', '1654001', '1657008', '1658003', '1663004', '1667003', '1670004', '1671000', '1674008', '1679003', '1682008', '1685005', '1686006', '1694004', '1698001', '1703007', '1705000', '1714005', '1717003', '1723008', '1724002', '1734006', '1735007', '1739001', '1742007', '1744008', '1748006', '1755008', '1761006', '1763009', '1767005', '1769008', '1771008', '1776003', '1777007', '1778002', '1779005', '1794009', '1816003', '1821000', '1822007', '1824008', '1826005', '1828006', '1833005', '1835003', '1837006', '1845001', '1847009', '1852004', '1855002', '1856001', '1857005', '1860003', '1865008', '1869002', '1892002', '1896004', '1897008', '1899006', '1903004', '1922008', '1926006', '1939005', '1943009', '1953005', '1955003', '1959009', '1963002', '1965009', '1967001', '1973000', '1977004', '1979001', '1980003', '1981004', '2004005', '2012002', '2028007', '2032001', '2036003', '2040007', '2041006', '2043009', '2055003', '2061000', '2065009', '2066005', '2070002', '2073000', '2087000', '2089002', '2091005', '2094002', '2102007', '2107001', '2109003', '2114004', '2116002', '2120003', '2121004', '2128005', '2129002', '2132004', '2134003', '2136001', '2138000', '2145000', '2149006', '2158004', '2167004', '2169001', '2170000', '2176006', '2177002', '2186007', '2198002', '2202000', '2204004', '2213002', '2216005', '2219003', '2224000', '2228002', '2229005', '2231001', '2237002', '2239004', '2241003', '2243000', '2245007', '2251002', '2256007', '2261009', '2268003', '2284002', '2295008', '2296009', '2301009', '2303007', '2304001', '2307008', '2308003', '2312009', '2314005', '2326000', '2339001', '2341000', '2351004', '2355008', '2359002', '2365002', '2366001', '2367005', '2374000', '2385003', '2388001', '2390000', '2391001', '2396006', '2398007', '2403008', '2415007', '2418009', '2419001', '2420007', '2432006', '2435008', '2437000', '2438005', '2439002', '2443003', '2452007', '2463005', '2469009', '2471009', '2472002', '2473007', '2477008', '2492009', '2495006', '2496007', '2506003', '2513003', '2518007', '2521009', '2523007', '2526004', '2528003', '2532009', '2534005', '2538008', '2541004', '2554006', '2556008', '2560006', '2562003', '2576002', '2581006', '2582004', '2583009', '2584003', '2585002', '2589008', '2591000', '2593002', '2602008', '2606006', '2615004', '2618002', '2622007', '2625009', '2634004', '2638001', '2640006', '2651006', '2655002', '2657005', '2663001', '2683000', '2689001', '2694001', '2704003', '2707005', '2713001', '2724004', '2725003', '2733002', '2736005', '2740001', '2749000', '2751001', '2761008', '2764000', '2770006', '2772003', '2775001', '2776000', '2782002', '2783007', '2805007', '2806008', '2807004', '2808009', '2815001', '2816000', '2818004', '2819007', '2825006', '2828008', '2829000', '2835000', '2836004', '2838003', '2850009', '2853006', '2856003', '2858002', '2884008', '2893009', '2897005', '2899008', '2901004', '2902006', '2904007', '2910007', '2912004', '2917005', '2918000', '2919008', '2929001', '2935001', '2946003', '2951009', '2955000', '2965006', '2967003', '2978006', '2981001', '2989004', '2990008', '2992000', '2994004', '2999009', '3002002', '3004001', '3006004', '3009006', '3013004', '3014005', '3018008', '3019000', '3021005', '3023008', '3032005', '3033000', '3038009', '3044008', '3053001', '3059002', '3067005', '3071008', '3072001', '3073006', '3089009', '3094009', '3095005', '3097002', '3098007', '3109008', '3110003', '3119002', '3129009', '3135009', '3140001', '3144005', '3158007', '3160009', '3163006', '3168002', '3185000', '3199001', '3200003', '3208005', '3214003', '3217005', '3218000', '3219008', '3228009', '3229001', '3238004', '3239007', '3253007', '3254001', '3259006', '3261002', '3263004', '3272007', '3274008', '3275009', '3276005', '3282008', '3283003', '3286006', '3289004', '3291007', '3298001', '3303004', '3304005', '3305006', '3308008', '3310005', '3321001', '3323003', '3327002', '3331008', '3344003', '3345002', '3358001', '3368006', '3376008', '3381004', '3387000', '3391005', '3398004', '3415004', '3419005', '3421000', '3424008', '3426005', '3427001', '3434004', '3439009', '3441005', '3446000', '3449007', '3456001', '3458000', '3461004', '3464007', '3468005', '3469002', '3472009', '3474005', '3480002', '3482005', '3483000', '3487004', '3500002', '3502005', '3506008', '3507004', '3511005', '3514002', '3519007', '3528008', '3529000', '3530005', '3531009', '3533007', '3539006', '3542000', '3544004', '3545003', '3548001', '3549009', '3558002', '3560000', '3570003', '3571004', '3577000', '3585009', '3586005', '3589003', '3590007', '3591006', '3598000', '3611003', '3633001', '3639002', '3640000', '3641001', '3642008', '3644009', '3649004', '3650004', '3652007', '3657001', '3662000', '3677008', '3680009', '3681008', '3696007', '3699000', '3704008', '3705009', '3716002', '3720003', '3723001', '3733009', '3738000', '3744001', '3747008', '3750006', '3751005', '3752003', '3754002', '3755001', '3756000', '3759007', '3760002', '3762005', '3763000', '3783004', '3797007', '3798002', '3815005', '3820005', '3827008', '3830001', '3841004', '3845008', '3855007', '3885002', '3886001', '3899003', '3900008', '3902000', '3908001', '3909009', '3913002', '3914008', '3928002', '3939004', '3944006', '3947004', '3950001', '3951002', '3972004', '3975002', '3978000', '3987009', '3993001', '3999002', '4003003', '4006006', '4009004', '4016003', '4017007', '4022007', '4026005', '4030008', '4038001', '4039009', '4040006', '4041005', '4046000', '4062006', '4063001', '4069002', '4070001', '4075006', '4082005', '4088009', '4089001', '4103001', '4107000', '4113009', '4120002', '4124006', '4127004', '4129001', '4135001', '4136000', '4142001', '4160001', '4168008', '4170004', '4174008', '4175009', '4178006', '4181001', '4183003', '4184009', '4195003', '4197006', '4199009', '4208000', '4210003', '4223005', '4224004', '4225003', '4232007', '4237001', '4240001', '4241002', '4242009', '4248008', '4249000', '4260009', '4262001', '4264000', '4269005', '4273008', '4275001', '4283007', '4287008', '4294006', '4300009', '4301008', '4306003', '4307007', '4313003', '4316006', '4320005', '4324001', '4325000', '4338008', '4340003', '4349002', '4354006', '4356008', '4359001', '4364002', '4367009', '4373005', '4374004', '4381006', '4386001', '4390004', '4397001', '4399003', '4403007', '4406004', '4409006', '4410001', '4412009', '4414005', '4416007', '4418008', '4426000', '4434006', '4439001', '4441000', '4445009', '4448006', '4461006', '4463009', '4464003', '4465002', '4468000', '4470009', '4473006', '4477007', '4478002', '4481007', '4483005', '4494009', '4495005', '4499004', '4501007', '4506002', '4510004', '4512007', '4519003', '4522001', '4523006', '4526003', '4529005', '4530000', '4547004', '4550001', '4554005', '4556007', '4557003', '4559000', '4565000', '4568003', '4575002', '4586000', '4592006', '4598005', '4602007', '4633009', '4637005', '4639008', '4641009', '4645000', '4654002', '4659007', '4661003', '4665007', '4667004', '4669001', '4673003', '4676006', '4688008', '4690009', '4702003', '4708004', '4711003', '4721006', '4724003', '4733001', '4740000', '4749004', '4750004', '4754008', '4760008', '4763005', '4771009', '4776004', '4783006', '4787007', '4788002', '4800001', '4805006', '4806007', '4817008', '4819006', '4821001', '4834000', '4835004', '4839005', '4846001', '4851007', '4853005', '4854004', '4855003', '4859009', '4860004', '4863002', '4873000', '4874006', '4886009', '4887000', '4896000', '4900002', '4907004', '4915001', '4920001', '4921002', '4922009', '4926007', '4927003', '4932002']}, 'type'=>'CodeableConcept', 'path'=>'ResearchStudy.condition', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/condition-code'}},
        'keyword' => {'type'=>'CodeableConcept', 'path'=>'ResearchStudy.keyword', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example'}},
        'region' => {'valid_codes'=>{'urn:iso:std:iso:3166'=>['AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ABW', 'AFG', 'AGO', 'AIA', 'ALA', 'ALB', 'AND', 'ARE', 'ARG', 'ARM', 'ASM', 'ATA', 'ATF', 'ATG', 'AUS', 'AUT', 'AZE', 'BDI', 'BEL', 'BEN', 'BES', 'BFA', 'BGD', 'BGR', 'BHR', 'BHS', 'BIH', 'BLM', 'BLR', 'BLZ', 'BMU', 'BOL', 'BRA', 'BRB', 'BRN', 'BTN', 'BVT', 'BWA', 'CAF', 'CAN', 'CCK', 'CHE', 'CHL', 'CHN', 'CIV', 'CMR', 'COD', 'COG', 'COK', 'COL', 'COM', 'CPV', 'CRI', 'CUB', 'CUW', 'CXR', 'CYM', 'CYP', 'CZE', 'DEU', 'DJI', 'DMA', 'DNK', 'DOM', 'DZA', 'ECU', 'EGY', 'ERI', 'ESH', 'ESP', 'EST', 'ETH', 'FIN', 'FJI', 'FLK', 'FRA', 'FRO', 'FSM', 'GAB', 'GBR', 'GEO', 'GGY', 'GHA', 'GIB', 'GIN', 'GLP', 'GMB', 'GNB', 'GNQ', 'GRC', 'GRD', 'GRL', 'GTM', 'GUF', 'GUM', 'GUY', 'HKG', 'HMD', 'HND', 'HRV', 'HTI', 'HUN', 'IDN', 'IMN', 'IND', 'IOT', 'IRL', 'IRN', 'IRQ', 'ISL', 'ISR', 'ITA', 'JAM', 'JEY', 'JOR', 'JPN', 'KAZ', 'KEN', 'KGZ', 'KHM', 'KIR', 'KNA', 'KOR', 'KWT', 'LAO', 'LBN', 'LBR', 'LBY', 'LCA', 'LIE', 'LKA', 'LSO', 'LTU', 'LUX', 'LVA', 'MAC', 'MAF', 'MAR', 'MCO', 'MDA', 'MDG', 'MDV', 'MEX', 'MHL', 'MKD', 'MLI', 'MLT', 'MMR', 'MNE', 'MNG', 'MNP', 'MOZ', 'MRT', 'MSR', 'MTQ', 'MUS', 'MWI', 'MYS', 'MYT', 'NAM', 'NCL', 'NER', 'NFK', 'NGA', 'NIC', 'NIU', 'NLD', 'NOR', 'NPL', 'NRU', 'NZL', 'OMN', 'PAK', 'PAN', 'PCN', 'PER', 'PHL', 'PLW', 'PNG', 'POL', 'PRI', 'PRK', 'PRT', 'PRY', 'PSE', 'PYF', 'QAT', 'REU', 'ROU', 'RUS', 'RWA', 'SAU', 'SDN', 'SEN', 'SGP', 'SGS', 'SHN', 'SJM', 'SLB', 'SLE', 'SLV', 'SMR', 'SOM', 'SPM', 'SRB', 'SSD', 'STP', 'SUR', 'SVK', 'SVN', 'SWE', 'SWZ', 'SXM', 'SYC', 'SYR', 'TCA', 'TCD', 'TGO', 'THA', 'TJK', 'TKL', 'TKM', 'TLS', 'TON', 'TTO', 'TUN', 'TUR', 'TUV', 'TWN', 'TZA', 'UGA', 'UKR', 'UMI', 'URY', 'USA', 'UZB', 'VAT', 'VCT', 'VEN', 'VGB', 'VIR', 'VNM', 'VUT', 'WLF', 'WSM', 'YEM', 'ZAF', 'ZMB', 'ZWE', '004', '008', '010', '012', '016', '020', '024', '028', '031', '032', '036', '040', '044', '048', '050', '051', '052', '056', '060', '064', '068', '070', '072', '074', '076', '084', '086', '090', '092', '096', '100', '104', '108', '112', '116', '120', '124', '132', '136', '140', '144', '148', '152', '156', '158', '162', '166', '170', '174', '175', '178', '180', '184', '188', '191', '192', '196', '203', '204', '208', '212', '214', '218', '222', '226', '231', '232', '233', '234', '238', '239', '242', '246', '248', '250', '254', '258', '260', '262', '266', '268', '270', '275', '276', '288', '292', '296', '300', '304', '308', '312', '316', '320', '324', '328', '332', '334', '336', '340', '344', '348', '352', '356', '360', '364', '368', '372', '376', '380', '384', '388', '392', '398', '400', '404', '408', '410', '414', '417', '418', '422', '426', '428', '430', '434', '438', '440', '442', '446', '450', '454', '458', '462', '466', '470', '474', '478', '480', '484', '492', '496', '498', '499', '500', '504', '508', '512', '516', '520', '524', '528', '531', '533', '534', '535', '540', '548', '554', '558', '562', '566', '570', '574', '578', '580', '581', '583', '584', '585', '586', '591', '598', '600', '604', '608', '612', '616', '620', '624', '626', '630', '634', '638', '642', '643', '646', '652', '654', '659', '660', '662', '663', '666', '670', '674', '678', '682', '686', '688', '690', '694', '702', '703', '704', '705', '706', '710', '716', '724', '728', '729', '732', '740', '744', '748', '752', '756', '760', '762', '764', '768', '772', '776', '780', '784', '788', '792', '795', '796', '798', '800', '804', '807', '818', '826', '831', '832', '833', '834', '840', '850', '854', '858', '860', '862', '876', '882', '887', '894'], 'urn:iso:std:iso:3166:-2'=>['AF-BAL', 'AF-BAM', 'AF-BDG', 'AF-BDS', 'AF-BGL', 'AF-DAY', 'AF-FRA', 'AF-FYB', 'AF-GHA', 'AF-GHO', 'AF-HEL', 'AF-HER', 'AF-JOW', 'AF-KAB', 'AF-KAN', 'AF-KAP', 'AF-KDZ', 'AF-KHO', 'AF-KNR', 'AF-LAG', 'AF-LOG', 'AF-NAN', 'AF-NIM', 'AF-NUR', 'AF-PAN', 'AF-PAR', 'AF-PIA', 'AF-PKA', 'AF-SAM', 'AF-SAR', 'AF-TAK', 'AF-URU', 'AF-WAR', 'AF-ZAB', 'AX-AX', 'AL-01', 'AL-02', 'AL-03', 'AL-04', 'AL-05', 'AL-06', 'AL-07', 'AL-08', 'AL-09', 'AL-10', 'AL-11', 'AL-12', 'AL-BR', 'AL-BU', 'AL-DI', 'AL-DL', 'AL-DR', 'AL-DV', 'AL-EL', 'AL-ER', 'AL-FR', 'AL-GJ', 'AL-GR', 'AL-HA', 'AL-KA', 'AL-KB', 'AL-KC', 'AL-KO', 'AL-KR', 'AL-KU', 'AL-LB', 'AL-LE', 'AL-LU', 'AL-MK', 'AL-MM', 'AL-MR', 'AL-MT', 'AL-PG', 'AL-PQ', 'AL-PR', 'AL-PU', 'AL-SH', 'AL-SK', 'AL-SR', 'AL-TE', 'AL-TP', 'AL-TR', 'AL-VL', 'DZ-01', 'DZ-02', 'DZ-03', 'DZ-04', 'DZ-05', 'DZ-06', 'DZ-07', 'DZ-08', 'DZ-09', 'DZ-10', 'DZ-11', 'DZ-12', 'DZ-13', 'DZ-14', 'DZ-15', 'DZ-16', 'DZ-17', 'DZ-18', 'DZ-19', 'DZ-20', 'DZ-21', 'DZ-22', 'DZ-23', 'DZ-24', 'DZ-25', 'DZ-26', 'DZ-27', 'DZ-28', 'DZ-29', 'DZ-30', 'DZ-31', 'DZ-32', 'DZ-33', 'DZ-34', 'DZ-35', 'DZ-36', 'DZ-37', 'DZ-38', 'DZ-39', 'DZ-40', 'DZ-41', 'DZ-42', 'DZ-43', 'DZ-44', 'DZ-45', 'DZ-46', 'DZ-47', 'DZ-48', 'AS-AS', 'AD-02', 'AD-03', 'AD-04', 'AD-05', 'AD-06', 'AD-07', 'AD-08', 'AO-BGO', 'AO-BGU', 'AO-BIE', 'AO-CAB', 'AO-CCU', 'AO-CNN', 'AO-CNO', 'AO-CUS', 'AO-HUA', 'AO-HUI', 'AO-LNO', 'AO-LSU', 'AO-LUA', 'AO-MAL', 'AO-MOX', 'AO-NAM', 'AO-UIG', 'AO-ZAI', 'AI-AI', 'AQ-AQ', 'AG-03', 'AG-04', 'AG-05', 'AG-06', 'AG-07', 'AG-08', 'AG-10', 'AG-11', 'AR-A', 'AR-B', 'AR-C', 'AR-D', 'AR-E', 'AR-F', 'AR-G', 'AR-H', 'AR-J', 'AR-K', 'AR-L', 'AR-M', 'AR-N', 'AR-P', 'AR-Q', 'AR-R', 'AR-S', 'AR-T', 'AR-U', 'AR-V', 'AR-W', 'AR-X', 'AR-Y', 'AR-Z', 'AM-AG', 'AM-AR', 'AM-AV', 'AM-ER', 'AM-GR', 'AM-KT', 'AM-LO', 'AM-SH', 'AM-SU', 'AM-TV', 'AM-VD', 'AW-AW', 'AU-ACT', 'AU-NSW', 'AU-NT', 'AU-QLD', 'AU-SA', 'AU-TAS', 'AU-VIC', 'AU-WA', 'AT-1', 'AT-2', 'AT-3', 'AT-4', 'AT-5', 'AT-6', 'AT-7', 'AT-8', 'AT-9', 'AZ-ABS', 'AZ-AGA', 'AZ-AGC', 'AZ-AGM', 'AZ-AGS', 'AZ-AGU', 'AZ-AST', 'AZ-BA', 'AZ-BAB', 'AZ-BAL', 'AZ-BAR', 'AZ-BEY', 'AZ-BIL', 'AZ-CAB', 'AZ-CAL', 'AZ-CUL', 'AZ-DAS', 'AZ-FUZ', 'AZ-GAD', 'AZ-GA', 'AZ-GOR', 'AZ-GOY', 'AZ-GYG', 'AZ-HAC', 'AZ-IMI', 'AZ-ISM', 'AZ-KAL', 'AZ-KAN', 'AZ-KUR', 'AZ-LAC', 'AZ-LA', 'AZ-LAN', 'AZ-LER']}, 'type'=>'CodeableConcept', 'path'=>'ResearchStudy.region', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/jurisdiction'}},
        'descriptionSummary' => {'type'=>'markdown', 'path'=>'ResearchStudy.descriptionSummary', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'markdown', 'path'=>'ResearchStudy.description', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'ResearchStudy.period', 'min'=>0, 'max'=>1},
        'site' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/ResearchStudy', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ResearchStudy.site', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'ResearchStudy.note', 'min'=>0, 'max'=>Float::INFINITY},
        'classifier' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-classifiers'=>['fda-regulated-drug', 'fda-regulated-device', 'mpg-paragraph-23b', 'irb-exempt']}, 'type'=>'CodeableConcept', 'path'=>'ResearchStudy.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-classifiers'}},
        'associatedParty' => {'type'=>'ResearchStudy::AssociatedParty', 'path'=>'ResearchStudy.associatedParty', 'min'=>0, 'max'=>Float::INFINITY},
        'progressStatus' => {'type'=>'ResearchStudy::ProgressStatus', 'path'=>'ResearchStudy.progressStatus', 'min'=>0, 'max'=>Float::INFINITY},
        'whyStopped' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-reason-stopped'=>['accrual-goal-met', 'closed-due-to-toxicity', 'closed-due-to-lack-of-study-progress', 'temporarily-closed-per-study-design']}, 'type'=>'CodeableConcept', 'path'=>'ResearchStudy.whyStopped', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-reason-stopped'}},
        'recruitment' => {'type'=>'ResearchStudy::Recruitment', 'path'=>'ResearchStudy.recruitment', 'min'=>0, 'max'=>1},
        'comparisonGroup' => {'type'=>'ResearchStudy::ComparisonGroup', 'path'=>'ResearchStudy.comparisonGroup', 'min'=>0, 'max'=>Float::INFINITY},
        'objective' => {'type'=>'ResearchStudy::Objective', 'path'=>'ResearchStudy.objective', 'min'=>0, 'max'=>Float::INFINITY},
        'outcomeMeasure' => {'type'=>'ResearchStudy::OutcomeMeasure', 'path'=>'ResearchStudy.outcomeMeasure', 'min'=>0, 'max'=>Float::INFINITY},
        'result' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Citation', 'http://hl7.org/fhir/StructureDefinition/Composition', 'http://hl7.org/fhir/StructureDefinition/DiagnosticReport'], 'type'=>'Reference', 'path'=>'ResearchStudy.result', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Label < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Label.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Label.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Label.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/title-type'=>['primary', 'official', 'scientific', 'plain-language', 'subtitle', 'short-title', 'acronym', 'earlier-title', 'language', 'autotranslated', 'human-use', 'machine-use', 'duplicate-uid']}, 'type'=>'CodeableConcept', 'path'=>'Label.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/title-type'}},
          'value' => {'type'=>'string', 'path'=>'Label.value', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :value             # 0-1 string
      end

      class AssociatedParty < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'AssociatedParty.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'AssociatedParty.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'AssociatedParty.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'AssociatedParty.name', 'min'=>0, 'max'=>1},
          'role' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-party-role'=>['sponsor', 'lead-sponsor', 'sponsor-investigator', 'primary-investigator', 'collaborator', 'funding-source', 'general-contact', 'recruitment-contact', 'sub-investigator', 'study-director', 'study-chair', 'irb']}, 'type'=>'CodeableConcept', 'path'=>'AssociatedParty.role', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-party-role'}},
          'period' => {'type'=>'Period', 'path'=>'AssociatedParty.period', 'min'=>0, 'max'=>Float::INFINITY},
          'classifier' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-party-organization-type'=>['nih', 'fda', 'government', 'nonprofit', 'academic', 'industry']}, 'type'=>'CodeableConcept', 'path'=>'AssociatedParty.classifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-party-organization-type'}},
          'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'AssociatedParty.party', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 0-1 string
        attr_accessor :role              # 1-1 CodeableConcept
        attr_accessor :period            # 0-* [ Period ]
        attr_accessor :classifier        # 0-* [ CodeableConcept ]
        attr_accessor :party             # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      end

      class ProgressStatus < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ProgressStatus.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ProgressStatus.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ProgressStatus.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'state' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-status'=>['overall-study', 'active', 'active-but-not-recruiting', 'administratively-completed', 'approved', 'closed-to-accrual', 'closed-to-accrual-and-intervention', 'completed', 'disapproved', 'enrolling-by-invitation', 'in-review', 'not-yet-recruiting', 'recruiting', 'temporarily-closed-to-accrual', 'temporarily-closed-to-accrual-and-intervention', 'terminated', 'withdrawn']}, 'type'=>'CodeableConcept', 'path'=>'ProgressStatus.state', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-status'}},
          'actual' => {'type'=>'boolean', 'path'=>'ProgressStatus.actual', 'min'=>0, 'max'=>1},
          'period' => {'type'=>'Period', 'path'=>'ProgressStatus.period', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :state             # 1-1 CodeableConcept
        attr_accessor :actual            # 0-1 boolean
        attr_accessor :period            # 0-1 Period
      end

      class Recruitment < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Recruitment.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Recruitment.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Recruitment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'targetNumber' => {'type'=>'unsignedInt', 'path'=>'Recruitment.targetNumber', 'min'=>0, 'max'=>1},
          'actualNumber' => {'type'=>'unsignedInt', 'path'=>'Recruitment.actualNumber', 'min'=>0, 'max'=>1},
          'eligibility' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'Recruitment.eligibility', 'min'=>0, 'max'=>1},
          'actualGroup' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Recruitment.actualGroup', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :targetNumber      # 0-1 unsignedInt
        attr_accessor :actualNumber      # 0-1 unsignedInt
        attr_accessor :eligibility       # 0-1 Reference(Group|EvidenceVariable)
        attr_accessor :actualGroup       # 0-1 Reference(Group)
      end

      class ComparisonGroup < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ComparisonGroup.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ComparisonGroup.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ComparisonGroup.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'linkId' => {'type'=>'id', 'path'=>'ComparisonGroup.linkId', 'min'=>0, 'max'=>1},
          'name' => {'type'=>'string', 'path'=>'ComparisonGroup.name', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-arm-type'=>['active-comparator', 'placebo-comparator', 'sham-comparator', 'no-intervention', 'experimental', 'other-arm-type']}, 'type'=>'CodeableConcept', 'path'=>'ComparisonGroup.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-arm-type'}},
          'description' => {'type'=>'markdown', 'path'=>'ComparisonGroup.description', 'min'=>0, 'max'=>1},
          'intendedExposure' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'ComparisonGroup.intendedExposure', 'min'=>0, 'max'=>Float::INFINITY},
          'observedGroup' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ComparisonGroup.observedGroup', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :linkId            # 0-1 id
        attr_accessor :name              # 1-1 string
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :description       # 0-1 markdown
        attr_accessor :intendedExposure  # 0-* [ Reference(EvidenceVariable) ]
        attr_accessor :observedGroup     # 0-1 Reference(Group)
      end

      class Objective < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Objective.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Objective.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Objective.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Objective.name', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-objective-type'=>['primary', 'secondary', 'exploratory']}, 'type'=>'CodeableConcept', 'path'=>'Objective.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-objective-type'}},
          'description' => {'type'=>'markdown', 'path'=>'Objective.description', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 0-1 string
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :description       # 0-1 markdown
      end

      class OutcomeMeasure < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'OutcomeMeasure.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'OutcomeMeasure.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'OutcomeMeasure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'OutcomeMeasure.name', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/research-study-objective-type'=>['primary', 'secondary', 'exploratory']}, 'type'=>'CodeableConcept', 'path'=>'OutcomeMeasure.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/research-study-objective-type'}},
          'description' => {'type'=>'markdown', 'path'=>'OutcomeMeasure.description', 'min'=>0, 'max'=>1},
          'reference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EvidenceVariable'], 'type'=>'Reference', 'path'=>'OutcomeMeasure.reference', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 0-1 string
        attr_accessor :type              # 0-* [ CodeableConcept ]
        attr_accessor :description       # 0-1 markdown
        attr_accessor :reference         # 0-1 Reference(EvidenceVariable)
      end

      attr_accessor :id                 # 0-1 id
      attr_accessor :meta               # 0-1 Meta
      attr_accessor :implicitRules      # 0-1 uri
      attr_accessor :language           # 0-1 code
      attr_accessor :text               # 0-1 Narrative
      attr_accessor :contained          # 0-* [ Resource ]
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :url                # 0-1 uri
      attr_accessor :identifier         # 0-* [ Identifier ]
      attr_accessor :version            # 0-1 string
      attr_accessor :name               # 0-1 string
      attr_accessor :title              # 0-1 string
      attr_accessor :label              # 0-* [ ResearchStudy::Label ]
      attr_accessor :protocol           # 0-* [ Reference(PlanDefinition) ]
      attr_accessor :partOf             # 0-* [ Reference(ResearchStudy) ]
      attr_accessor :relatedArtifact    # 0-* [ RelatedArtifact ]
      attr_accessor :date               # 0-1 dateTime
      attr_accessor :status             # 1-1 code
      attr_accessor :primaryPurposeType # 0-1 CodeableConcept
      attr_accessor :phase              # 0-1 CodeableConcept
      attr_accessor :studyDesign        # 0-* [ CodeableConcept ]
      attr_accessor :focus              # 0-* [ CodeableReference ]
      attr_accessor :condition          # 0-* [ CodeableConcept ]
      attr_accessor :keyword            # 0-* [ CodeableConcept ]
      attr_accessor :region             # 0-* [ CodeableConcept ]
      attr_accessor :descriptionSummary # 0-1 markdown
      attr_accessor :description        # 0-1 markdown
      attr_accessor :period             # 0-1 Period
      attr_accessor :site               # 0-* [ Reference(Location|ResearchStudy|Organization) ]
      attr_accessor :note               # 0-* [ Annotation ]
      attr_accessor :classifier         # 0-* [ CodeableConcept ]
      attr_accessor :associatedParty    # 0-* [ ResearchStudy::AssociatedParty ]
      attr_accessor :progressStatus     # 0-* [ ResearchStudy::ProgressStatus ]
      attr_accessor :whyStopped         # 0-1 CodeableConcept
      attr_accessor :recruitment        # 0-1 ResearchStudy::Recruitment
      attr_accessor :comparisonGroup    # 0-* [ ResearchStudy::ComparisonGroup ]
      attr_accessor :objective          # 0-* [ ResearchStudy::Objective ]
      attr_accessor :outcomeMeasure     # 0-* [ ResearchStudy::OutcomeMeasure ]
      attr_accessor :result             # 0-* [ Reference(Citation|Composition|DiagnosticReport) ]

      def resourceType
        'ResearchStudy'
      end
    end
  end
end