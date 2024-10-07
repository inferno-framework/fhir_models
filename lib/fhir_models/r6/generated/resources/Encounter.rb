module FHIR
  module R6
    class Encounter < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['account', 'appointment', 'based-on', 'careteam', 'class', 'date', 'date-start', 'diagnosis-code', 'diagnosis-reference', 'end-date', 'episode-of-care', 'identifier', 'length', 'location', 'location-period', 'location-value-period', 'part-of', 'participant', 'participant-type', 'patient', 'practitioner', 'reason-code', 'reason-reference', 'service-provider', 'special-arrangement', 'status', 'subject', 'subject-status', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Encounter.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Encounter.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Encounter.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Encounter.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Encounter.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Encounter.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Encounter.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Encounter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Encounter.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-status'=>['planned', 'in-progress', 'on-hold', 'discharged', 'completed', 'cancelled', 'discontinued', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'Encounter.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-status'}},
        'class' => {'local_name'=>'local_class', 'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['IMP', 'AMB', 'OBSENC', 'EMER', 'VR', 'HH']}, 'type'=>'CodeableConcept', 'path'=>'Encounter.class', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/encounter-class'}},
        'priority' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActPriority'=>['A', 'CR', 'EL', 'EM', 'P', 'PRN', 'R', 'RR', 'S', 'T', 'UD', 'UR', 'CS', 'CSP', 'CSR']}, 'type'=>'CodeableConcept', 'path'=>'Encounter.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ActPriority'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/encounter-type'=>['ADMS', 'BD/BM-clin', 'CCS60', 'OKI']}, 'type'=>'CodeableConcept', 'path'=>'Encounter.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-type'}},
        'serviceType' => {'type'=>'CodeableReference', 'path'=>'Encounter.serviceType', 'min'=>0, 'max'=>Float::INFINITY},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'Encounter.subject', 'min'=>0, 'max'=>1},
        'subjectStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/encounter-subject-status'=>['arrived', 'triaged', 'receiving-care', 'on-leave', 'departed']}, 'type'=>'CodeableConcept', 'path'=>'Encounter.subjectStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-subject-status'}},
        'episodeOfCare' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EpisodeOfCare'], 'type'=>'Reference', 'path'=>'Encounter.episodeOfCare', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/RequestOrchestration', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation'], 'type'=>'Reference', 'path'=>'Encounter.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'careTeam' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'Encounter.careTeam', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Encounter.partOf', 'min'=>0, 'max'=>1},
        'serviceProvider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Encounter.serviceProvider', 'min'=>0, 'max'=>1},
        'participant' => {'type'=>'Encounter::Participant', 'path'=>'Encounter.participant', 'min'=>0, 'max'=>Float::INFINITY},
        'appointment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Appointment'], 'type'=>'Reference', 'path'=>'Encounter.appointment', 'min'=>0, 'max'=>Float::INFINITY},
        'virtualService' => {'type'=>'VirtualServiceDetail', 'path'=>'Encounter.virtualService', 'min'=>0, 'max'=>Float::INFINITY},
        'actualPeriod' => {'type'=>'Period', 'path'=>'Encounter.actualPeriod', 'min'=>0, 'max'=>1},
        'plannedStartDate' => {'type'=>'dateTime', 'path'=>'Encounter.plannedStartDate', 'min'=>0, 'max'=>1},
        'plannedEndDate' => {'type'=>'dateTime', 'path'=>'Encounter.plannedEndDate', 'min'=>0, 'max'=>1},
        'length' => {'type'=>'Duration', 'path'=>'Encounter.length', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'Encounter::Reason', 'path'=>'Encounter.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosis' => {'type'=>'Encounter::Diagnosis', 'path'=>'Encounter.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
        'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'Encounter.account', 'min'=>0, 'max'=>Float::INFINITY},
        'dietPreference' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/diet'=>['vegetarian', 'dairy-free', 'nut-free', 'gluten-free', 'vegan', 'halal', 'kosher']}, 'type'=>'CodeableConcept', 'path'=>'Encounter.dietPreference', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-diet'}},
        'specialArrangement' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/encounter-special-arrangements'=>['wheel', 'add-bed', 'int', 'att', 'dog']}, 'type'=>'CodeableConcept', 'path'=>'Encounter.specialArrangement', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-special-arrangements'}},
        'specialCourtesy' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-EncounterSpecialCourtesy'=>['EXT', 'NRM', 'PRF', 'STF', 'VIP'], 'http://terminology.hl7.org/CodeSystem/v3-NullFlavor'=>['UNK']}, 'type'=>'CodeableConcept', 'path'=>'Encounter.specialCourtesy', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-special-courtesy'}},
        'admission' => {'type'=>'Encounter::Admission', 'path'=>'Encounter.admission', 'min'=>0, 'max'=>1},
        'location' => {'type'=>'Encounter::Location', 'path'=>'Encounter.location', 'min'=>0, 'max'=>Float::INFINITY}
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
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'Participant.actor', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-* [ CodeableConcept ]
        attr_accessor :period            # 0-1 Period
        attr_accessor :actor             # 0-1 Reference(Patient|Group|RelatedPerson|Practitioner|PractitionerRole|Device|HealthcareService)
      end

      class Reason < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Reason.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Reason.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Reason.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'use' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-reason-use'=>['CC', 'HC', 'AD', 'RV', 'HM']}, 'type'=>'CodeableConcept', 'path'=>'Reason.use', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-reason-use'}},
          'value' => {'type'=>'CodeableReference', 'path'=>'Reason.value', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :use               # 0-* [ CodeableConcept ]
        attr_accessor :value             # 0-* [ CodeableReference ]
      end

      class Diagnosis < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'condition' => {'type'=>'CodeableReference', 'path'=>'Diagnosis.condition', 'min'=>0, 'max'=>Float::INFINITY},
          'use' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-diagnosis-use'=>['working', 'final']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.use', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-diagnosis-use'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :condition         # 0-* [ CodeableReference ]
        attr_accessor :use               # 0-* [ CodeableConcept ]
      end

      class Admission < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Admission.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Admission.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Admission.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'preAdmissionIdentifier' => {'type'=>'Identifier', 'path'=>'Admission.preAdmissionIdentifier', 'min'=>0, 'max'=>1},
          'origin' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Admission.origin', 'min'=>0, 'max'=>1},
          'admitSource' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/admit-source'=>['hosp-trans', 'emd', 'outp', 'born', 'gp', 'mp', 'nursing', 'psych', 'rehab', 'other']}, 'type'=>'CodeableConcept', 'path'=>'Admission.admitSource', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-admit-source'}},
          'reAdmission' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0092'=>['R']}, 'type'=>'CodeableConcept', 'path'=>'Admission.reAdmission', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0092'}},
          'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Admission.destination', 'min'=>0, 'max'=>1},
          'dischargeDisposition' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/discharge-disposition'=>['home', 'alt-home', 'other-hcf', 'hosp', 'long', 'aadvice', 'exp', 'psy', 'rehab', 'snf', 'oth']}, 'type'=>'CodeableConcept', 'path'=>'Admission.dischargeDisposition', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-discharge-disposition'}}
        }

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :preAdmissionIdentifier # 0-1 Identifier
        attr_accessor :origin                 # 0-1 Reference(Location|Organization)
        attr_accessor :admitSource            # 0-1 CodeableConcept
        attr_accessor :reAdmission            # 0-1 CodeableConcept
        attr_accessor :destination            # 0-1 Reference(Location|Organization)
        attr_accessor :dischargeDisposition   # 0-1 CodeableConcept
      end

      class Location < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Location.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Location.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Location.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Location.location', 'min'=>1, 'max'=>1},
          'status' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-location-status'=>['planned', 'active', 'reserved', 'completed']}, 'type'=>'code', 'path'=>'Location.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-location-status'}},
          'form' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/location-physical-type'=>['si', 'bu', 'wi', 'wa', 'lvl', 'co', 'ro', 'bd', 've', 'ho', 'ca', 'rd', 'area', 'jdn', 'vi']}, 'type'=>'CodeableConcept', 'path'=>'Location.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/location-form'}},
          'period' => {'type'=>'Period', 'path'=>'Location.period', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :location          # 1-1 Reference(Location)
        attr_accessor :status            # 0-1 code
        attr_accessor :form              # 0-1 CodeableConcept
        attr_accessor :period            # 0-1 Period
      end

      attr_accessor :id                 # 0-1 id
      attr_accessor :meta               # 0-1 Meta
      attr_accessor :implicitRules      # 0-1 uri
      attr_accessor :language           # 0-1 code
      attr_accessor :text               # 0-1 Narrative
      attr_accessor :contained          # 0-* [ Resource ]
      attr_accessor :extension          # 0-* [ Extension ]
      attr_accessor :modifierExtension  # 0-* [ Extension ]
      attr_accessor :identifier         # 0-* [ Identifier ]
      attr_accessor :status             # 1-1 code
      attr_accessor :local_class        # 0-* [ CodeableConcept ]
      attr_accessor :priority           # 0-1 CodeableConcept
      attr_accessor :type               # 0-* [ CodeableConcept ]
      attr_accessor :serviceType        # 0-* [ CodeableReference ]
      attr_accessor :subject            # 0-1 Reference(Patient|Group)
      attr_accessor :subjectStatus      # 0-1 CodeableConcept
      attr_accessor :episodeOfCare      # 0-* [ Reference(EpisodeOfCare) ]
      attr_accessor :basedOn            # 0-* [ Reference(CarePlan|DeviceRequest|MedicationRequest|ServiceRequest|RequestOrchestration|NutritionOrder|VisionPrescription|ImmunizationRecommendation) ]
      attr_accessor :careTeam           # 0-* [ Reference(CareTeam) ]
      attr_accessor :partOf             # 0-1 Reference(Encounter)
      attr_accessor :serviceProvider    # 0-1 Reference(Organization)
      attr_accessor :participant        # 0-* [ Encounter::Participant ]
      attr_accessor :appointment        # 0-* [ Reference(Appointment) ]
      attr_accessor :virtualService     # 0-* [ VirtualServiceDetail ]
      attr_accessor :actualPeriod       # 0-1 Period
      attr_accessor :plannedStartDate   # 0-1 dateTime
      attr_accessor :plannedEndDate     # 0-1 dateTime
      attr_accessor :length             # 0-1 Duration
      attr_accessor :reason             # 0-* [ Encounter::Reason ]
      attr_accessor :diagnosis          # 0-* [ Encounter::Diagnosis ]
      attr_accessor :account            # 0-* [ Reference(Account) ]
      attr_accessor :dietPreference     # 0-* [ CodeableConcept ]
      attr_accessor :specialArrangement # 0-* [ CodeableConcept ]
      attr_accessor :specialCourtesy    # 0-* [ CodeableConcept ]
      attr_accessor :admission          # 0-1 Encounter::Admission
      attr_accessor :location           # 0-* [ Encounter::Location ]

      def resourceType
        'Encounter'
      end
    end
  end
end