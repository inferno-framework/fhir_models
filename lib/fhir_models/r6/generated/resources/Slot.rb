module FHIR
  module R6
    class Slot < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['appointment-type', 'identifier', 'schedule', 'service-category', 'service-type', 'service-type-reference', 'specialty', 'start', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Slot.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Slot.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Slot.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Slot.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Slot.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Slot.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Slot.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Slot.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Slot.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'serviceCategory' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/service-category'=>['1', '2', '34', '3', '4', '5', '6', '7', '8', '36', '9', '10', '11', '12', '13', '14', '15', '16', '17', '35', '18', '19', '20', '21', '22', '38', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '37', '33']}, 'type'=>'CodeableConcept', 'path'=>'Slot.serviceCategory', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-category'}},
        'serviceType' => {'type'=>'CodeableReference', 'path'=>'Slot.serviceType', 'min'=>0, 'max'=>Float::INFINITY},
        'specialty' => {'valid_codes'=>{'http://snomed.info/sct'=>['408467006', '394577000', '394578005', '421661004', '408462000', '394579002', '394804000', '394580004', '394803006', '408480009', '408454008', '394809005', '394592004', '394600006', '394601005', '394581000', '408478003', '394812008', '408444009', '394582007', '408475000', '410005002', '394583002', '419772000', '394584008', '408443003', '394802001', '394915009', '394814009', '394808002', '394811001', '408446006', '394586005', '394916005', '408472002', '394597005', '394598000', '394807007', '419192003', '408468001', '394593009', '394813003', '410001006', '394589003', '394591006', '394599008', '394649004', '408470005', '394585009', '394821009', '422191005', '394594003', '416304004', '418960008', '394882004', '394806003', '394588006', '408459003', '394607009', '419610006', '418058008', '420208008', '418652005', '418535003', '418862001', '419365004', '418002000', '419983000', '419170002', '419472004', '394539006', '420112009', '409968004', '394587001', '394913002', '408440000', '418112009', '419815003', '394914008', '408455009', '394602003', '408447002', '394810000', '408450004', '408476004', '408469009', '408466002', '408471009', '408464004', '408441001', '408465003', '394605001', '394608004', '408461007', '408460008', '394606000', '408449004', '418018006', '394604002', '394609007', '408474001', '394610002', '394611003', '408477008', '394801008', '408463005', '419321007', '394576009', '394590007', '409967009', '408448007', '419043006', '394612005', '394733009', '394732004']}, 'type'=>'CodeableConcept', 'path'=>'Slot.specialty', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/c80-practice-codes'}},
        'appointmentType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0276'=>['ROUTINE', 'WALKIN', 'CHECKUP', 'FOLLOWUP', 'EMERGENCY']}, 'type'=>'CodeableConcept', 'path'=>'Slot.appointmentType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0276'}},
        'schedule' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Schedule'], 'type'=>'Reference', 'path'=>'Slot.schedule', 'min'=>1, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/slotstatus'=>['busy', 'free', 'busy-unavailable', 'busy-tentative', 'entered-in-error']}, 'type'=>'code', 'path'=>'Slot.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/slotstatus'}},
        'start' => {'type'=>'instant', 'path'=>'Slot.start', 'min'=>1, 'max'=>1},
        'end' => {'type'=>'instant', 'path'=>'Slot.end', 'min'=>1, 'max'=>1},
        'overbooked' => {'type'=>'boolean', 'path'=>'Slot.overbooked', 'min'=>0, 'max'=>1},
        'comment' => {'type'=>'string', 'path'=>'Slot.comment', 'min'=>0, 'max'=>1}
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
      attr_accessor :serviceCategory   # 0-* [ CodeableConcept ]
      attr_accessor :serviceType       # 0-* [ CodeableReference ]
      attr_accessor :specialty         # 0-* [ CodeableConcept ]
      attr_accessor :appointmentType   # 0-* [ CodeableConcept ]
      attr_accessor :schedule          # 1-1 Reference(Schedule)
      attr_accessor :status            # 1-1 code
      attr_accessor :start             # 1-1 instant
      attr_accessor :end               # 1-1 instant
      attr_accessor :overbooked        # 0-1 boolean
      attr_accessor :comment           # 0-1 string

      def resourceType
        'Slot'
      end
    end
  end
end