module FHIR
  module build.fhir.org
    class EpisodeOfCare < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['care-manager', 'date', 'diagnosis-code', 'diagnosis-reference', 'identifier', 'incoming-referral', 'organization', 'patient', 'reason-code', 'reason-reference', 'status', 'subject', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'EpisodeOfCare.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'EpisodeOfCare.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'EpisodeOfCare.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'EpisodeOfCare.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'EpisodeOfCare.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'EpisodeOfCare.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'EpisodeOfCare.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'EpisodeOfCare.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'EpisodeOfCare.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/episode-of-care-status'=>['planned', 'waitlist', 'active', 'onhold', 'finished', 'cancelled', 'entered-in-error']}, 'type'=>'code', 'path'=>'EpisodeOfCare.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/episode-of-care-status'}},
        'statusHistory' => {'type'=>'EpisodeOfCare::StatusHistory', 'path'=>'EpisodeOfCare.statusHistory', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/episodeofcare-type'=>['hacc', 'pac', 'diab', 'da', 'cacp']}, 'type'=>'CodeableConcept', 'path'=>'EpisodeOfCare.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/episodeofcare-type'}},
        'reason' => {'type'=>'EpisodeOfCare::Reason', 'path'=>'EpisodeOfCare.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosis' => {'type'=>'EpisodeOfCare::Diagnosis', 'path'=>'EpisodeOfCare.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.subject', 'min'=>1, 'max'=>1},
        'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.managingOrganization', 'min'=>0, 'max'=>1},
        'period' => {'type'=>'Period', 'path'=>'EpisodeOfCare.period', 'min'=>0, 'max'=>1},
        'referralRequest' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.referralRequest', 'min'=>0, 'max'=>Float::INFINITY},
        'careManager' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.careManager', 'min'=>0, 'max'=>1},
        'careTeam' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.careTeam', 'min'=>0, 'max'=>Float::INFINITY},
        'account' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Account'], 'type'=>'Reference', 'path'=>'EpisodeOfCare.account', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class StatusHistory < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'StatusHistory.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'StatusHistory.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'StatusHistory.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'status' => {'valid_codes'=>{'http://hl7.org/fhir/episode-of-care-status'=>['planned', 'waitlist', 'active', 'onhold', 'finished', 'cancelled', 'entered-in-error']}, 'type'=>'code', 'path'=>'StatusHistory.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/episode-of-care-status'}},
          'period' => {'type'=>'Period', 'path'=>'StatusHistory.period', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :status            # 1-1 code
        attr_accessor :period            # 1-1 Period
      end

      class Reason < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Reason.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Reason.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Reason.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'use' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-reason-use'=>['CC', 'HC', 'AD', 'RV', 'HM']}, 'type'=>'CodeableConcept', 'path'=>'Reason.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-reason-use'}},
          'value' => {'type'=>'CodeableReference', 'path'=>'Reason.value', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :use               # 0-1 CodeableConcept
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
          'use' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-diagnosis-use'=>['working', 'final']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.use', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-diagnosis-use'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :condition         # 0-* [ CodeableReference ]
        attr_accessor :use               # 0-1 CodeableConcept
      end

      attr_accessor :id                   # 0-1 id
      attr_accessor :meta                 # 0-1 Meta
      attr_accessor :implicitRules        # 0-1 uri
      attr_accessor :language             # 0-1 code
      attr_accessor :text                 # 0-1 Narrative
      attr_accessor :contained            # 0-* [ Resource ]
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :identifier           # 0-* [ Identifier ]
      attr_accessor :status               # 1-1 code
      attr_accessor :statusHistory        # 0-* [ EpisodeOfCare::StatusHistory ]
      attr_accessor :type                 # 0-* [ CodeableConcept ]
      attr_accessor :reason               # 0-* [ EpisodeOfCare::Reason ]
      attr_accessor :diagnosis            # 0-* [ EpisodeOfCare::Diagnosis ]
      attr_accessor :subject              # 1-1 Reference(Patient|Group)
      attr_accessor :managingOrganization # 0-1 Reference(Organization)
      attr_accessor :period               # 0-1 Period
      attr_accessor :referralRequest      # 0-* [ Reference(ServiceRequest) ]
      attr_accessor :careManager          # 0-1 Reference(Practitioner|PractitionerRole)
      attr_accessor :careTeam             # 0-* [ Reference(CareTeam) ]
      attr_accessor :account              # 0-* [ Reference(Account) ]

      def resourceType
        'EpisodeOfCare'
      end
    end
  end
end