module FHIR
  module build.fhir.org
    class EncounterHistory < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['encounter', 'identifier', 'patient', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'EncounterHistory.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'EncounterHistory.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'EncounterHistory.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'EncounterHistory.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'EncounterHistory.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'EncounterHistory.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'EncounterHistory.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'EncounterHistory.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'EncounterHistory.encounter', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'EncounterHistory.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/encounter-status'=>['planned', 'in-progress', 'on-hold', 'discharged', 'completed', 'cancelled', 'discontinued', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'EncounterHistory.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-status'}},
        'class' => {'local_name'=>'local_class', 'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['AMB', 'EMER', 'FLD', 'HH', 'IMP', 'ACUTE', 'NONAC', 'OBSENC', 'PRENC', 'SS', 'VR']}, 'type'=>'CodeableConcept', 'path'=>'EncounterHistory.class', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ActEncounterCode'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/encounter-type'=>['ADMS', 'BD/BM-clin', 'CCS60', 'OKI']}, 'type'=>'CodeableConcept', 'path'=>'EncounterHistory.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-type'}},
        'serviceType' => {'type'=>'CodeableReference', 'path'=>'EncounterHistory.serviceType', 'min'=>0, 'max'=>Float::INFINITY},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'EncounterHistory.subject', 'min'=>0, 'max'=>1},
        'subjectStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/encounter-subject-status'=>['arrived', 'triaged', 'receiving-care', 'on-leave', 'departed']}, 'type'=>'CodeableConcept', 'path'=>'EncounterHistory.subjectStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-subject-status'}},
        'actualPeriod' => {'type'=>'Period', 'path'=>'EncounterHistory.actualPeriod', 'min'=>0, 'max'=>1},
        'plannedStartDate' => {'type'=>'dateTime', 'path'=>'EncounterHistory.plannedStartDate', 'min'=>0, 'max'=>1},
        'plannedEndDate' => {'type'=>'dateTime', 'path'=>'EncounterHistory.plannedEndDate', 'min'=>0, 'max'=>1},
        'length' => {'type'=>'Duration', 'path'=>'EncounterHistory.length', 'min'=>0, 'max'=>1},
        'location' => {'type'=>'EncounterHistory::Location', 'path'=>'EncounterHistory.location', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Location < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Location.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Location.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Location.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Location.location', 'min'=>1, 'max'=>1},
          'form' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/location-physical-type'=>['si', 'bu', 'wi', 'wa', 'lvl', 'co', 'ro', 'bd', 've', 'ho', 'ca', 'rd', 'area', 'jdn', 'vi']}, 'type'=>'CodeableConcept', 'path'=>'Location.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/location-form'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :location          # 1-1 Reference(Location)
        attr_accessor :form              # 0-1 CodeableConcept
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :encounter         # 0-1 Reference(Encounter)
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :status            # 1-1 code
      attr_accessor :local_class       # 1-1 CodeableConcept
      attr_accessor :type              # 0-* [ CodeableConcept ]
      attr_accessor :serviceType       # 0-* [ CodeableReference ]
      attr_accessor :subject           # 0-1 Reference(Patient|Group)
      attr_accessor :subjectStatus     # 0-1 CodeableConcept
      attr_accessor :actualPeriod      # 0-1 Period
      attr_accessor :plannedStartDate  # 0-1 dateTime
      attr_accessor :plannedEndDate    # 0-1 dateTime
      attr_accessor :length            # 0-1 Duration
      attr_accessor :location          # 0-* [ EncounterHistory::Location ]

      def resourceType
        'EncounterHistory'
      end
    end
  end
end