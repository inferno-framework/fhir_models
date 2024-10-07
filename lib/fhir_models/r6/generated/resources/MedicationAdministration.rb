module FHIR
  module build.fhir.org
    class MedicationAdministration < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'occurrence' => ['dateTime', 'Period', 'Timing']
      }
      SEARCH_PARAMS = ['code', 'date', 'device', 'encounter', 'identifier', 'medication', 'patient', 'performer', 'performer-device-code', 'reason-given', 'reason-given-code', 'reason-not-given', 'request', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MedicationAdministration.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MedicationAdministration.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MedicationAdministration.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'MedicationAdministration.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MedicationAdministration.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MedicationAdministration.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MedicationAdministration.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationAdministration.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MedicationAdministration.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan'], 'type'=>'Reference', 'path'=>'MedicationAdministration.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationAdministration', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/MedicationDispense'], 'type'=>'Reference', 'path'=>'MedicationAdministration.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medication-admin-status'=>['in-progress', 'not-done', 'on-hold', 'completed', 'entered-in-error', 'stopped', 'unknown']}, 'type'=>'code', 'path'=>'MedicationAdministration.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-admin-status'}},
        'statusReason' => {'valid_codes'=>{'http://snomed.info/sct'=>['242990004', '182895007', '182896008', '182897004', '182898009', '182899001', '182900006', '182901005', '182902003', '182903008']}, 'type'=>'CodeableConcept', 'path'=>'MedicationAdministration.statusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/reason-medication-not-given-codes'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/medication-admin-location'=>['inpatient', 'outpatient', 'community']}, 'type'=>'CodeableConcept', 'path'=>'MedicationAdministration.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-admin-location'}},
        'medication' => {'type'=>'CodeableReference', 'path'=>'MedicationAdministration.medication', 'min'=>1, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationAdministration.subject', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'MedicationAdministration.encounter', 'min'=>0, 'max'=>1},
        'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationAdministration.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'MedicationAdministration.occurrence[x]', 'min'=>1, 'max'=>1},
        'occurrencePeriod' => {'type'=>'Period', 'path'=>'MedicationAdministration.occurrence[x]', 'min'=>1, 'max'=>1},
        'occurrenceTiming' => {'type'=>'Timing', 'path'=>'MedicationAdministration.occurrence[x]', 'min'=>1, 'max'=>1},
        'recorded' => {'type'=>'dateTime', 'path'=>'MedicationAdministration.recorded', 'min'=>0, 'max'=>1},
        'isSubPotent' => {'type'=>'boolean', 'path'=>'MedicationAdministration.isSubPotent', 'min'=>0, 'max'=>1},
        'subPotentReason' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/administration-subpotent-reason'=>['partialdose', 'vomited', 'coldchainbreak', 'recall', 'adversestorage', 'expired']}, 'type'=>'CodeableConcept', 'path'=>'MedicationAdministration.subPotentReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/administration-subpotent-reason'}},
        'performer' => {'type'=>'MedicationAdministration::Performer', 'path'=>'MedicationAdministration.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'type'=>'CodeableReference', 'path'=>'MedicationAdministration.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'MedicationAdministration.request', 'min'=>0, 'max'=>1},
        'device' => {'type'=>'CodeableReference', 'path'=>'MedicationAdministration.device', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'MedicationAdministration.note', 'min'=>0, 'max'=>Float::INFINITY},
        'dosage' => {'type'=>'MedicationAdministration::Dosage', 'path'=>'MedicationAdministration.dosage', 'min'=>0, 'max'=>1},
        'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'MedicationAdministration.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Performer < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'function' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/med-admin-perform-function'=>['performer', 'verifier', 'witness']}, 'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/med-admin-perform-function'}},
          'actor' => {'type'=>'CodeableReference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 CodeableReference
      end

      class Dosage < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'rate' => ['Ratio', 'Quantity']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Dosage.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Dosage.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Dosage.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'text' => {'type'=>'string', 'path'=>'Dosage.text', 'min'=>0, 'max'=>1},
          'site' => {'valid_codes'=>{'http://snomed.info/sct'=>['91723000', '106004', '107008', '108003', '110001', '111002', '116007', '124002', '149003', '155008', '167005', '202009', '205006', '206007', '221001', '227002', '233006', '235004', '246001', '247005', '251007', '256002', '263002', '266005', '272005', '273000', '283001', '284007', '289002', '301000', '311007', '315003', '318001', '344001', '345000', '356000', '393006', '402006', '405008', '414003', '422005', '446003', '457008', '461002', '464005', '465006', '471000', '480000', '485005', '528006', '552004', '565008', '582005', '587004', '589001', '595000', '608002', '621009', '635006', '650002', '660006', '661005', '667009', '688000', '691000', '692007', '723004', '774007', '790007', '798000', '808000', '809008', '823005', '830004', '836005', '885000', '895007', '917004', '921006', '947002', '955009', '976004', '996007', '1005009', '1012000', '1015003', '1028005', '1030007', '1063000', '1075005', '1076006', '1086007', '1087003', '1092001', '1099005', '1101003', '1106008', '1110006', '1122009', '1136004', '1159005', '1172006', '1173001', '1174007', '1193009', '1216008', '1231004', '1236009', '1243003', '1246006', '1263005', '1277008', '1307006', '1311000', '1350001', '1353004', '1403006', '1425000', '1439000', '1441004', '1456008', '1467009', '1484003', '1490004', '1502004', '1511004', '1516009', '1527006', '1537001', '1541002', '1562001', '1580005', '1581009', '1584001', '1600003', '1605008', '1610007', '1611006', '1617005', '1620002', '1626008', '1627004', '1630006', '1631005', '1650005', '1655000', '1659006', '1684009', '1706004', '1707008', '1711002', '1716007', '1721005', '1729007', '1732005', '1765002', '1780008', '1781007', '1797002', '1818002', '1825009', '1832000', '1840006', '1849007', '1853009', '1874005', '1895000', '1902009', '1910005', '1918003', '1927002', '1992003', '1997009', '2010005', '2020000', '2031008', '2033006', '2044003', '2048000', '2049008', '2059009', '2071003', '2076008', '2083001', '2095001', '2123001', '2150006', '2156000', '2160002', '2175005', '2182009', '2192001', '2205003', '2209009', '2236006', '2246008', '2255006', '2292006', '2302002', '2305000', '2306004', '2327009', '2330002', '2332005', '2334006', '2349003', '2372001', '2383005', '2389009', '2395005', '2397002', '2400006', '2402003', '2421006', '2433001', '2436009', '2453002', '2454008', '2484000', '2489005', '2499000', '2502001', '2504000', '2510000', '2539000', '2543001', '2550002', '2577006', '2579009', '2592007', '2600000', '2620004', '2639009', '2653009', '2666009', '2672009', '2675006', '2681003', '2682005', '2686008', '2687004', '2695000', '2703009', '2712006', '2718005', '2726002', '2730004', '2739003', '2741002', '2746007', '2748008', '2759004', '2771005', '2789006', '2792005', '2803000', '2810006', '2812003', '2824005', '2826007', '2830005', '2839006', '2841007', '2845003', '2848001', '2855004', '2861001', '2894003', '2905008', '2909002', '2920002', '2922005', '2923000', '2969000', '2979003', '2986006', '2998001', '3003007', '3008003', '3028004', '3039001', '3042007', '3054007', '3055008', '3056009', '3057000', '3058005', '3062004', '3068000', '3081007', '3093003', '3100007', '3113001', '3117000', '3118005', '3120008', '3134008', '3138006', '3153003', '3156006', '3159004', '3169005', '3178004', '3194006', '3198009', '3215002', '3222005', '3227004', '3236000', '3243006', '3255000', '3262009', '3279003', '3295003', '3301002', '3302009', '3315000', '3332001', '3336003', '3341006', '3350008', '3362007', '3366005', '3370002', '3374006', '3377004', '3382006', '3383001', '3394002', '3395001', '3396000', '3400000', '3409004', '3417007', '3438001', '3444002', '3447009', '3460003', '3462006', '3471002', '3478008', '3481003', '3488009', '3490005', '3524005', '3538003', '3541007', '3553006', '3556003', '3563003', '3572006', '3578005', '3582007', '3584008', '3594003', '3608004', '3609007', '3646006', '3663005', '3665003', '3670005', '3711007', '3743007', '3761003', '3766008', '3785006', '3788008', '3789000', '3810000', '3838008', '3860006', '3865001', '3867009', '3876002', '3877006', '3910004', '3916005', '3924000', '3931001', '3935005', '3937002', '3954005', '3956007', '3959000', '3960005', '3964001', '3966004', '3977005', '3984002', '3989007', '4015004', '4019005', '4029003', '4061004', '4066009', '4072009', '4081003', '4093007', '4111006', '4117005', '4121003', '4146003', '4148002', '4150005', '4158003', '4159006', '4180000', '4193005', '4205002', '4212006', '4215008', '4247003', '4258007', '4276000', '4281009', '4295007', '4303006', '4312008', '4317002', '4328003', '4335006', '4352005', '4358009', '4360006', '4369007', '4371007', '4375003', '4377006', '4394008', '4402002', '4419000', '4421005', '4430002', '4432005', '4442007', '4486002', '4524000', '4527007', '4537002', '4548009', '4549001', '4566004', '4573009', '4578000', '4588004', '4596009', '4603002', '4606005', '4621004', '4624007', '4647008', '4651005', '4658004', '4677002', '4703008', '4717004', '4718009', '4743003', '4755009', '4759003', '4766002', '4768001', '4774001', '4775000', '4799000', '4810005', '4812002', '4828007', '4840007', '4843009', '4861000', '4866005', '4870002', '4871003', '4881004', '4888005', '4897009', '4905007', '4906008', '4924005', '4942000', '4954000', '4956003', '4958002', '5001007', '5023006', '5026003', '5046008', '5068003', '5069006', '5076001', '5115006', '5122003', '5128004', '5192008', '5194009', '5195005', '5204005', '5213007', '5225005', '5228007', '5229004', '5261000', '5272005', '5279001', '5296000', '5324007', '5329002', '5336001', '5347008', '5362005', '5366008', '5379004', '5382009', '5394000', '5398002', '5403001', '5421003', '5427004', '5458003', '5459006', '5491007', '5493005', '5498001', '5520004', '5538001', '5544002', '5560003', '5564007', '5574005', '5580002', '5597008', '5611001', '5625000', '5627008', '5633004', '5643001', '5644007', '5653000', '5665001', '5668004', '5682004', '5696005', '5697001', '5709001', '5713008', '5717009', '5718004', '5727003', '5742000', '5751008', '5769004', '5780004', '5798000', '5802004', '5814007', '5815008', '5816009', '5825003', '5828001', '5847003', '5854009', '5868002', '5872003', '5881009', '5882002', '5889006', '5890002', '5893000', '5898009', '5923009', '5926001', '5928000', '5942008', '5943003', '5944009', '5948007', '5951000', '5953002', '5976004', '5979006', '5996007', '6001004', '6004007', '6006009', '6009002', '6014003', '6023000', '6032003', '6046003', '6050005', '6059006', '6062009', '6073002', '6074008', '6076005', '6104005', '6105006', '6110005', '6216007', '6217003', '6229007', '6253001', '6268000', '6269008', '6279005', '6317000', '6325003', '6326002', '6335009', '6359004', '6371005', '6375001', '6392005', '6404004', '6413002', '6417001', '6423006', '6424000', '6445007', '6448009', '6450001', '6472004', '6504002', '6511003', '6530003', '6533001', '6538005', '6541001', '6544009', '6550004', '6551000', '6553002', '6564004', '6566002', '6572002', '6598008', '6606008', '6608009', '6620001', '6623004', '6633007', '6643005', '6646002', '6649009', '6651008', '6684008', '6685009', '6711001', '6720005', '6731002', '6739000', '6742006', '6750002', '6757004', '6787005', '6789008', '6799003', '6805009', '6820003', '6828005', '6829002', '6834003', '6841009', '6844001', '6850006', '6864006', '6866008', '6871001', '6894000', '6902008', '6905005', '6912001', '6914000', '6921000', '6930008', '6944002', '6969002', '6975006', '6981003', '6987004', '6989001', '6991009', '7035006', '7050002', '7067009', '7076002', '7083009', '7091000', '7099003', '7117004', '7148007', '7149004', '7154008', '7160008', '7167006', '7173007', '7188002', '7192009', '7227003', '7234001', '7242000', '7295002', '7296001', '7311008', '7344002', '7345001', '7362006', '7376007', '7378008', '7384006', '7404008', '7435002', '7471001', '7477002', '7480001', '7494000', '7498002', '7507003', '7524009', '7532001', '7554004', '7566005', '7569003', '7591005', '7597009', '7605000', '7610001', '7629007', '7651004', '7652006', '7657000', '7658005', '7697002', '7712004', '7726008', '7736000', '7742001', '7748002', '7755000', '7756004', '7764005', '7769000', '7783003', '7820009', '7829005', '7832008', '7835005', '7840002', '7841003', '7844006', '7851002', '7854005', '7872004', '7874003', '7880006', '7884002', '7885001', '7892006', '7896009', '7911004', '7925003', '7936005', '7944005', '7954009', '7967007', '7986004', '7991003', '7999001', '8001006', '8012006', '8017000', '8024004', '8039003', '8040001', '8045006', '8057002', '8059004', '8067007', '8068002', '8079007', '8091003', '8100009', '8111001', '8112008', '8119004', '8128003', '8133004', '8157004', '8158009', '8159001', '8160006', '8161005', '8165001', '8205005', '8225009', '8242003', '8251006', '8264007', '8265008', '8266009', '8289001', '8292002', '8314003', '8334002', '8356004', '8369000', '8373002', '8387002', '8389004', '8412003', '8415001', '8454000', '8464009', '8482007', '8483002', '8496001', '8523001', '8546004', '8556000', '8559007', '8560002', '8580001', '8595004', '8598002', '8600008', '8603005', '8604004', '8608001', '8617001', '8623006', '8629005', '8640002', '8668003', '8671006', '8677005', '8688004', '8695008', '8710005', '8711009', '8714001', '8752000', '8775007', '8784007', '8810002', '8814006', '8815007', '8820007', '8821006', '8827005', '8839002', '8845005', '8850004', '8854008', '8862000', '8873007', '8887007', '8892009', '8894005', '8897003', '8907008', '8910001', '8911002', '8928004', '8931003', '8935007', '8942007', '8965002', '8966001', '8983005', '8988001', '8993003', '9000002', '9003000', '9018004', '9040008', '9055004', '9073001', '9081000', '9086005', '9089003', '9108007', '9127001', '9156001', '9185007', '9186008', '9188009', '9208002', '9212008', '9229006', '9231002', '9240003', '9242006', '9258009', '9261005', '9262003', '9284003', '9290004', '9305001', '9317004', '9320007', '9321006', '9325002', '9332006', '9348007', '9379006', '9380009', '9384000', '9390001', '9432007', '9438006', '9454009', '9455005', '9475001', '9481009', '9490002', '9498009', '9502002', '9512009', '9535007', '9558005', '9566001', '9568000', '9596006', '9609000', '9625005', '9642004', '9646001', '9654004', '9659009', '9662007', '9668006', '9677004', '9683001', '9684007', '9708001', '9736006', '9743000', '9758008', '9770007', '9775002', '9779008', '9783008', '9791004', '9796009', '9813009', '9825007', '9837009', '9840009', '9841008', '9846003', '9847007', '9849005', '9870004', '9875009', '9878006', '9880000', '9881001', '9891007', '9898001', '9951005', '9968009', '9970000', '9976006', '9994000', '9999005', '10013000', '10024003', '10025002', '10026001', '10036009', '10042008', '10047002', '10052007', '10056005', '10062000', '10119003', '10124000', '10134009', '10141003', '10145007', '10148009', '10149001', '10151002', '10167008', '10176001', '10200004', '10208006', '10209003', '10245000', '10271001', '10293006', '10296003', '10299005', '10328008', '10339006', '10410005', '10415000', '10417008', '10418003']}, 'type'=>'CodeableConcept', 'path'=>'Dosage.site', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/approach-site-codes'}},
          'route' => {'valid_codes'=>{'http://snomed.info/sct'=>['284009009', '6064005', '10547007', '12130007', '16857009', '26643006', '34206005', '37161004', '37737002', '37839007', '38239002', '45890007', '46713006', '47625008', '54471007', '54485002', '58100008', '60213007', '62226000', '72607000', '78421000', '90028008', '127490009', '127491008', '127492001', '372449004', '372450004', '372451000', '372452007', '372453002', '372454008', '372457001', '372458006', '372459003', '372460008', '372461007', '372462000', '372463005', '372464004', '372465003', '372466002', '372467006', '372468001', '372469009', '372470005', '372471009', '372472002', '372473007', '372474001', '372475000', '372476004', '404815008', '404818005', '404819002', '404820008', '416174007', '417070009', '417255000', '417950001', '417985001', '417989007', '418091004', '418114005', '418133000', '418136008', '418162004', '418204005', '418287000', '418321004', '418331006', '418401004', '418418000', '418441008', '418511008', '418586008', '418608002', '418664002', '418722009', '418730005', '418743005', '418813001', '418821007', '418851001', '418877009', '418887008', '418892005', '418947002', '418987007', '419021003', '419165009', '419231003', '419243002', '419320008', '419396008', '419601003', '419631009', '419684008', '419762003', '419778001', '419810008', '419874009', '419894000', '419954003', '419993007', '420047004', '420163009', '420168000', '420185003', '420201002', '420204005', '420218003', '420254004', '420287000', '420719007', '428191002', '429817007', '445752009', '445754005', '445755006', '445756007', '445767008', '445768003', '445771006', '445913005', '445941009', '446105004', '446407004', '446435000', '446442000', '446540005', '447026006', '447052000', '447080003', '447081004', '447121004', '447122006', '447227007', '447229005', '447694001', '447964005', '448077001', '448491004', '448492006', '448598008', '697971008', '711360002', '711378007', '714743009', '718329006', '764723001', '766790006', '876824003', '1078280005', '1254769004', '1259221004', '1611000175109', '58731000052100', '58751000052109', '58761000052107', '58771000052103', '58811000052103', '58821000052106', '58831000052108', '66621000052103']}, 'type'=>'CodeableConcept', 'path'=>'Dosage.route', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/route-codes'}},
          'method' => {'local_name'=>'local_method', 'valid_codes'=>{'http://snomed.info/sct'=>['736665006', '738990001', '738991002', '738992009', '738993004', '738994005', '738995006', '738996007', '740666001', '740685003', '764498003', '764794000', '782155003', '782168006', '785900008', '823034001', '827107003', '1010690008', '1231460007', '58841000052102']}, 'type'=>'CodeableConcept', 'path'=>'Dosage.method', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/administration-method-codes'}},
          'dose' => {'type'=>'Quantity', 'path'=>'Dosage.dose', 'min'=>0, 'max'=>1},
          'rateRatio' => {'type'=>'Ratio', 'path'=>'Dosage.rate[x]', 'min'=>0, 'max'=>1},
          'rateQuantity' => {'type'=>'Quantity', 'path'=>'Dosage.rate[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :text              # 0-1 string
        attr_accessor :site              # 0-1 CodeableConcept
        attr_accessor :route             # 0-1 CodeableConcept
        attr_accessor :local_method      # 0-1 CodeableConcept
        attr_accessor :dose              # 0-1 Quantity
        attr_accessor :rateRatio         # 0-1 Ratio
        attr_accessor :rateQuantity      # 0-1 Quantity
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :meta                  # 0-1 Meta
      attr_accessor :implicitRules         # 0-1 uri
      attr_accessor :language              # 0-1 code
      attr_accessor :text                  # 0-1 Narrative
      attr_accessor :contained             # 0-* [ Resource ]
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :identifier            # 0-* [ Identifier ]
      attr_accessor :basedOn               # 0-* [ Reference(CarePlan) ]
      attr_accessor :partOf                # 0-* [ Reference(MedicationAdministration|Procedure|MedicationDispense) ]
      attr_accessor :status                # 1-1 code
      attr_accessor :statusReason          # 0-* [ CodeableConcept ]
      attr_accessor :category              # 0-* [ CodeableConcept ]
      attr_accessor :medication            # 1-1 CodeableReference
      attr_accessor :subject               # 1-1 Reference(Patient|Group)
      attr_accessor :encounter             # 0-1 Reference(Encounter)
      attr_accessor :supportingInformation # 0-* [ Reference(Resource) ]
      attr_accessor :occurrenceDateTime    # 1-1 dateTime
      attr_accessor :occurrencePeriod      # 1-1 Period
      attr_accessor :occurrenceTiming      # 1-1 Timing
      attr_accessor :recorded              # 0-1 dateTime
      attr_accessor :isSubPotent           # 0-1 boolean
      attr_accessor :subPotentReason       # 0-* [ CodeableConcept ]
      attr_accessor :performer             # 0-* [ MedicationAdministration::Performer ]
      attr_accessor :reason                # 0-* [ CodeableReference ]
      attr_accessor :request               # 0-1 Reference(MedicationRequest)
      attr_accessor :device                # 0-* [ CodeableReference ]
      attr_accessor :note                  # 0-* [ Annotation ]
      attr_accessor :dosage                # 0-1 MedicationAdministration::Dosage
      attr_accessor :eventHistory          # 0-* [ Reference(Provenance) ]

      def resourceType
        'MedicationAdministration'
      end
    end
  end
end