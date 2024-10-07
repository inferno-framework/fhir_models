module FHIR
  module build.fhir.org
    class MedicationDispense < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['code', 'destination', 'encounter', 'identifier', 'location', 'medication', 'patient', 'performer', 'prescription', 'receiver', 'recorded', 'responsibleparty', 'status', 'subject', 'type', 'whenhandedover', 'whenprepared']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'MedicationDispense.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'MedicationDispense.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'MedicationDispense.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'MedicationDispense.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'MedicationDispense.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'MedicationDispense.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'MedicationDispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'MedicationDispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'MedicationDispense.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan'], 'type'=>'Reference', 'path'=>'MedicationDispense.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/MedicationAdministration'], 'type'=>'Reference', 'path'=>'MedicationDispense.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/medicationdispense-status'=>['preparation', 'in-progress', 'cancelled', 'on-hold', 'completed', 'entered-in-error', 'stopped', 'declined', 'unknown']}, 'type'=>'code', 'path'=>'MedicationDispense.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationdispense-status'}},
        'notPerformedReason' => {'type'=>'CodeableReference', 'path'=>'MedicationDispense.notPerformedReason', 'min'=>0, 'max'=>1},
        'statusChanged' => {'type'=>'dateTime', 'path'=>'MedicationDispense.statusChanged', 'min'=>0, 'max'=>1},
        'category' => {'valid_codes'=>{'http://hl7.org/fhir/medicationdispense-admin-location'=>['inpatient', 'outpatient', 'community']}, 'type'=>'CodeableConcept', 'path'=>'MedicationDispense.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationdispense-admin-location'}},
        'medication' => {'type'=>'CodeableReference', 'path'=>'MedicationDispense.medication', 'min'=>1, 'max'=>1},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'MedicationDispense.subject', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'MedicationDispense.encounter', 'min'=>0, 'max'=>1},
        'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'MedicationDispense.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'performer' => {'type'=>'MedicationDispense::Performer', 'path'=>'MedicationDispense.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'MedicationDispense.location', 'min'=>0, 'max'=>1},
        'authorizingPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/MedicationRequest'], 'type'=>'Reference', 'path'=>'MedicationDispense.authorizingPrescription', 'min'=>0, 'max'=>Float::INFINITY},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['DF', 'EM', 'SO', 'FF', 'FFS', 'FFPS', 'FFCS', 'TFS', 'FFC', 'FFP', 'FFSS', 'TF', 'FS', 'MS', 'RF', 'UD', 'RFC', 'RFCS', 'RFF', 'RFFS', 'RFP', 'RFPS', 'RFS', 'TB', 'TBS', 'UDE']}, 'type'=>'CodeableConcept', 'path'=>'MedicationDispense.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ActPharmacySupplyType'}},
        'quantity' => {'type'=>'Quantity', 'path'=>'MedicationDispense.quantity', 'min'=>0, 'max'=>1},
        'daysSupply' => {'type'=>'Quantity', 'path'=>'MedicationDispense.daysSupply', 'min'=>0, 'max'=>1},
        'recorded' => {'type'=>'dateTime', 'path'=>'MedicationDispense.recorded', 'min'=>0, 'max'=>1},
        'whenPrepared' => {'type'=>'dateTime', 'path'=>'MedicationDispense.whenPrepared', 'min'=>0, 'max'=>1},
        'whenHandedOver' => {'type'=>'dateTime', 'path'=>'MedicationDispense.whenHandedOver', 'min'=>0, 'max'=>1},
        'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'MedicationDispense.destination', 'min'=>0, 'max'=>1},
        'receiver' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'MedicationDispense.receiver', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'MedicationDispense.note', 'min'=>0, 'max'=>Float::INFINITY},
        'renderedDosageInstruction' => {'type'=>'markdown', 'path'=>'MedicationDispense.renderedDosageInstruction', 'min'=>0, 'max'=>1},
        'dosageInstruction' => {'type'=>'Dosage', 'path'=>'MedicationDispense.dosageInstruction', 'min'=>0, 'max'=>Float::INFINITY},
        'substitution' => {'type'=>'MedicationDispense::Substitution', 'path'=>'MedicationDispense.substitution', 'min'=>0, 'max'=>1},
        'eventHistory' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Provenance'], 'type'=>'Reference', 'path'=>'MedicationDispense.eventHistory', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Performer < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'function' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/medicationdispense-performer-function'=>['dataenterer', 'packager', 'checker', 'finalchecker', 'counsellor']}, 'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/medicationdispense-performer-function'}},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/CareTeam'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|Patient|Device|RelatedPerson|CareTeam)
      end

      class Substitution < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Substitution.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Substitution.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Substitution.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'wasSubstituted' => {'type'=>'boolean', 'path'=>'Substitution.wasSubstituted', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-substanceAdminSubstitution'=>['E', 'EC', 'BC', 'G', 'TE', 'TB', 'TG', 'F', 'N']}, 'type'=>'CodeableConcept', 'path'=>'Substitution.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ActSubstanceAdminSubstitutionCode'}},
          'reason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['CT', 'FP', 'OS', 'RR']}, 'type'=>'CodeableConcept', 'path'=>'Substitution.reason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-SubstanceAdminSubstitutionReason'}},
          'responsibleParty' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Substitution.responsibleParty', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :wasSubstituted    # 1-1 boolean
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :reason            # 0-* [ CodeableConcept ]
        attr_accessor :responsibleParty  # 0-1 Reference(Practitioner|PractitionerRole|Organization)
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
      attr_accessor :basedOn                   # 0-* [ Reference(CarePlan) ]
      attr_accessor :partOf                    # 0-* [ Reference(Procedure|MedicationAdministration) ]
      attr_accessor :status                    # 1-1 code
      attr_accessor :notPerformedReason        # 0-1 CodeableReference
      attr_accessor :statusChanged             # 0-1 dateTime
      attr_accessor :category                  # 0-* [ CodeableConcept ]
      attr_accessor :medication                # 1-1 CodeableReference
      attr_accessor :subject                   # 1-1 Reference(Patient|Group)
      attr_accessor :encounter                 # 0-1 Reference(Encounter)
      attr_accessor :supportingInformation     # 0-* [ Reference(Resource) ]
      attr_accessor :performer                 # 0-* [ MedicationDispense::Performer ]
      attr_accessor :location                  # 0-1 Reference(Location)
      attr_accessor :authorizingPrescription   # 0-* [ Reference(MedicationRequest) ]
      attr_accessor :type                      # 0-1 CodeableConcept
      attr_accessor :quantity                  # 0-1 Quantity
      attr_accessor :daysSupply                # 0-1 Quantity
      attr_accessor :recorded                  # 0-1 dateTime
      attr_accessor :whenPrepared              # 0-1 dateTime
      attr_accessor :whenHandedOver            # 0-1 dateTime
      attr_accessor :destination               # 0-1 Reference(Location)
      attr_accessor :receiver                  # 0-* [ Reference(Patient|Practitioner|RelatedPerson|Location|PractitionerRole) ]
      attr_accessor :note                      # 0-* [ Annotation ]
      attr_accessor :renderedDosageInstruction # 0-1 markdown
      attr_accessor :dosageInstruction         # 0-* [ Dosage ]
      attr_accessor :substitution              # 0-1 MedicationDispense::Substitution
      attr_accessor :eventHistory              # 0-* [ Reference(Provenance) ]

      def resourceType
        'MedicationDispense'
      end
    end
  end
end