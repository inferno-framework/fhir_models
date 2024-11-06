module FHIR
  module R6
    class ImmunizationEvaluation < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['date', 'dose-status', 'identifier', 'immunization-event', 'patient', 'status', 'target-disease']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ImmunizationEvaluation.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ImmunizationEvaluation.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ImmunizationEvaluation.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ImmunizationEvaluation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ImmunizationEvaluation.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ImmunizationEvaluation.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ImmunizationEvaluation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ImmunizationEvaluation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'ImmunizationEvaluation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medication-admin-status'=>['completed', 'entered-in-error']}, 'type'=>'code', 'path'=>'ImmunizationEvaluation.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-evaluation-status'}},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImmunizationEvaluation.patient', 'min'=>1, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'ImmunizationEvaluation.date', 'min'=>0, 'max'=>1},
        'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ImmunizationEvaluation.authority', 'min'=>0, 'max'=>1},
        'targetDisease' => {'valid_codes'=>{'http://snomed.info/sct'=>['397428000', '27836007', '76902006', '721764008', '14189004', '36989005', '36653000', '16814004', '23511006', '709410003', '56717001', '363354003', '266113007', '415822001', '66071002', '40468003', '7111000119109', '719590007', '719865001', '38907003', '4740000', '55735004', '240613006', '4834000', '85904008', '63650001', '16541001', '38362002', '61462000', '14168008', '186772009', '712986001', '52947006', '186788009', '409498004', '58750007', '19265001', '23502006', '75702008', '80612004', '186747009', '67924001', '70090004']}, 'type'=>'CodeableConcept', 'path'=>'ImmunizationEvaluation.targetDisease', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-target-disease'}},
        'immunizationEvent' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Immunization'], 'type'=>'Reference', 'path'=>'ImmunizationEvaluation.immunizationEvent', 'min'=>1, 'max'=>1},
        'doseStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/immunization-evaluation-dose-status'=>['valid', 'notvalid']}, 'type'=>'CodeableConcept', 'path'=>'ImmunizationEvaluation.doseStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-evaluation-dose-status'}},
        'doseStatusReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/immunization-evaluation-dose-status-reason'=>['partialdose', 'coldchainbreak', 'recall', 'adversestorage', 'expired', 'outsideschedule']}, 'type'=>'CodeableConcept', 'path'=>'ImmunizationEvaluation.doseStatusReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-evaluation-dose-status-reason'}},
        'description' => {'type'=>'markdown', 'path'=>'ImmunizationEvaluation.description', 'min'=>0, 'max'=>1},
        'series' => {'type'=>'string', 'path'=>'ImmunizationEvaluation.series', 'min'=>0, 'max'=>1},
        'doseNumber' => {'type'=>'string', 'path'=>'ImmunizationEvaluation.doseNumber', 'min'=>0, 'max'=>1},
        'seriesDoses' => {'type'=>'string', 'path'=>'ImmunizationEvaluation.seriesDoses', 'min'=>0, 'max'=>1}
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
      attr_accessor :status            # 1-1 code
      attr_accessor :patient           # 1-1 Reference(Patient)
      attr_accessor :date              # 0-1 dateTime
      attr_accessor :authority         # 0-1 Reference(Organization)
      attr_accessor :targetDisease     # 1-1 CodeableConcept
      attr_accessor :immunizationEvent # 1-1 Reference(Immunization)
      attr_accessor :doseStatus        # 1-1 CodeableConcept
      attr_accessor :doseStatusReason  # 0-* [ CodeableConcept ]
      attr_accessor :description       # 0-1 markdown
      attr_accessor :series            # 0-1 string
      attr_accessor :doseNumber        # 0-1 string
      attr_accessor :seriesDoses       # 0-1 string

      def resourceType
        'ImmunizationEvaluation'
      end
    end
  end
end