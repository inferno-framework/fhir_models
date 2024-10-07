module FHIR
  module build.fhir.org
    class MedicationStatement < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'effective' => ['dateTime', 'Period', 'Timing']
      }
      SEARCH_PARAMS = ['adherence', 'category', 'code', 'effective', 'encounter', 'identifier', 'medication', 'patient', 'source', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MedicationStatement.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MedicationStatement.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MedicationStatement.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'MedicationStatement.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MedicationStatement.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MedicationStatement.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MedicationStatement.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationStatement.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MedicationStatement.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/MedicationStatement'], 'type'=>'Reference', 'path'=>'MedicationStatement.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medication-statement-status'=>['recorded', 'entered-in-error', 'draft']}, 'type'=>'code', 'path'=>'MedicationStatement.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-statement-status'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location'=>['inpatient', 'outpatient', 'community']}, 'type'=>'CodeableConcept', 'path'=>'MedicationStatement.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationrequest-admin-location'}},
        'medication' => {'type'=>'CodeableReference', 'path'=>'MedicationStatement.medication', 'min'=>1, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationStatement.subject', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'MedicationStatement.encounter', 'min'=>0, 'max'=>1},
        'effectiveDateTime' => {'type'=>'dateTime', 'path'=>'MedicationStatement.effective[x]', 'min'=>0, 'max'=>1},
        'effectivePeriod' => {'type'=>'Period', 'path'=>'MedicationStatement.effective[x]', 'min'=>0, 'max'=>1},
        'effectiveTiming' => {'type'=>'Timing', 'path'=>'MedicationStatement.effective[x]', 'min'=>0, 'max'=>1},
        'dateAsserted' => {'type'=>'dateTime', 'path'=>'MedicationStatement.dateAsserted', 'min'=>0, 'max'=>1},
        'informationSource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MedicationStatement.informationSource', 'min'=>0, 'max'=>Float::INFINITY},
        'derivedFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationStatement.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'type'=>'CodeableReference', 'path'=>'MedicationStatement.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'MedicationStatement.note', 'min'=>0, 'max'=>Float::INFINITY},
        'relatedClinicalInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Observation', 'http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'MedicationStatement.relatedClinicalInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'renderedDosageInstruction' => {'type'=>'markdown', 'path'=>'MedicationStatement.renderedDosageInstruction', 'min'=>0, 'max'=>1},
        'dosage' => {'type'=>'Dosage', 'path'=>'MedicationStatement.dosage', 'min'=>0, 'max'=>Float::INFINITY},
        'adherence' => {'type'=>'MedicationStatement::Adherence', 'path'=>'MedicationStatement.adherence', 'min'=>0, 'max'=>1}
      }

      class Adherence < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Adherence.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Adherence.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Adherence.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medication-statement-adherence'=>['taking', 'taking-as-directed', 'taking-not-as-directed', 'not-taking', 'on-hold', 'on-hold-as-directed', 'on-hold-not-as-directed', 'stopped', 'stopped-as-directed', 'stopped-not-as-directed', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'Adherence.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-statement-adherence'}},
          'reason' => {'valid_codes'=>{'http://snomed.info/sct'=>['266710000', '182862001', '182863006', '182864000', '182865004', '182868002', '182869005', '182870006', '182871005', '182872003', '182873008', '182874002', '266711001', '275929009', '12371000175103', '410684002', '134390006', '134397009', '135794007', '135795008', '135796009', '135798005', '135799002', '135800003', '135801004', '135803001', '161646004', '161647008', '161648003', '161649006', '161650006', '161652003', '161653008', '170622002', '170624001', '170688000', '170689008', '170919001', '170920007', '170954008', '170955009', '170958006', '182834008', '182840001', '182841002', '182842009', '182843004', '182844005', '182845006', '182846007', '274512008', '309632008', '309841001', '312451002', '315020006', '315022003', '315023008', '315062004', '315364008', '390914001', '391158008', '391159000', '394888000', '394987009', '395006008', '395007004', '395008009', '395009001', '395176007', '401084003', '401244004', '407572003', '408339001', '408354007', '408355008', '408795007', '412782003', '413555000', '413558003', '413559006', '413560001', '416126007', '416404000', '417576009', '430279008', '438553004', '439631004', '440935004', '440991005', '441195008', '441196009', '441899004', '473151000', '698428006', '698449007', '698459008', '698460003', '698468005', '698758004', '699008007', '699137009', '700110004', '700384008', '702542006', '703989007', '703991004', '703996009', '703997000', '703999002', '704000000', '704033005', '704047009', '707298000', '708000007', '710159007', '710814002', '710815001', '710816000', '710817009', '711149003', '711150003', '711370000', '711436000', '720971004', '721872002', '736004008', '736006005', '736799004', '763323007', '763897009', '764639002', '787928003', '787930001', '840596001', '840597005', '840598000', '897019004', '897020005', '897021009', '897022002', '7611000175100', '11281000175101', '21651000175103', '21681000175107', '53081000119101', '61251000119108', '61261000119105', '69521000119101', '98001000119105', '106511000119106', '106521000119104', '106531000119101', '106571000119103', '106581000119100', '106631000119102', '106691000119103', '106701000119103', '113481000119108', '113491000119106', '113521000119108', '113531000119106', '113541000119102', '117431000119101', '118901000119102', '118911000119104', '118921000119106', '118931000119109', '122621000119109', '123371000119105', '123971000119106', '123981000119109', '125211000119106', '126951000119109', '127721000119100', '130721000119103', '131531000119103', '133621000119103', '134651000119108', '134671000119104', '139181000119106', '140301000119107', '140561000119102', '141381000119105', '150881000119107', '328941000119101', '329061000119105', '329071000119104', '347841000119106', '672601000119103', '11012701000119107', '11012741000119109', '12275951000119104', '12384021000119106', '15625371000119108', '15625411000119109', '15625451000119105', '15929341000119102', '15929381000119107', '15929421000119103', '15929461000119108', '15929581000119100', '16234971000119108', '16526761000119100', '16659291000119100', '16755631000119109', '16755671000119107', '16772161000119102', '16772201000119107', '16863441000119108', '16863481000119103', '70732231000132107', '548197911000119104']}, 'type'=>'CodeableConcept', 'path'=>'Adherence.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/reason-medication-status-codes'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :code              # 1-1 CodeableConcept
        attr_accessor :reason            # 0-1 CodeableConcept
      end

      attr_accessor :id                         # 0-1 id
      attr_accessor :meta                       # 0-1 Meta
      attr_accessor :implicitRules              # 0-1 uri
      attr_accessor :language                   # 0-1 code
      attr_accessor :text                       # 0-1 Narrative
      attr_accessor :contained                  # 0-* [ Resource ]
      attr_accessor :extension                  # 0-* [ Extension ]
      attr_accessor :modifierExtension          # 0-* [ Extension ]
      attr_accessor :identifier                 # 0-* [ Identifier ]
      attr_accessor :partOf                     # 0-* [ Reference(Procedure|MedicationStatement) ]
      attr_accessor :status                     # 1-1 code
      attr_accessor :category                   # 0-* [ CodeableConcept ]
      attr_accessor :medication                 # 1-1 CodeableReference
      attr_accessor :subject                    # 1-1 Reference(Patient|Group)
      attr_accessor :encounter                  # 0-1 Reference(Encounter)
      attr_accessor :effectiveDateTime          # 0-1 dateTime
      attr_accessor :effectivePeriod            # 0-1 Period
      attr_accessor :effectiveTiming            # 0-1 Timing
      attr_accessor :dateAsserted               # 0-1 dateTime
      attr_accessor :informationSource          # 0-* [ Reference(Device|Patient|Practitioner|PractitionerRole|RelatedPerson|Organization) ]
      attr_accessor :derivedFrom                # 0-* [ Reference(Resource) ]
      attr_accessor :reason                     # 0-* [ CodeableReference ]
      attr_accessor :note                       # 0-* [ Annotation ]
      attr_accessor :relatedClinicalInformation # 0-* [ Reference(Observation|Condition) ]
      attr_accessor :renderedDosageInstruction  # 0-1 markdown
      attr_accessor :dosage                     # 0-* [ Dosage ]
      attr_accessor :adherence                  # 0-1 MedicationStatement::Adherence

      def resourceType
        'MedicationStatement'
      end
    end
  end
end