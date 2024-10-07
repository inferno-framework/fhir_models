module FHIR
  module build.fhir.org
    class EnrollmentResponse < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['identifier', 'request', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'EnrollmentResponse.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'EnrollmentResponse.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'EnrollmentResponse.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'EnrollmentResponse.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'EnrollmentResponse.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'EnrollmentResponse.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'EnrollmentResponse.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'EnrollmentResponse.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'EnrollmentResponse.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'EnrollmentResponse.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/EnrollmentRequest'], 'type'=>'Reference', 'path'=>'EnrollmentResponse.request', 'min'=>0, 'max'=>1},
        'outcome' => {'valid_codes'=>{'http://hl7.org/fhir/enrollment-outcome'=>['queued', 'complete', 'error', 'partial']}, 'type'=>'code', 'path'=>'EnrollmentResponse.outcome', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/enrollment-outcome'}},
        'disposition' => {'type'=>'string', 'path'=>'EnrollmentResponse.disposition', 'min'=>0, 'max'=>1},
        'created' => {'type'=>'dateTime', 'path'=>'EnrollmentResponse.created', 'min'=>0, 'max'=>1},
        'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EnrollmentResponse.organization', 'min'=>0, 'max'=>1},
        'requestProvider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'EnrollmentResponse.requestProvider', 'min'=>0, 'max'=>1}
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
      attr_accessor :status            # 0-1 code
      attr_accessor :request           # 0-1 Reference(EnrollmentRequest)
      attr_accessor :outcome           # 0-1 code
      attr_accessor :disposition       # 0-1 string
      attr_accessor :created           # 0-1 dateTime
      attr_accessor :organization      # 0-1 Reference(Organization)
      attr_accessor :requestProvider   # 0-1 Reference(Practitioner|PractitionerRole|Organization)

      def resourceType
        'EnrollmentResponse'
      end
    end
  end
end