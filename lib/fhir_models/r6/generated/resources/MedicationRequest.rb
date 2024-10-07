module FHIR
  module R6
    class MedicationRequest < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['authoredon', 'category', 'code', 'combo-date', 'encounter', 'group-identifier', 'identifier', 'intended-dispenser', 'intended-performer', 'intended-performertype', 'intent', 'medication', 'patient', 'priority', 'requester', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MedicationRequest.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MedicationRequest.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MedicationRequest.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'MedicationRequest.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MedicationRequest.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MedicationRequest.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MedicationRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MedicationRequest.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation', 'http://hl7.org/fhir/StructureDefinition/RequestOrchestration'], 'type'=>'Reference', 'path'=>'MedicationRequest.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'priorPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'MedicationRequest.priorPrescription', 'min'=>0, 'max'=>1},
        'groupIdentifier' => {'type'=>'Identifier', 'path'=>'MedicationRequest.groupIdentifier', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medicationrequest-status'=>['active', 'on-hold', 'ended', 'stopped', 'completed', 'cancelled', 'entered-in-error', 'draft', 'unknown']}, 'type'=>'code', 'path'=>'MedicationRequest.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationrequest-status'}},
        'statusReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/medicationrequest-status-reason'=>['altchoice', 'clarif', 'drughigh', 'hospadm', 'labint', 'non-avail', 'preg', 'salg', 'sddi', 'sdupther', 'sintol', 'surg', 'washout']}, 'type'=>'CodeableConcept', 'path'=>'MedicationRequest.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationrequest-status-reason'}},
        'statusChanged' => {'type'=>'dateTime', 'path'=>'MedicationRequest.statusChanged', 'min'=>0, 'max'=>1},
        'intent' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medicationrequest-intent'=>['proposal', 'plan', 'order', 'original-order', 'reflex-order', 'filler-order', 'instance-order', 'option']}, 'type'=>'code', 'path'=>'MedicationRequest.intent', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationrequest-intent'}},
        'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/medicationrequest-admin-location'=>['inpatient', 'outpatient', 'community']}, 'type'=>'CodeableConcept', 'path'=>'MedicationRequest.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationrequest-admin-location'}},
        'priority' => {'valid_codes'=>{'http://hl7.org/fhir/request-priority'=>['routine', 'urgent', 'asap', 'stat']}, 'type'=>'code', 'path'=>'MedicationRequest.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/request-priority'}},
        'doNotPerform' => {'type'=>'boolean', 'path'=>'MedicationRequest.doNotPerform', 'min'=>0, 'max'=>1},
        'medication' => {'type'=>'CodeableReference', 'path'=>'MedicationRequest.medication', 'min'=>1, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationRequest.subject', 'min'=>1, 'max'=>1},
        'informationSource' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'MedicationRequest.informationSource', 'min'=>0, 'max'=>Float::INFINITY},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'MedicationRequest.encounter', 'min'=>0, 'max'=>1},
        'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationRequest.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'authoredOn' => {'type'=>'dateTime', 'path'=>'MedicationRequest.authoredOn', 'min'=>0, 'max'=>1},
        'requester' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'MedicationRequest.requester', 'min'=>0, 'max'=>1},
        'reported' => {'type'=>'boolean', 'path'=>'MedicationRequest.reported', 'min'=>0, 'max'=>1},
        'performerType' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medication-intended-performer-role'=>['registerednurse', 'oncologynurse', 'paincontrolnurse', 'physician', 'pharmacist']}, 'type'=>'CodeableConcept', 'path'=>'MedicationRequest.performerType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-intended-performer-role'}},
        'performer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/DeviceDefinition', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'MedicationRequest.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'device' => {'type'=>'CodeableReference', 'path'=>'MedicationRequest.device', 'min'=>0, 'max'=>Float::INFINITY},
        'recorder' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'MedicationRequest.recorder', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'CodeableReference', 'path'=>'MedicationRequest.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'courseOfTherapyType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy'=>['continuous', 'acute', 'seasonal']}, 'type'=>'CodeableConcept', 'path'=>'MedicationRequest.courseOfTherapyType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationrequest-course-of-therapy'}},
        'insurance' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage', 'http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'MedicationRequest.insurance', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'MedicationRequest.note', 'min'=>0, 'max'=>Float::INFINITY},
        'renderedDosageInstruction' => {'type'=>'markdown', 'path'=>'MedicationRequest.renderedDosageInstruction', 'min'=>0, 'max'=>1},
        'effectiveDosePeriod' => {'type'=>'Period', 'path'=>'MedicationRequest.effectiveDosePeriod', 'min'=>0, 'max'=>1},
        'dosageInstruction' => {'type'=>'Dosage', 'path'=>'MedicationRequest.dosageInstruction', 'min'=>0, 'max'=>Float::INFINITY},
        'dispenseRequest' => {'type'=>'MedicationRequest::DispenseRequest', 'path'=>'MedicationRequest.dispenseRequest', 'min'=>0, 'max'=>1},
        'substitution' => {'type'=>'MedicationRequest::Substitution', 'path'=>'MedicationRequest.substitution', 'min'=>0, 'max'=>1},
        'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'MedicationRequest.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class DispenseRequest < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'DispenseRequest.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'DispenseRequest.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'DispenseRequest.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'initialFill' => {'type'=>'MedicationRequest::DispenseRequest::InitialFill', 'path'=>'DispenseRequest.initialFill', 'min'=>0, 'max'=>1},
          'dispenseInterval' => {'type'=>'Duration', 'path'=>'DispenseRequest.dispenseInterval', 'min'=>0, 'max'=>1},
          'validityPeriod' => {'type'=>'Period', 'path'=>'DispenseRequest.validityPeriod', 'min'=>0, 'max'=>1},
          'numberOfRepeatsAllowed' => {'type'=>'unsignedInt', 'path'=>'DispenseRequest.numberOfRepeatsAllowed', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'DispenseRequest.quantity', 'min'=>0, 'max'=>1},
          'expectedSupplyDuration' => {'type'=>'Duration', 'path'=>'DispenseRequest.expectedSupplyDuration', 'min'=>0, 'max'=>1},
          'dispenser' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'DispenseRequest.dispenser', 'min'=>0, 'max'=>1},
          'dispenserInstruction' => {'type'=>'Annotation', 'path'=>'DispenseRequest.dispenserInstruction', 'min'=>0, 'max'=>Float::INFINITY},
          'doseAdministrationAid' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medication-dose-aid'=>['blisterpack', 'dosette', 'sachets']}, 'type'=>'CodeableConcept', 'path'=>'DispenseRequest.doseAdministrationAid', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medication-dose-aid'}}
        }

        class InitialFill < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'InitialFill.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'InitialFill.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'InitialFill.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'quantity' => {'type'=>'Quantity', 'path'=>'InitialFill.quantity', 'min'=>0, 'max'=>1},
            'duration' => {'type'=>'Duration', 'path'=>'InitialFill.duration', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :quantity          # 0-1 Quantity
          attr_accessor :duration          # 0-1 Duration
        end

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :initialFill            # 0-1 MedicationRequest::DispenseRequest::InitialFill
        attr_accessor :dispenseInterval       # 0-1 Duration
        attr_accessor :validityPeriod         # 0-1 Period
        attr_accessor :numberOfRepeatsAllowed # 0-1 unsignedInt
        attr_accessor :quantity               # 0-1 Quantity
        attr_accessor :expectedSupplyDuration # 0-1 Duration
        attr_accessor :dispenser              # 0-1 Reference(Organization)
        attr_accessor :dispenserInstruction   # 0-* [ Annotation ]
        attr_accessor :doseAdministrationAid  # 0-1 CodeableConcept
      end

      class Substitution < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'allowed' => ['boolean', 'CodeableConcept']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Substitution.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Substitution.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Substitution.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'allowedBoolean' => {'type'=>'boolean', 'path'=>'Substitution.allowed[x]', 'min'=>1, 'max'=>1},
          'allowedCodeableConcept' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution'=>['E', 'EC', 'BC', 'G', 'TE', 'TB', 'TG', 'F', 'N']}, 'type'=>'CodeableConcept', 'path'=>'Substitution.allowed[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ActSubstanceAdminSubstitutionCode'}},
          'reason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['CT', 'FP', 'OS', 'RR']}, 'type'=>'CodeableConcept', 'path'=>'Substitution.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-SubstanceAdminSubstitutionReason'}}
        }

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :allowedBoolean         # 1-1 boolean
        attr_accessor :allowedCodeableConcept # 1-1 CodeableConcept
        attr_accessor :reason                 # 0-1 CodeableConcept
      end

      attr_accessor :id                        # 0-1 id
      attr_accessor :meta                      # 0-1 Meta
      attr_accessor :implicitRules             # 0-1 uri
      attr_accessor :language                  # 0-1 code
      attr_accessor :text                      # 0-1 Narrative
      attr_accessor :contained                 # 0-* [ Resource ]
      attr_accessor :extension                 # 0-* [ Extension ]
      attr_accessor :modifierExtension         # 0-* [ Extension ]
      attr_accessor :identifier                # 0-* [ Identifier ]
      attr_accessor :basedOn                   # 0-* [ Reference(CarePlan|MedicationRequest|ServiceRequest|ImmunizationRecommendation|RequestOrchestration) ]
      attr_accessor :priorPrescription         # 0-1 Reference(MedicationRequest)
      attr_accessor :groupIdentifier           # 0-1 Identifier
      attr_accessor :status                    # 1-1 code
      attr_accessor :statusReason              # 0-1 CodeableConcept
      attr_accessor :statusChanged             # 0-1 dateTime
      attr_accessor :intent                    # 1-1 code
      attr_accessor :category                  # 0-* [ CodeableConcept ]
      attr_accessor :priority                  # 0-1 code
      attr_accessor :doNotPerform              # 0-1 boolean
      attr_accessor :medication                # 1-1 CodeableReference
      attr_accessor :subject                   # 1-1 Reference(Patient|Group)
      attr_accessor :informationSource         # 0-* [ Reference(Patient|Practitioner|PractitionerRole|RelatedPerson|Organization) ]
      attr_accessor :encounter                 # 0-1 Reference(Encounter)
      attr_accessor :supportingInformation     # 0-* [ Reference(Resource) ]
      attr_accessor :authoredOn                # 0-1 dateTime
      attr_accessor :requester                 # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson|Device)
      attr_accessor :reported                  # 0-1 boolean
      attr_accessor :performerType             # 0-1 CodeableConcept
      attr_accessor :performer                 # 0-* [ Reference(Practitioner|PractitionerRole|Organization|Patient|DeviceDefinition|RelatedPerson|CareTeam|HealthcareService) ]
      attr_accessor :device                    # 0-* [ CodeableReference ]
      attr_accessor :recorder                  # 0-1 Reference(Practitioner|PractitionerRole)
      attr_accessor :reason                    # 0-* [ CodeableReference ]
      attr_accessor :courseOfTherapyType       # 0-1 CodeableConcept
      attr_accessor :insurance                 # 0-* [ Reference(Coverage|ClaimResponse) ]
      attr_accessor :note                      # 0-* [ Annotation ]
      attr_accessor :renderedDosageInstruction # 0-1 markdown
      attr_accessor :effectiveDosePeriod       # 0-1 Period
      attr_accessor :dosageInstruction         # 0-* [ Dosage ]
      attr_accessor :dispenseRequest           # 0-1 MedicationRequest::DispenseRequest
      attr_accessor :substitution              # 0-1 MedicationRequest::Substitution
      attr_accessor :eventHistory              # 0-* [ Reference(Provenance) ]

      def resourceType
        'MedicationRequest'
      end
    end
  end
end