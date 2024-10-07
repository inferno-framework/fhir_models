module FHIR
  module build.fhir.org
    class AppointmentResponse < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['actor', 'appointment', 'group', 'identifier', 'location', 'part-status', 'patient', 'practitioner']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'AppointmentResponse.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'AppointmentResponse.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'AppointmentResponse.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'AppointmentResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'AppointmentResponse.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'AppointmentResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'AppointmentResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'AppointmentResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'AppointmentResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'appointment' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Appointment'], 'type'=>'Reference', 'path'=>'AppointmentResponse.appointment', 'min'=>1, 'max'=>1},
        'proposedNewTime' => {'type'=>'boolean', 'path'=>'AppointmentResponse.proposedNewTime', 'min'=>0, 'max'=>1},
        'start' => {'type'=>'instant', 'path'=>'AppointmentResponse.start', 'min'=>0, 'max'=>1},
        'end' => {'type'=>'instant', 'path'=>'AppointmentResponse.end', 'min'=>0, 'max'=>1},
        'participantType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationType'=>['ADM', 'ATND', 'CALLBCK', 'CON', 'DIS', 'ESC', 'REF'], 'http://terminology.hl7.org/CodeSystem/participant-type'=>['translator', 'emergency']}, 'type'=>'CodeableConcept', 'path'=>'AppointmentResponse.participantType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/encounter-participant-type'}},
        'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'AppointmentResponse.actor', 'min'=>0, 'max'=>1},
        'participantStatus' => {'valid_codes'=>{'http://hl7.org/fhir/participationstatus'=>['accepted', 'declined', 'tentative', 'needs-action'], 'http://hl7.org/fhir/appointmentstatus'=>['entered-in-error']}, 'type'=>'code', 'path'=>'AppointmentResponse.participantStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/appointmentresponse-status'}},
        'comment' => {'type'=>'markdown', 'path'=>'AppointmentResponse.comment', 'min'=>0, 'max'=>1},
        'recurring' => {'type'=>'boolean', 'path'=>'AppointmentResponse.recurring', 'min'=>0, 'max'=>1},
        'occurrenceDate' => {'type'=>'date', 'path'=>'AppointmentResponse.occurrenceDate', 'min'=>0, 'max'=>1},
        'recurrenceId' => {'type'=>'positiveInt', 'path'=>'AppointmentResponse.recurrenceId', 'min'=>0, 'max'=>1}
      }

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :appointment       # 1-1 Reference(Appointment)
      attr_accessor :proposedNewTime   # 0-1 boolean
      attr_accessor :start             # 0-1 instant
      attr_accessor :end               # 0-1 instant
      attr_accessor :participantType   # 0-* [ CodeableConcept ]
      attr_accessor :actor             # 0-1 Reference(Patient|Group|Practitioner|PractitionerRole|RelatedPerson|Device|HealthcareService|Location)
      attr_accessor :participantStatus # 1-1 code
      attr_accessor :comment           # 0-1 markdown
      attr_accessor :recurring         # 0-1 boolean
      attr_accessor :occurrenceDate    # 0-1 date
      attr_accessor :recurrenceId      # 0-1 positiveInt

      def resourceType
        'AppointmentResponse'
      end
    end
  end
end