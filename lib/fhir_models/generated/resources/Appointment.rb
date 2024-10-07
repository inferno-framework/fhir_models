module FHIR
  module build.fhir.org
    class Appointment < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['actor', 'appointment-type', 'based-on', 'date', 'group', 'identifier', 'location', 'part-status', 'patient', 'practitioner', 'reason-code', 'reason-reference', 'requested-period', 'service-category', 'service-type', 'service-type-reference', 'slot', 'specialty', 'status', 'subject', 'supporting-info']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Appointment.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Appointment.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Appointment.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Appointment.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Appointment.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Appointment.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Appointment.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Appointment.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Appointment.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/appointmentstatus'=>['proposed', 'pending', 'booked', 'arrived', 'fulfilled', 'cancelled', 'noshow', 'entered-in-error', 'checked-in', 'waitlist']}, 'type'=>'code', 'path'=>'Appointment.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/appointmentstatus'}},
        'cancellationReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/appointment-cancellation-reason'=>['pat', 'pat-crs', 'pat-cpp', 'pat-dec', 'pat-fb', 'pat-lt', 'pat-mt', 'pat-mv', 'pat-preg', 'pat-swl', 'pat-ucp', 'prov', 'prov-pers', 'prov-dch', 'prov-edu', 'prov-hosp', 'prov-labs', 'prov-mri', 'prov-onc', 'maint', 'meds-inc', 'other', 'oth-cms', 'oth-err', 'oth-fin', 'oth-iv', 'oth-int', 'oth-mu', 'oth-room', 'oth-oerr', 'oth-swie', 'oth-weath']}, 'type'=>'CodeableConcept', 'path'=>'Appointment.cancellationReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/appointment-cancellation-reason'}},
        'class' => {'local_name'=>'local_class', 'type'=>'CodeableConcept', 'path'=>'Appointment.class', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/EncounterClass'}},
        'serviceCategory' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/service-category'=>['1', '2', '34', '3', '4', '5', '6', '7', '8', '36', '9', '10', '11', '12', '13', '14', '15', '16', '17', '35', '18', '19', '20', '21', '22', '38', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '37', '33']}, 'type'=>'CodeableConcept', 'path'=>'Appointment.serviceCategory', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-category'}},
        'serviceType' => {'type'=>'CodeableReference', 'path'=>'Appointment.serviceType', 'min'=>0, 'max'=>Float::INFINITY},
        'specialty' => {'valid_codes'=>{'http://snomed.info/sct'=>['408467006', '394577000', '394578005', '421661004', '408462000', '394579002', '394804000', '394580004', '394803006', '408480009', '408454008', '394809005', '394592004', '394600006', '394601005', '394581000', '408478003', '394812008', '408444009', '394582007', '408475000', '410005002', '394583002', '419772000', '394584008', '408443003', '394802001', '394915009', '394814009', '394808002', '394811001', '408446006', '394586005', '394916005', '408472002', '394597005', '394598000', '394807007', '419192003', '408468001', '394593009', '394813003', '410001006', '394589003', '394591006', '394599008', '394649004', '408470005', '394585009', '394821009', '422191005', '394594003', '416304004', '418960008', '394882004', '394806003', '394588006', '408459003', '394607009', '419610006', '418058008', '420208008', '418652005', '418535003', '418862001', '419365004', '418002000', '419983000', '419170002', '419472004', '394539006', '420112009', '409968004', '394587001', '394913002', '408440000', '418112009', '419815003', '394914008', '408455009', '394602003', '408447002', '394810000', '408450004', '408476004', '408469009', '408466002', '408471009', '408464004', '408441001', '408465003', '394605001', '394608004', '408461007', '408460008', '394606000', '408449004', '418018006', '394604002', '394609007', '408474001', '394610002', '394611003', '408477008', '394801008', '408463005', '419321007', '394576009', '394590007', '409967009', '408448007', '419043006', '394612005', '394733009', '394732004']}, 'type'=>'CodeableConcept', 'path'=>'Appointment.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes'}},
        'appointmentType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0276'=>['ROUTINE', 'WALKIN', 'CHECKUP', 'FOLLOWUP', 'EMERGENCY']}, 'type'=>'CodeableConcept', 'path'=>'Appointment.appointmentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0276'}},
        'reason' => {'type'=>'CodeableReference', 'path'=>'Appointment.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'priority' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActPriority'=>['A', 'CR', 'EL', 'EM', 'P', 'PRN', 'R', 'RR', 'S', 'T', 'UD', 'UR', 'CS', 'CSP', 'CSR']}, 'type'=>'CodeableConcept', 'path'=>'Appointment.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ActPriority'}},
        'description' => {'type'=>'string', 'path'=>'Appointment.description', 'min'=>0, 'max'=>1},
        'replaces' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Appointment'], 'type'=>'Reference', 'path'=>'Appointment.replaces', 'min'=>0, 'max'=>Float::INFINITY},
        'virtualService' => {'type'=>'VirtualServiceDetail', 'path'=>'Appointment.virtualService', 'min'=>0, 'max'=>Float::INFINITY},
        'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Appointment.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'previousAppointment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Appointment'], 'type'=>'Reference', 'path'=>'Appointment.previousAppointment', 'min'=>0, 'max'=>1},
        'originatingAppointment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Appointment'], 'type'=>'Reference', 'path'=>'Appointment.originatingAppointment', 'min'=>0, 'max'=>1},
        'start' => {'type'=>'instant', 'path'=>'Appointment.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'instant', 'path'=>'Appointment.end', 'min'=>0, 'max'=>1},
        'minutesDuration' => {'type'=>'positiveInt', 'path'=>'Appointment.minutesDuration', 'min'=>0, 'max'=>1},
        'requestedPeriod' => {'type'=>'Period', 'path'=>'Appointment.requestedPeriod', 'min'=>0, 'max'=>Float::INFINITY},
        'slot' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Slot'], 'type'=>'Reference', 'path'=>'Appointment.slot', 'min'=>0, 'max'=>Float::INFINITY},
        'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'Appointment.account', 'min'=>0, 'max'=>Float::INFINITY},
        'created' => {'type'=>'dateTime', 'path'=>'Appointment.created', 'min'=>0, 'max'=>1},
        'cancellationDate' => {'type'=>'dateTime', 'path'=>'Appointment.cancellationDate', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'Appointment.note', 'min'=>0, 'max'=>Float::INFINITY},
        'patientInstruction' => {'type'=>'CodeableReference', 'path'=>'Appointment.patientInstruction', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/RequestOrchestration', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation'], 'type'=>'Reference', 'path'=>'Appointment.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Appointment.subject', 'min'=>0, 'max'=>1},
        'participant' => {'type'=>'Appointment::Participant', 'path'=>'Appointment.participant', 'min'=>1, 'max'=>Float::INFINITY},
        'recurrenceId' => {'type'=>'positiveInt', 'path'=>'Appointment.recurrenceId', 'min'=>0, 'max'=>1},
        'occurrenceChanged' => {'type'=>'boolean', 'path'=>'Appointment.occurrenceChanged', 'min'=>0, 'max'=>1},
        'recurrenceTemplate' => {'type'=>'Appointment::RecurrenceTemplate', 'path'=>'Appointment.recurrenceTemplate', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Participant < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Participant.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Participant.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Participant.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationType'=>['ADM', 'ATND', 'CALLBCK', 'CON', 'DIS', 'ESC', 'REF'], 'http://terminology.hl7.org/CodeSystem/participant-type'=>['translator', 'emergency']}, 'type'=>'CodeableConcept', 'path'=>'Participant.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-participant-type'}},
          'period' => {'type'=>'Period', 'path'=>'Participant.period', 'min'=>0, 'max'=>1},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Participant.actor', 'min'=>0, 'max'=>1},
          'required' => {'type'=>'boolean', 'path'=>'Participant.required', 'min'=>0, 'max'=>1},
          'status' => {'valid_codes'=>{'http://hl7.org/fhir/participationstatus'=>['accepted', 'declined', 'tentative', 'needs-action']}, 'type'=>'code', 'path'=>'Participant.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/participationstatus'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-* [ CodeableConcept ]
        attr_accessor :period            # 0-1 Period
        attr_accessor :actor             # 0-1 Reference(Patient|Group|Practitioner|PractitionerRole|CareTeam|RelatedPerson|Device|HealthcareService|Location)
        attr_accessor :required          # 0-1 boolean
        attr_accessor :status            # 1-1 code
      end

      class RecurrenceTemplate < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'RecurrenceTemplate.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'RecurrenceTemplate.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'RecurrenceTemplate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'timezone' => {'valid_codes'=>{'https://www.iana.org/time-zones'=>['Africa/Abidjan', 'Africa/Accra', 'Africa/Addis_Ababa', 'Africa/Algiers', 'Africa/Asmara', 'Africa/Bamako', 'Africa/Bangui', 'Africa/Banjul', 'Africa/Bissau', 'Africa/Blantyre', 'Africa/Brazzaville', 'Africa/Bujumbura', 'Africa/Cairo', 'Africa/Casablanca', 'Africa/Ceuta', 'Africa/Conakry', 'Africa/Dakar', 'Africa/Dar_es_Salaam', 'Africa/Djibouti', 'Africa/Douala', 'Africa/El_Aaiun', 'Africa/Freetown', 'Africa/Gaborone', 'Africa/Harare', 'Africa/Johannesburg', 'Africa/Juba', 'Africa/Kampala', 'Africa/Khartoum', 'Africa/Kigali', 'Africa/Kinshasa', 'Africa/Lagos', 'Africa/Libreville', 'Africa/Lome', 'Africa/Luanda', 'Africa/Lubumbashi', 'Africa/Lusaka', 'Africa/Malabo', 'Africa/Maputo', 'Africa/Maseru', 'Africa/Mbabane', 'Africa/Mogadishu', 'Africa/Monrovia', 'Africa/Nairobi', 'Africa/Ndjamena', 'Africa/Niamey', 'Africa/Nouakchott', 'Africa/Ouagadougou', 'Africa/Porto-Novo', 'Africa/Sao_Tome', 'Africa/Timbuktu', 'Africa/Tripoli', 'Africa/Tunis', 'Africa/Windhoek', 'America/Adak', 'America/Anchorage', 'America/Anguilla', 'America/Antigua', 'America/Araguaina', 'America/Argentina/Buenos_Aires', 'America/Argentina/Catamarca', 'America/Argentina/ComodRivadavia', 'America/Argentina/Cordoba', 'America/Argentina/Jujuy', 'America/Argentina/La_Rioja', 'America/Argentina/Mendoza', 'America/Argentina/Rio_Gallegos', 'America/Argentina/Salta', 'America/Argentina/San_Juan', 'America/Argentina/San_Luis', 'America/Argentina/Tucuman', 'America/Argentina/Ushuaia', 'America/Aruba', 'America/Asuncion', 'America/Atikokan', 'America/Bahia', 'America/Bahia_Banderas', 'America/Barbados', 'America/Belem', 'America/Belize', 'America/Blanc-Sablon', 'America/Boa_Vista', 'America/Bogota', 'America/Boise', 'America/Cambridge_Bay', 'America/Campo_Grande', 'America/Cancun', 'America/Caracas', 'America/Cayenne', 'America/Cayman', 'America/Chicago', 'America/Chihuahua', 'America/Coral_Harbour', 'America/Costa_Rica', 'America/Creston', 'America/Cuiaba', 'America/Curacao', 'America/Danmarkshavn', 'America/Dawson', 'America/Dawson_Creek', 'America/Denver', 'America/Detroit', 'America/Dominica', 'America/Edmonton', 'America/Eirunepe', 'America/El_Salvador', 'America/Ensenada', 'America/Fort_Nelson', 'America/Fortaleza', 'America/Glace_Bay', 'America/Goose_Bay', 'America/Grand_Turk', 'America/Grenada', 'America/Guadeloupe', 'America/Guatemala', 'America/Guayaquil', 'America/Guyana', 'America/Halifax', 'America/Havana', 'America/Hermosillo', 'America/Indiana/Indianapolis', 'America/Indiana/Knox', 'America/Indiana/Marengo', 'America/Indiana/Petersburg', 'America/Indiana/Tell_City', 'America/Indiana/Vevay', 'America/Indiana/Vincennes', 'America/Indiana/Winamac', 'America/Inuvik', 'America/Iqaluit', 'America/Jamaica', 'America/Juneau', 'America/Kentucky/Louisville', 'America/Kentucky/Monticello', 'America/La_Paz', 'America/Lima', 'America/Los_Angeles', 'America/Maceio', 'America/Managua', 'America/Manaus', 'America/Martinique', 'America/Matamoros', 'America/Mazatlan', 'America/Menominee', 'America/Merida', 'America/Metlakatla', 'America/Mexico_City', 'America/Miquelon', 'America/Moncton', 'America/Monterrey', 'America/Montevideo', 'America/Montreal', 'America/Montserrat', 'America/Nassau', 'America/New_York', 'America/Nipigon', 'America/Nome', 'America/Noronha', 'America/North_Dakota/Beulah', 'America/North_Dakota/Center', 'America/North_Dakota/New_Salem', 'America/Nuuk', 'America/Ojinaga', 'America/Panama', 'America/Pangnirtung', 'America/Paramaribo', 'America/Phoenix', 'America/Port-au-Prince', 'America/Port_of_Spain', 'America/Porto_Velho', 'America/Puerto_Rico', 'America/Punta_Arenas', 'America/Rainy_River', 'America/Rankin_Inlet', 'America/Recife', 'America/Regina', 'America/Resolute', 'America/Rio_Branco', 'America/Rosario', 'America/Santarem', 'America/Santiago', 'America/Santo_Domingo', 'America/Sao_Paulo', 'America/Scoresbysund', 'America/Sitka', 'America/St_Johns', 'America/St_Kitts', 'America/St_Lucia', 'America/St_Thomas', 'America/St_Vincent', 'America/Swift_Current', 'America/Tegucigalpa', 'America/Thule', 'America/Thunder_Bay', 'America/Tijuana', 'America/Toronto', 'America/Tortola', 'America/Vancouver', 'America/Whitehorse', 'America/Winnipeg', 'America/Yakutat', 'America/Yellowknife', 'Antarctica/Casey', 'Antarctica/Davis', 'Antarctica/DumontDUrville', 'Antarctica/Macquarie', 'Antarctica/Mawson', 'Antarctica/McMurdo', 'Antarctica/Palmer', 'Antarctica/Rothera', 'Antarctica/Syowa', 'Antarctica/Troll', 'Antarctica/Vostok', 'Asia/Aden', 'Asia/Almaty', 'Asia/Amman', 'Asia/Anadyr', 'Asia/Aqtau', 'Asia/Aqtobe', 'Asia/Ashgabat', 'Asia/Atyrau', 'Asia/Baghdad', 'Asia/Bahrain', 'Asia/Baku', 'Asia/Bangkok', 'Asia/Barnaul', 'Asia/Beirut', 'Asia/Bishkek', 'Asia/Brunei', 'Asia/Chita', 'Asia/Choibalsan', 'Asia/Chongqing', 'Asia/Colombo', 'Asia/Damascus', 'Asia/Dhaka', 'Asia/Dili', 'Asia/Dubai', 'Asia/Dushanbe', 'Asia/Famagusta', 'Asia/Gaza', 'Asia/Hanoi', 'Asia/Harbin', 'Asia/Hebron', 'Asia/Ho_Chi_Minh', 'Asia/Hong_Kong', 'Asia/Hovd', 'Asia/Irkutsk', 'Asia/Jakarta', 'Asia/Jayapura', 'Asia/Jerusalem', 'Asia/Kabul', 'Asia/Kamchatka', 'Asia/Karachi', 'Asia/Kashgar', 'Asia/Kathmandu', 'Asia/Khandyga', 'Asia/Kolkata', 'Asia/Krasnoyarsk', 'Asia/Kuala_Lumpur', 'Asia/Kuching', 'Asia/Kuwait', 'Asia/Macau', 'Asia/Magadan', 'Asia/Makassar', 'Asia/Manila', 'Asia/Muscat', 'Asia/Nicosia', 'Asia/Novokuznetsk', 'Asia/Novosibirsk', 'Asia/Omsk', 'Asia/Oral', 'Asia/Phnom_Penh', 'Asia/Pontianak', 'Asia/Pyongyang', 'Asia/Qatar', 'Asia/Qostanay', 'Asia/Qyzylorda', 'Asia/Riyadh', 'Asia/Sakhalin', 'Asia/Samarkand', 'Asia/Seoul', 'Asia/Shanghai', 'Asia/Singapore', 'Asia/Srednekolymsk', 'Asia/Taipei', 'Asia/Tashkent', 'Asia/Tbilisi', 'Asia/Tehran', 'Asia/Tel_Aviv', 'Asia/Thimphu', 'Asia/Tokyo', 'Asia/Tomsk', 'Asia/Ulaanbaatar', 'Asia/Urumqi', 'Asia/Ust-Nera', 'Asia/Vientiane', 'Asia/Vladivostok', 'Asia/Yakutsk', 'Asia/Yangon', 'Asia/Yekaterinburg', 'Asia/Yerevan', 'Atlantic/Azores', 'Atlantic/Bermuda', 'Atlantic/Canary', 'Atlantic/Cape_Verde', 'Atlantic/Faroe', 'Atlantic/Jan_Mayen', 'Atlantic/Madeira', 'Atlantic/Reykjavik', 'Atlantic/South_Georgia', 'Atlantic/St_Helena', 'Atlantic/Stanley', 'Australia/Adelaide', 'Australia/Brisbane', 'Australia/Broken_Hill', 'Australia/Currie', 'Australia/Darwin', 'Australia/Eucla', 'Australia/Hobart', 'Australia/Lindeman', 'Australia/Lord_Howe', 'Australia/Melbourne', 'Australia/Perth', 'Australia/Sydney', 'CET', 'CST6CDT', 'EET', 'EST', 'EST5EDT', 'Etc/GMT', 'Etc/GMT+1', 'Etc/GMT+10', 'Etc/GMT+11', 'Etc/GMT+12', 'Etc/GMT+2', 'Etc/GMT+3', 'Etc/GMT+4', 'Etc/GMT+5', 'Etc/GMT+6', 'Etc/GMT+7', 'Etc/GMT+8', 'Etc/GMT+9', 'Etc/GMT-1', 'Etc/GMT-10', 'Etc/GMT-11', 'Etc/GMT-12', 'Etc/GMT-13', 'Etc/GMT-14', 'Etc/GMT-2', 'Etc/GMT-3', 'Etc/GMT-4', 'Etc/GMT-5', 'Etc/GMT-6', 'Etc/GMT-7', 'Etc/GMT-8', 'Etc/GMT-9', 'Etc/UTC', 'Europe/Amsterdam', 'Europe/Andorra', 'Europe/Astrakhan', 'Europe/Athens', 'Europe/Belfast', 'Europe/Belgrade', 'Europe/Berlin', 'Europe/Brussels', 'Europe/Bucharest', 'Europe/Budapest', 'Europe/Chisinau', 'Europe/Copenhagen', 'Europe/Dublin', 'Europe/Gibraltar', 'Europe/Guernsey', 'Europe/Helsinki', 'Europe/Isle_of_Man', 'Europe/Istanbul', 'Europe/Jersey', 'Europe/Kaliningrad', 'Europe/Kiev', 'Europe/Kirov', 'Europe/Lisbon', 'Europe/Ljubljana', 'Europe/London', 'Europe/Luxembourg', 'Europe/Madrid', 'Europe/Malta', 'Europe/Minsk', 'Europe/Monaco', 'Europe/Moscow', 'Europe/Oslo', 'Europe/Paris', 'Europe/Prague', 'Europe/Riga', 'Europe/Rome', 'Europe/Samara', 'Europe/Sarajevo', 'Europe/Saratov', 'Europe/Simferopol', 'Europe/Skopje', 'Europe/Sofia', 'Europe/Stockholm', 'Europe/Tallinn', 'Europe/Tirane', 'Europe/Tiraspol', 'Europe/Ulyanovsk', 'Europe/Uzhgorod', 'Europe/Vaduz', 'Europe/Vienna', 'Europe/Vilnius', 'Europe/Volgograd', 'Europe/Warsaw', 'Europe/Zagreb', 'Europe/Zaporozhye', 'Europe/Zurich', 'Factory', 'HST', 'Indian/Antananarivo', 'Indian/Chagos', 'Indian/Christmas', 'Indian/Cocos', 'Indian/Comoro', 'Indian/Kerguelen', 'Indian/Mahe', 'Indian/Maldives', 'Indian/Mauritius', 'Indian/Mayotte', 'Indian/Reunion', 'MET', 'MST', 'MST7MDT', 'PST8PDT', 'Pacific/Apia', 'Pacific/Auckland', 'Pacific/Bougainville', 'Pacific/Chatham', 'Pacific/Chuuk', 'Pacific/Easter', 'Pacific/Efate', 'Pacific/Enderbury', 'Pacific/Fakaofo', 'Pacific/Fiji', 'Pacific/Funafuti', 'Pacific/Galapagos', 'Pacific/Gambier', 'Pacific/Guadalcanal', 'Pacific/Guam', 'Pacific/Honolulu', 'Pacific/Johnston', 'Pacific/Kiritimati', 'Pacific/Kosrae', 'Pacific/Kwajalein', 'Pacific/Majuro', 'Pacific/Marquesas', 'Pacific/Midway', 'Pacific/Nauru', 'Pacific/Niue', 'Pacific/Norfolk', 'Pacific/Noumea', 'Pacific/Pago_Pago', 'Pacific/Palau', 'Pacific/Pitcairn', 'Pacific/Pohnpei', 'Pacific/Port_Moresby', 'Pacific/Rarotonga', 'Pacific/Saipan', 'Pacific/Tahiti', 'Pacific/Tarawa', 'Pacific/Tongatapu', 'Pacific/Wake', 'Pacific/Wallis', 'WET']}, 'type'=>'CodeableConcept', 'path'=>'RecurrenceTemplate.timezone', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/timezones'}},
          'recurrenceType' => {'valid_codes'=>{'http://unitsofmeasure.org'=>['d', 'wk', 'mo', 'a']}, 'type'=>'CodeableConcept', 'path'=>'RecurrenceTemplate.recurrenceType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/appointment-recurrrence-type'}},
          'lastOccurrenceDate' => {'type'=>'date', 'path'=>'RecurrenceTemplate.lastOccurrenceDate', 'min'=>0, 'max'=>1},
          'occurrenceCount' => {'type'=>'positiveInt', 'path'=>'RecurrenceTemplate.occurrenceCount', 'min'=>0, 'max'=>1},
          'occurrenceDate' => {'type'=>'date', 'path'=>'RecurrenceTemplate.occurrenceDate', 'min'=>0, 'max'=>Float::INFINITY},
          'weeklyTemplate' => {'type'=>'Appointment::RecurrenceTemplate::WeeklyTemplate', 'path'=>'RecurrenceTemplate.weeklyTemplate', 'min'=>0, 'max'=>1},
          'monthlyTemplate' => {'type'=>'Appointment::RecurrenceTemplate::MonthlyTemplate', 'path'=>'RecurrenceTemplate.monthlyTemplate', 'min'=>0, 'max'=>1},
          'yearlyTemplate' => {'type'=>'Appointment::RecurrenceTemplate::YearlyTemplate', 'path'=>'RecurrenceTemplate.yearlyTemplate', 'min'=>0, 'max'=>1},
          'excludingDate' => {'type'=>'date', 'path'=>'RecurrenceTemplate.excludingDate', 'min'=>0, 'max'=>Float::INFINITY},
          'excludingRecurrenceId' => {'type'=>'positiveInt', 'path'=>'RecurrenceTemplate.excludingRecurrenceId', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class WeeklyTemplate < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'WeeklyTemplate.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'WeeklyTemplate.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'WeeklyTemplate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'monday' => {'type'=>'boolean', 'path'=>'WeeklyTemplate.monday', 'min'=>0, 'max'=>1},
            'tuesday' => {'type'=>'boolean', 'path'=>'WeeklyTemplate.tuesday', 'min'=>0, 'max'=>1},
            'wednesday' => {'type'=>'boolean', 'path'=>'WeeklyTemplate.wednesday', 'min'=>0, 'max'=>1},
            'thursday' => {'type'=>'boolean', 'path'=>'WeeklyTemplate.thursday', 'min'=>0, 'max'=>1},
            'friday' => {'type'=>'boolean', 'path'=>'WeeklyTemplate.friday', 'min'=>0, 'max'=>1},
            'saturday' => {'type'=>'boolean', 'path'=>'WeeklyTemplate.saturday', 'min'=>0, 'max'=>1},
            'sunday' => {'type'=>'boolean', 'path'=>'WeeklyTemplate.sunday', 'min'=>0, 'max'=>1},
            'weekInterval' => {'type'=>'positiveInt', 'path'=>'WeeklyTemplate.weekInterval', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :monday            # 0-1 boolean
          attr_accessor :tuesday           # 0-1 boolean
          attr_accessor :wednesday         # 0-1 boolean
          attr_accessor :thursday          # 0-1 boolean
          attr_accessor :friday            # 0-1 boolean
          attr_accessor :saturday          # 0-1 boolean
          attr_accessor :sunday            # 0-1 boolean
          attr_accessor :weekInterval      # 0-1 positiveInt
        end

        class MonthlyTemplate < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'MonthlyTemplate.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'MonthlyTemplate.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'MonthlyTemplate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'dayOfMonth' => {'type'=>'positiveInt', 'path'=>'MonthlyTemplate.dayOfMonth', 'min'=>0, 'max'=>1},
            'nthWeekOfMonth' => {'valid_codes'=>{'http://hl7.org/fhir/week-of-month'=>['first', 'second', 'third', 'fourth', 'last']}, 'type'=>'Coding', 'path'=>'MonthlyTemplate.nthWeekOfMonth', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/week-of-month'}},
            'dayOfWeek' => {'valid_codes'=>{'http://hl7.org/fhir/days-of-week'=>['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun']}, 'type'=>'Coding', 'path'=>'MonthlyTemplate.dayOfWeek', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/days-of-week'}},
            'monthInterval' => {'type'=>'positiveInt', 'path'=>'MonthlyTemplate.monthInterval', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :dayOfMonth        # 0-1 positiveInt
          attr_accessor :nthWeekOfMonth    # 0-1 Coding
          attr_accessor :dayOfWeek         # 0-1 Coding
          attr_accessor :monthInterval     # 1-1 positiveInt
        end

        class YearlyTemplate < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'YearlyTemplate.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'YearlyTemplate.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'YearlyTemplate.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'yearInterval' => {'type'=>'positiveInt', 'path'=>'YearlyTemplate.yearInterval', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :yearInterval      # 1-1 positiveInt
        end

        attr_accessor :id                    # 0-1 string
        attr_accessor :extension             # 0-* [ Extension ]
        attr_accessor :modifierExtension     # 0-* [ Extension ]
        attr_accessor :timezone              # 0-1 CodeableConcept
        attr_accessor :recurrenceType        # 1-1 CodeableConcept
        attr_accessor :lastOccurrenceDate    # 0-1 date
        attr_accessor :occurrenceCount       # 0-1 positiveInt
        attr_accessor :occurrenceDate        # 0-* [ date ]
        attr_accessor :weeklyTemplate        # 0-1 Appointment::RecurrenceTemplate::WeeklyTemplate
        attr_accessor :monthlyTemplate       # 0-1 Appointment::RecurrenceTemplate::MonthlyTemplate
        attr_accessor :yearlyTemplate        # 0-1 Appointment::RecurrenceTemplate::YearlyTemplate
        attr_accessor :excludingDate         # 0-* [ date ]
        attr_accessor :excludingRecurrenceId # 0-* [ positiveInt ]
      end

      attr_accessor :id                     # 0-1 id
      attr_accessor :meta                   # 0-1 Meta
      attr_accessor :implicitRules          # 0-1 uri
      attr_accessor :language               # 0-1 code
      attr_accessor :text                   # 0-1 Narrative
      attr_accessor :contained              # 0-* [ Resource ]
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :identifier             # 0-* [ Identifier ]
      attr_accessor :status                 # 1-1 code
      attr_accessor :cancellationReason     # 0-1 CodeableConcept
      attr_accessor :local_class            # 0-* [ CodeableConcept ]
      attr_accessor :serviceCategory        # 0-* [ CodeableConcept ]
      attr_accessor :serviceType            # 0-* [ CodeableReference ]
      attr_accessor :specialty              # 0-* [ CodeableConcept ]
      attr_accessor :appointmentType        # 0-1 CodeableConcept
      attr_accessor :reason                 # 0-* [ CodeableReference ]
      attr_accessor :priority               # 0-1 CodeableConcept
      attr_accessor :description            # 0-1 string
      attr_accessor :replaces               # 0-* [ Reference(Appointment) ]
      attr_accessor :virtualService         # 0-* [ VirtualServiceDetail ]
      attr_accessor :supportingInformation  # 0-* [ Reference(Resource) ]
      attr_accessor :previousAppointment    # 0-1 Reference(Appointment)
      attr_accessor :originatingAppointment # 0-1 Reference(Appointment)
      attr_accessor :start                  # 0-1 instant
      attr_accessor :end                    # 0-1 instant
      attr_accessor :minutesDuration        # 0-1 positiveInt
      attr_accessor :requestedPeriod        # 0-* [ Period ]
      attr_accessor :slot                   # 0-* [ Reference(Slot) ]
      attr_accessor :account                # 0-* [ Reference(Account) ]
      attr_accessor :created                # 0-1 dateTime
      attr_accessor :cancellationDate       # 0-1 dateTime
      attr_accessor :note                   # 0-* [ Annotation ]
      attr_accessor :patientInstruction     # 0-* [ CodeableReference ]
      attr_accessor :basedOn                # 0-* [ Reference(CarePlan|DeviceRequest|MedicationRequest|ServiceRequest|RequestOrchestration|NutritionOrder|VisionPrescription|ImmunizationRecommendation) ]
      attr_accessor :subject                # 0-1 Reference(Patient|Group)
      attr_accessor :participant            # 1-* [ Appointment::Participant ]
      attr_accessor :recurrenceId           # 0-1 positiveInt
      attr_accessor :occurrenceChanged      # 0-1 boolean
      attr_accessor :recurrenceTemplate     # 0-* [ Appointment::RecurrenceTemplate ]

      def resourceType
        'Appointment'
      end
    end
  end
end