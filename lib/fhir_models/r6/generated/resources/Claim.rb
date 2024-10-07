module FHIR
  module R6
    class Claim < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['care-team', 'created', 'detail-udi', 'encounter', 'enterer', 'facility', 'identifier', 'insurer', 'item-udi', 'patient', 'payee', 'priority', 'procedure-udi', 'provider', 'status', 'subdetail-udi', 'use']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Claim.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Claim.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Claim.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Claim.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Claim.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Claim.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Claim.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Claim.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Claim.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'traceNumber' => {'type'=>'Identifier', 'path'=>'Claim.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/fm-status'=>['active', 'cancelled', 'draft', 'entered-in-error']}, 'type'=>'code', 'path'=>'Claim.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/fm-status'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/claim-type'=>['institutional', 'oral', 'pharmacy', 'professional', 'vision']}, 'type'=>'CodeableConcept', 'path'=>'Claim.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-type'}},
        'subType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-claimsubtype'=>['ortho', 'emergency']}, 'type'=>'CodeableConcept', 'path'=>'Claim.subType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-subtype'}},
        'use' => {'valid_codes'=>{'http://hl7.org/fhir/claim-use'=>['claim', 'preauthorization', 'predetermination']}, 'type'=>'code', 'path'=>'Claim.use', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-use'}},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Claim.patient', 'min'=>1, 'max'=>1},
        'billablePeriod' => {'type'=>'Period', 'path'=>'Claim.billablePeriod', 'min'=>0, 'max'=>1},
        'created' => {'type'=>'dateTime', 'path'=>'Claim.created', 'min'=>1, 'max'=>1},
        'enterer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Claim.enterer', 'min'=>0, 'max'=>1},
        'insurer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.insurer', 'min'=>0, 'max'=>1},
        'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.provider', 'min'=>0, 'max'=>1},
        'priority' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/processpriority'=>['stat', 'normal', 'deferred']}, 'type'=>'CodeableConcept', 'path'=>'Claim.priority', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/process-priority'}},
        'fundsReserve' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/fundsreserve'=>['patient', 'provider', 'none']}, 'type'=>'CodeableConcept', 'path'=>'Claim.fundsReserve', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/fundsreserve'}},
        'related' => {'type'=>'Claim::Related', 'path'=>'Claim.related', 'min'=>0, 'max'=>Float::INFINITY},
        'prescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'Claim.prescription', 'min'=>0, 'max'=>1},
        'originalPrescription' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'Claim.originalPrescription', 'min'=>0, 'max'=>1},
        'payee' => {'type'=>'Claim::Payee', 'path'=>'Claim.payee', 'min'=>0, 'max'=>1},
        'referral' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'Claim.referral', 'min'=>0, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Claim.encounter', 'min'=>0, 'max'=>Float::INFINITY},
        'facility' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Claim.facility', 'min'=>0, 'max'=>1},
        'diagnosisRelatedGroup' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-diagnosisrelatedgroup'=>['100', '101', '300', '400']}, 'type'=>'CodeableConcept', 'path'=>'Claim.diagnosisRelatedGroup', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosisrelatedgroup'}},
        'event' => {'type'=>'Claim::Event', 'path'=>'Claim.event', 'min'=>0, 'max'=>Float::INFINITY},
        'careTeam' => {'type'=>'Claim::CareTeam', 'path'=>'Claim.careTeam', 'min'=>0, 'max'=>Float::INFINITY},
        'supportingInfo' => {'type'=>'Claim::SupportingInfo', 'path'=>'Claim.supportingInfo', 'min'=>0, 'max'=>Float::INFINITY},
        'diagnosis' => {'type'=>'Claim::Diagnosis', 'path'=>'Claim.diagnosis', 'min'=>0, 'max'=>Float::INFINITY},
        'procedure' => {'type'=>'Claim::Procedure', 'path'=>'Claim.procedure', 'min'=>0, 'max'=>Float::INFINITY},
        'insurance' => {'type'=>'Claim::Insurance', 'path'=>'Claim.insurance', 'min'=>0, 'max'=>Float::INFINITY},
        'accident' => {'type'=>'Claim::Accident', 'path'=>'Claim.accident', 'min'=>0, 'max'=>1},
        'patientPaid' => {'type'=>'Money', 'path'=>'Claim.patientPaid', 'min'=>0, 'max'=>1},
        'item' => {'type'=>'Claim::Item', 'path'=>'Claim.item', 'min'=>0, 'max'=>Float::INFINITY},
        'total' => {'type'=>'Money', 'path'=>'Claim.total', 'min'=>0, 'max'=>1}
      }

      class Related < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Related.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Related.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Related.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'claim' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Claim'], 'type'=>'Reference', 'path'=>'Related.claim', 'min'=>0, 'max'=>1},
          'relationship' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-relatedclaimrelationship'=>['prior', 'associated']}, 'type'=>'CodeableConcept', 'path'=>'Related.relationship', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/related-claim-relationship'}},
          'reference' => {'type'=>'Identifier', 'path'=>'Related.reference', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :claim             # 0-1 Reference(Claim)
        attr_accessor :relationship      # 0-1 CodeableConcept
        attr_accessor :reference         # 0-1 Identifier
      end

      class Payee < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Payee.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Payee.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Payee.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/payeetype'=>['subscriber', 'provider', 'beneficiary', 'other']}, 'type'=>'CodeableConcept', 'path'=>'Payee.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/payeetype'}},
          'party' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Payee.party', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :party             # 0-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson)
      end

      class Event < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'when' => ['dateTime', 'Period']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Event.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Event.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Event.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://hl7.org/fhir/datestype'=>['card-issued', 'claim-received', 'service-expected']}, 'type'=>'CodeableConcept', 'path'=>'Event.type', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/datestype'}},
          'whenDateTime' => {'type'=>'dateTime', 'path'=>'Event.when[x]', 'min'=>1, 'max'=>1},
          'whenPeriod' => {'type'=>'Period', 'path'=>'Event.when[x]', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 1-1 CodeableConcept
        attr_accessor :whenDateTime      # 1-1 dateTime
        attr_accessor :whenPeriod        # 1-1 Period
      end

      class CareTeam < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'CareTeam.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'CareTeam.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'CareTeam.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'CareTeam.sequence', 'min'=>1, 'max'=>1},
          'provider' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'CareTeam.provider', 'min'=>1, 'max'=>1},
          'responsible' => {'type'=>'boolean', 'path'=>'CareTeam.responsible', 'min'=>0, 'max'=>1},
          'role' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/claimcareteamrole'=>['primary', 'assist', 'supervisor', 'attending', 'referring', 'operating', 'otheroperating', 'prescribing', 'purchasedservice', 'rendering', 'other']}, 'type'=>'CodeableConcept', 'path'=>'CareTeam.role', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-careteamrole'}},
          'specialty' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-providerqualification'=>['311405', '604215', '604210']}, 'type'=>'CodeableConcept', 'path'=>'CareTeam.specialty', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/provider-qualification'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequence          # 1-1 positiveInt
        attr_accessor :provider          # 1-1 Reference(Practitioner|PractitionerRole|Organization)
        attr_accessor :responsible       # 0-1 boolean
        attr_accessor :role              # 0-1 CodeableConcept
        attr_accessor :specialty         # 0-1 CodeableConcept
      end

      class SupportingInfo < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'timing' => ['date', 'Period'],
          'value' => ['boolean', 'string', 'Quantity', 'Attachment', 'Reference', 'Identifier']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'SupportingInfo.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'SupportingInfo.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'SupportingInfo.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'SupportingInfo.sequence', 'min'=>1, 'max'=>1},
          'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/claiminformationcategory'=>['info', 'discharge', 'onset', 'related', 'exception', 'material', 'attachment', 'missingtooth', 'prosthesis', 'other', 'hospitalized', 'employmentimpacted', 'externalcause', 'patientreasonforvisit']}, 'type'=>'CodeableConcept', 'path'=>'SupportingInfo.category', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-informationcategory'}},
          'code' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/claim-exception'=>['student', 'disabled']}, 'type'=>'CodeableConcept', 'path'=>'SupportingInfo.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-exception'}},
          'timingDate' => {'type'=>'date', 'path'=>'SupportingInfo.timing[x]', 'min'=>0, 'max'=>1},
          'timingPeriod' => {'type'=>'Period', 'path'=>'SupportingInfo.timing[x]', 'min'=>0, 'max'=>1},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
          'valueString' => {'type'=>'string', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
          'valueAttachment' => {'type'=>'Attachment', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
          'valueReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
          'valueIdentifier' => {'type'=>'Identifier', 'path'=>'SupportingInfo.value[x]', 'min'=>0, 'max'=>1},
          'reason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/missingtoothreason'=>['e', 'c', 'u', 'o']}, 'type'=>'CodeableConcept', 'path'=>'SupportingInfo.reason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/missing-tooth-reason'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :sequence          # 1-1 positiveInt
        attr_accessor :category          # 1-1 CodeableConcept
        attr_accessor :code              # 0-1 CodeableConcept
        attr_accessor :timingDate        # 0-1 date
        attr_accessor :timingPeriod      # 0-1 Period
        attr_accessor :valueBoolean      # 0-1 boolean
        attr_accessor :valueString       # 0-1 string
        attr_accessor :valueQuantity     # 0-1 Quantity
        attr_accessor :valueAttachment   # 0-1 Attachment
        attr_accessor :valueReference    # 0-1 Reference(Resource)
        attr_accessor :valueIdentifier   # 0-1 Identifier
        attr_accessor :reason            # 0-1 CodeableConcept
      end

      class Diagnosis < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'diagnosis' => ['CodeableConcept', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Diagnosis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Diagnosis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Diagnosis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Diagnosis.sequence', 'min'=>1, 'max'=>1},
          'diagnosisCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/sid/icd-10'=>['I', 'A00-A09', 'A00', 'A00.0', 'A00.1', 'A00.9', 'A01', 'A01.0', 'A01.1', 'A01.2', 'A01.3', 'A01.4', 'A02', 'A02.0', 'A02.1', 'A02.2', 'A02.8', 'A02.9', 'A03', 'A03.0', 'A03.1', 'A03.2', 'A03.3', 'A03.8', 'A03.9', 'A04', 'A04.0', 'A04.1', 'A04.2', 'A04.3', 'A04.4', 'A04.5', 'A04.6', 'A04.7', 'A04.8', 'A04.9', 'A05', 'A05.0', 'A05.1', 'A05.2', 'A05.3', 'A05.4', 'A05.8', 'A05.9', 'A06', 'A06.0', 'A06.1', 'A06.2', 'A06.3', 'A06.4', 'A06.5', 'A06.6', 'A06.7', 'A06.8', 'A06.9', 'A07', 'A07.0', 'A07.1', 'A07.2', 'A07.3', 'A07.8', 'A07.9', 'A08', 'A08.0', 'A08.1', 'A08.2', 'A08.3', 'A08.4', 'A08.5', 'A09', 'A09.0', 'A09.9', 'A15-A19', 'A15', 'A15.0', 'A15.1', 'A15.2', 'A15.3', 'A15.4', 'A15.5', 'A15.6', 'A15.7', 'A15.8', 'A15.9', 'A16', 'A16.0', 'A16.1', 'A16.2', 'A16.3', 'A16.4', 'A16.5', 'A16.7', 'A16.8', 'A16.9', 'A17', 'A17.0', 'A17.1', 'A17.8', 'A17.9', 'A18', 'A18.0', 'A18.1', 'A18.2', 'A18.3', 'A18.4', 'A18.5', 'A18.6', 'A18.7', 'A18.8', 'A19', 'A19.0', 'A19.1', 'A19.2', 'A19.8', 'A19.9', 'A20-A28', 'A20', 'A20.0', 'A20.1', 'A20.2', 'A20.3', 'A20.7', 'A20.8', 'A20.9', 'A21', 'A21.0', 'A21.1', 'A21.2', 'A21.3', 'A21.7', 'A21.8', 'A21.9', 'A22', 'A22.0', 'A22.1', 'A22.2', 'A22.7', 'A22.8', 'A22.9', 'A23', 'A23.0', 'A23.1', 'A23.2', 'A23.3', 'A23.8', 'A23.9', 'A24', 'A24.0', 'A24.1', 'A24.2', 'A24.3', 'A24.4', 'A25', 'A25.0', 'A25.1', 'A25.9', 'A26', 'A26.0', 'A26.7', 'A26.8', 'A26.9', 'A27', 'A27.0', 'A27.8', 'A27.9', 'A28', 'A28.0', 'A28.1', 'A28.2', 'A28.8', 'A28.9', 'A30-A49', 'A30', 'A30.0', 'A30.1', 'A30.2', 'A30.3', 'A30.4', 'A30.5', 'A30.8', 'A30.9', 'A31', 'A31.0', 'A31.1', 'A31.8', 'A31.9', 'A32', 'A32.0', 'A32.1', 'A32.7', 'A32.8', 'A32.9', 'A33', 'A34', 'A35', 'A36', 'A36.0', 'A36.1', 'A36.2', 'A36.3', 'A36.8', 'A36.9', 'A37', 'A37.0', 'A37.1', 'A37.8', 'A37.9', 'A38', 'A39', 'A39.0', 'A39.1', 'A39.2', 'A39.3', 'A39.4', 'A39.5', 'A39.8', 'A39.9', 'A40', 'A40.0', 'A40.1', 'A40.2', 'A40.3', 'A40.8', 'A40.9', 'A41', 'A41.0', 'A41.1', 'A41.2', 'A41.3', 'A41.4', 'A41.5', 'A41.8', 'A41.9', 'A42', 'A42.0', 'A42.1', 'A42.2', 'A42.7', 'A42.8', 'A42.9', 'A43', 'A43.0', 'A43.1', 'A43.8', 'A43.9', 'A44', 'A44.0', 'A44.1', 'A44.8', 'A44.9', 'A46', 'A48', 'A48.0', 'A48.1', 'A48.2', 'A48.3', 'A48.4', 'A48.8', 'A49', 'A49.0', 'A49.1', 'A49.2', 'A49.3', 'A49.8', 'A49.9', 'A50-A64', 'A50', 'A50.0', 'A50.1', 'A50.2', 'A50.3', 'A50.4', 'A50.5', 'A50.6', 'A50.7', 'A50.9', 'A51', 'A51.0', 'A51.1', 'A51.2', 'A51.3', 'A51.4', 'A51.5', 'A51.9', 'A52', 'A52.0', 'A52.1', 'A52.2', 'A52.3', 'A52.7', 'A52.8', 'A52.9', 'A53', 'A53.0', 'A53.9', 'A54', 'A54.0', 'A54.1', 'A54.2', 'A54.3', 'A54.4', 'A54.5', 'A54.6', 'A54.8', 'A54.9', 'A55', 'A56', 'A56.0', 'A56.1', 'A56.2', 'A56.3', 'A56.4', 'A56.8', 'A57', 'A58', 'A59', 'A59.0', 'A59.8', 'A59.9', 'A60', 'A60.0', 'A60.1', 'A60.9', 'A63', 'A63.0', 'A63.8', 'A64', 'A65-A69', 'A65', 'A66', 'A66.0', 'A66.1', 'A66.2', 'A66.3', 'A66.4', 'A66.5', 'A66.6', 'A66.7', 'A66.8', 'A66.9', 'A67', 'A67.0', 'A67.1', 'A67.2', 'A67.3', 'A67.9', 'A68', 'A68.0', 'A68.1', 'A68.9', 'A69', 'A69.0', 'A69.1', 'A69.2', 'A69.8', 'A69.9', 'A70-A74', 'A70', 'A71', 'A71.0', 'A71.1', 'A71.9', 'A74', 'A74.0', 'A74.8', 'A74.9', 'A75-A79', 'A75', 'A75.0', 'A75.1', 'A75.2', 'A75.3', 'A75.9', 'A77', 'A77.0', 'A77.1', 'A77.2', 'A77.3', 'A77.8', 'A77.9', 'A78', 'A79', 'A79.0', 'A79.1', 'A79.8', 'A79.9', 'A80-A89', 'A80', 'A80.0', 'A80.1', 'A80.2', 'A80.3', 'A80.4', 'A80.9', 'A81', 'A81.0', 'A81.1', 'A81.2', 'A81.8', 'A81.9', 'A82', 'A82.0', 'A82.1', 'A82.9', 'A83', 'A83.0', 'A83.1', 'A83.2', 'A83.3', 'A83.4', 'A83.5', 'A83.6', 'A83.8', 'A83.9', 'A84', 'A84.0', 'A84.1', 'A84.8', 'A84.9', 'A85', 'A85.0', 'A85.1', 'A85.2', 'A85.8', 'A86', 'A87', 'A87.0', 'A87.1', 'A87.2', 'A87.8', 'A87.9', 'A88', 'A88.0', 'A88.1', 'A88.8', 'A89', 'A92-A99', 'A92', 'A92.0', 'A92.1', 'A92.2', 'A92.3', 'A92.4', 'A92.5', 'A92.8', 'A92.9', 'A93', 'A93.0', 'A93.1', 'A93.2', 'A93.8', 'A94', 'A95', 'A95.0', 'A95.1', 'A95.9', 'A96', 'A96.0', 'A96.1', 'A96.2', 'A96.8', 'A96.9', 'A97', 'A97.0', 'A97.1', 'A97.2', 'A97.9', 'A98', 'A98.0', 'A98.1', 'A98.2', 'A98.3', 'A98.4', 'A98.5', 'A98.8', 'A99', 'B00-B09', 'B00', 'B00.0', 'B00.1', 'B00.2', 'B00.3', 'B00.4', 'B00.5', 'B00.7', 'B00.8', 'B00.9', 'B01', 'B01.0', 'B01.1', 'B01.2', 'B01.8', 'B01.9', 'B02', 'B02.0', 'B02.1', 'B02.2', 'B02.3', 'B02.7', 'B02.8', 'B02.9', 'B03', 'B04', 'B05', 'B05.0', 'B05.1', 'B05.2', 'B05.3', 'B05.4', 'B05.8', 'B05.9', 'B06', 'B06.0', 'B06.8', 'B06.9', 'B07', 'B08', 'B08.0', 'B08.1', 'B08.2', 'B08.3', 'B08.4', 'B08.5', 'B08.8', 'B09', 'B15-B19', 'B15', 'B15.0', 'B15.9', 'B16', 'B16.0', 'B16.1', 'B16.2', 'B16.9', 'B17', 'B17.0', 'B17.1', 'B17.2', 'B17.8', 'B17.9', 'B18', 'B18.0', 'B18.1', 'B18.2', 'B18.8', 'B18.9', 'B19', 'B19.0', 'B19.9', 'B20-B24', 'B20', 'B20.0', 'B20.1', 'B20.2', 'B20.3', 'B20.4', 'B20.5', 'B20.6', 'B20.7', 'B20.8', 'B20.9', 'B21', 'B21.0', 'B21.1', 'B21.2', 'B21.3', 'B21.7', 'B21.8', 'B21.9', 'B22', 'B22.0', 'B22.1', 'B22.2', 'B22.7', 'B23', 'B23.0', 'B23.1', 'B23.2', 'B23.8', 'B24', 'B25-B34', 'B25', 'B25.0', 'B25.1', 'B25.2', 'B25.8', 'B25.9', 'B26', 'B26.0', 'B26.1', 'B26.2', 'B26.3', 'B26.8', 'B26.9', 'B27', 'B27.0', 'B27.1', 'B27.8', 'B27.9', 'B30', 'B30.0', 'B30.1', 'B30.2', 'B30.3', 'B30.8', 'B30.9', 'B33', 'B33.0', 'B33.1', 'B33.2', 'B33.3', 'B33.4', 'B33.8', 'B34', 'B34.0', 'B34.1', 'B34.2', 'B34.3', 'B34.4', 'B34.8', 'B34.9', 'B35-B49', 'B35', 'B35.0', 'B35.1', 'B35.2', 'B35.3', 'B35.4', 'B35.5', 'B35.6', 'B35.8', 'B35.9', 'B36', 'B36.0', 'B36.1', 'B36.2', 'B36.3', 'B36.8', 'B36.9', 'B37', 'B37.0', 'B37.1', 'B37.2', 'B37.3', 'B37.4', 'B37.5', 'B37.6', 'B37.7', 'B37.8', 'B37.9', 'B38', 'B38.0', 'B38.1', 'B38.2', 'B38.3', 'B38.4', 'B38.7', 'B38.8', 'B38.9', 'B39', 'B39.0', 'B39.1', 'B39.2', 'B39.3', 'B39.4', 'B39.5', 'B39.9', 'B40', 'B40.0', 'B40.1', 'B40.2', 'B40.3', 'B40.7', 'B40.8', 'B40.9', 'B41', 'B41.0', 'B41.7', 'B41.8', 'B41.9', 'B42', 'B42.0', 'B42.1', 'B42.7', 'B42.8', 'B42.9', 'B43', 'B43.0', 'B43.1', 'B43.2', 'B43.8', 'B43.9', 'B44', 'B44.0', 'B44.1', 'B44.2', 'B44.7', 'B44.8', 'B44.9', 'B45', 'B45.0', 'B45.1', 'B45.2', 'B45.3', 'B45.7', 'B45.8', 'B45.9', 'B46', 'B46.0', 'B46.1', 'B46.2', 'B46.3', 'B46.4', 'B46.5', 'B46.8', 'B46.9', 'B47', 'B47.0', 'B47.1', 'B47.9', 'B48', 'B48.0', 'B48.1', 'B48.2', 'B48.3', 'B48.4', 'B48.5', 'B48.7', 'B48.8', 'B49', 'B50-B64', 'B50', 'B50.0', 'B50.8', 'B50.9', 'B51', 'B51.0', 'B51.8', 'B51.9', 'B52', 'B52.0', 'B52.8', 'B52.9', 'B53', 'B53.0', 'B53.1', 'B53.8', 'B54', 'B55', 'B55.0', 'B55.1', 'B55.2', 'B55.9', 'B56', 'B56.0', 'B56.1', 'B56.9', 'B57', 'B57.0', 'B57.1', 'B57.2', 'B57.3', 'B57.4', 'B57.5', 'B58', 'B58.0', 'B58.1', 'B58.2', 'B58.3', 'B58.8', 'B58.9', 'B60', 'B60.0', 'B60.1', 'B60.2', 'B60.8', 'B64', 'B65-B83', 'B65', 'B65.0', 'B65.1', 'B65.2', 'B65.3', 'B65.8', 'B65.9', 'B66', 'B66.0', 'B66.1', 'B66.2', 'B66.3', 'B66.4', 'B66.5', 'B66.8', 'B66.9', 'B67', 'B67.0', 'B67.1', 'B67.2', 'B67.3', 'B67.4', 'B67.5', 'B67.6', 'B67.7', 'B67.8', 'B67.9', 'B68', 'B68.0', 'B68.1', 'B68.9', 'B69', 'B69.0', 'B69.1', 'B69.8', 'B69.9', 'B70', 'B70.0', 'B70.1', 'B71', 'B71.0', 'B71.1', 'B71.8', 'B71.9', 'B72', 'B73', 'B74', 'B74.0', 'B74.1', 'B74.2', 'B74.3', 'B74.4', 'B74.8', 'B74.9', 'B75', 'B76', 'B76.0', 'B76.1', 'B76.8', 'B76.9', 'B77', 'B77.0', 'B77.8', 'B77.9', 'B78', 'B78.0', 'B78.1', 'B78.7', 'B78.9', 'B79', 'B80', 'B81', 'B81.0', 'B81.1', 'B81.2', 'B81.3', 'B81.4', 'B81.8', 'B82', 'B82.0', 'B82.9', 'B83', 'B83.0', 'B83.1', 'B83.2', 'B83.3', 'B83.4', 'B83.8', 'B83.9', 'B85-B89', 'B85', 'B85.0', 'B85.1', 'B85.2', 'B85.3', 'B85.4', 'B86', 'B87', 'B87.0', 'B87.1', 'B87.2', 'B87.3', 'B87.4', 'B87.8', 'B87.9', 'B88', 'B88.0', 'B88.1', 'B88.2', 'B88.3', 'B88.8', 'B88.9', 'B89', 'B90-B94', 'B90', 'B90.0', 'B90.1', 'B90.2', 'B90.8', 'B90.9', 'B91', 'B92', 'B94', 'B94.0', 'B94.1', 'B94.2', 'B94.8', 'B94.9', 'B95-B98', 'B95', 'B95.0', 'B95.1', 'B95.2', 'B95.3', 'B95.4', 'B95.5', 'B95.6', 'B95.7', 'B95.8', 'B96', 'B96.0', 'B96.1', 'B96.2', 'B96.3', 'B96.4', 'B96.5', 'B96.6', 'B96.7', 'B96.8', 'B97', 'B97.0', 'B97.1', 'B97.2', 'B97.3', 'B97.4', 'B97.5', 'B97.6', 'B97.7', 'B97.8', 'B98', 'B98.0', 'B98.1', 'B99-B99', 'B99', 'II', 'C00-C97', 'C00-C75', 'C00-C14', 'C00', 'C00.0', 'C00.1', 'C00.2', 'C00.3', 'C00.4', 'C00.5', 'C00.6', 'C00.8', 'C00.9', 'C01', 'C02', 'C02.0', 'C02.1', 'C02.2', 'C02.3', 'C02.4', 'C02.8', 'C02.9', 'C03', 'C03.0', 'C03.1', 'C03.9', 'C04', 'C04.0', 'C04.1', 'C04.8', 'C04.9', 'C05', 'C05.0', 'C05.1', 'C05.2', 'C05.8', 'C05.9', 'C06', 'C06.0', 'C06.1', 'C06.2', 'C06.8', 'C06.9', 'C07', 'C08', 'C08.0', 'C08.1', 'C08.8', 'C08.9', 'C09', 'C09.0', 'C09.1', 'C09.8', 'C09.9', 'C10', 'C10.0', 'C10.1']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.diagnosis[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10'}},
          'diagnosisReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Condition'], 'type'=>'Reference', 'path'=>'Diagnosis.diagnosis[x]', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-diagnosistype'=>['admitting', 'clinical', 'differential', 'discharge', 'laboratory', 'nursing', 'prenatal', 'principal', 'radiology', 'remote', 'retrospective', 'self']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosistype'}},
          'onAdmission' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-diagnosis-on-admission'=>['yes', 'no', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'Diagnosis.onAdmission', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-diagnosis-on-admission'}}
        }

        attr_accessor :id                       # 0-1 string
        attr_accessor :extension                # 0-* [ Extension ]
        attr_accessor :modifierExtension        # 0-* [ Extension ]
        attr_accessor :sequence                 # 1-1 positiveInt
        attr_accessor :diagnosisCodeableConcept # 1-1 CodeableConcept
        attr_accessor :diagnosisReference       # 1-1 Reference(Condition)
        attr_accessor :type                     # 0-* [ CodeableConcept ]
        attr_accessor :onAdmission              # 0-1 CodeableConcept
      end

      class Procedure < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'procedure' => ['CodeableConcept', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Procedure.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Procedure.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Procedure.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Procedure.sequence', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-procedure-type'=>['primary', 'secondary']}, 'type'=>'CodeableConcept', 'path'=>'Procedure.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-procedure-type'}},
          'date' => {'type'=>'dateTime', 'path'=>'Procedure.date', 'min'=>0, 'max'=>1},
          'procedureCodeableConcept' => {'valid_codes'=>{'http://hl7.org/fhir/sid/ex-icd-10-procedures'=>['123001', '123002', '123003']}, 'type'=>'CodeableConcept', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/icd-10-procedures'}},
          'procedureReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'Procedure.procedure[x]', 'min'=>1, 'max'=>1},
          'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Procedure.udi', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                       # 0-1 string
        attr_accessor :extension                # 0-* [ Extension ]
        attr_accessor :modifierExtension        # 0-* [ Extension ]
        attr_accessor :sequence                 # 1-1 positiveInt
        attr_accessor :type                     # 0-* [ CodeableConcept ]
        attr_accessor :date                     # 0-1 dateTime
        attr_accessor :procedureCodeableConcept # 1-1 CodeableConcept
        attr_accessor :procedureReference       # 1-1 Reference(Procedure)
        attr_accessor :udi                      # 0-* [ Reference(Device) ]
      end

      class Insurance < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Insurance.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Insurance.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Insurance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Insurance.sequence', 'min'=>1, 'max'=>1},
          'focal' => {'type'=>'boolean', 'path'=>'Insurance.focal', 'min'=>1, 'max'=>1},
          'identifier' => {'type'=>'Identifier', 'path'=>'Insurance.identifier', 'min'=>0, 'max'=>1},
          'coverage' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Coverage'], 'type'=>'Reference', 'path'=>'Insurance.coverage', 'min'=>1, 'max'=>1},
          'businessArrangement' => {'type'=>'string', 'path'=>'Insurance.businessArrangement', 'min'=>0, 'max'=>1},
          'preAuthRef' => {'type'=>'string', 'path'=>'Insurance.preAuthRef', 'min'=>0, 'max'=>Float::INFINITY},
          'claimResponse' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ClaimResponse'], 'type'=>'Reference', 'path'=>'Insurance.claimResponse', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                  # 0-1 string
        attr_accessor :extension           # 0-* [ Extension ]
        attr_accessor :modifierExtension   # 0-* [ Extension ]
        attr_accessor :sequence            # 1-1 positiveInt
        attr_accessor :focal               # 1-1 boolean
        attr_accessor :identifier          # 0-1 Identifier
        attr_accessor :coverage            # 1-1 Reference(Coverage)
        attr_accessor :businessArrangement # 0-1 string
        attr_accessor :preAuthRef          # 0-* [ string ]
        attr_accessor :claimResponse       # 0-1 Reference(ClaimResponse)
      end

      class Accident < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'location' => ['Address', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Accident.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Accident.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Accident.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'date' => {'type'=>'date', 'path'=>'Accident.date', 'min'=>1, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActCode'=>['MVA', 'SCHOOL', 'SPT', 'WPA', '_ActPatientSafetyIncidentCode']}, 'type'=>'CodeableConcept', 'path'=>'Accident.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://terminology.hl7.org/ValueSet/v3-ActIncidentCode'}},
          'locationAddress' => {'type'=>'Address', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1},
          'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Accident.location[x]', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :date              # 1-1 date
        attr_accessor :type              # 0-1 CodeableConcept
        attr_accessor :locationAddress   # 0-1 Address
        attr_accessor :locationReference # 0-1 Reference(Location)
      end

      class Item < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'serviced' => ['date', 'Period'],
          'location' => ['CodeableConcept', 'Address', 'Reference']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Item.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Item.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Item.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'sequence' => {'type'=>'positiveInt', 'path'=>'Item.sequence', 'min'=>1, 'max'=>1},
          'traceNumber' => {'type'=>'Identifier', 'path'=>'Item.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
          'careTeamSequence' => {'type'=>'positiveInt', 'path'=>'Item.careTeamSequence', 'min'=>0, 'max'=>Float::INFINITY},
          'diagnosisSequence' => {'type'=>'positiveInt', 'path'=>'Item.diagnosisSequence', 'min'=>0, 'max'=>Float::INFINITY},
          'procedureSequence' => {'type'=>'positiveInt', 'path'=>'Item.procedureSequence', 'min'=>0, 'max'=>Float::INFINITY},
          'informationSequence' => {'type'=>'positiveInt', 'path'=>'Item.informationSequence', 'min'=>0, 'max'=>Float::INFINITY},
          'revenue' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-revenue-center'=>['0010', '0011', '1001']}, 'type'=>'CodeableConcept', 'path'=>'Item.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
          'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-benefitcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'Item.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory'}},
          'productOrService' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Item.productOrService', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'productOrServiceEnd' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Item.productOrServiceEnd', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
          'request' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DeviceRequest', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/NutritionOrder', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/SupplyRequest', 'http://hl7.org/fhir/StructureDefinition/VisionPrescription'], 'type'=>'Reference', 'path'=>'Item.request', 'min'=>0, 'max'=>Float::INFINITY},
          'modifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/modifiers'=>['a', 'b', 'c', 'e', 'rooh', 'x']}, 'type'=>'CodeableConcept', 'path'=>'Item.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
          'programCode' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-programcode'=>['as', 'hd', 'auscr', 'none']}, 'type'=>'CodeableConcept', 'path'=>'Item.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
          'servicedDate' => {'type'=>'date', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
          'servicedPeriod' => {'type'=>'Period', 'path'=>'Item.serviced[x]', 'min'=>0, 'max'=>1},
          'locationCodeableConcept' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-serviceplace'=>['01', '03', '04', '05', '06', '07', '08', '09', '11', '12', '13', '14', '15', '19', '20', '21', '41']}, 'type'=>'CodeableConcept', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-place'}},
          'locationAddress' => {'type'=>'Address', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
          'locationReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Item.location[x]', 'min'=>0, 'max'=>1},
          'patientPaid' => {'type'=>'Money', 'path'=>'Item.patientPaid', 'min'=>0, 'max'=>1},
          'quantity' => {'type'=>'Quantity', 'path'=>'Item.quantity', 'min'=>0, 'max'=>1},
          'unitPrice' => {'type'=>'Money', 'path'=>'Item.unitPrice', 'min'=>0, 'max'=>1},
          'factor' => {'type'=>'decimal', 'path'=>'Item.factor', 'min'=>0, 'max'=>1},
          'tax' => {'type'=>'Money', 'path'=>'Item.tax', 'min'=>0, 'max'=>1},
          'net' => {'type'=>'Money', 'path'=>'Item.net', 'min'=>0, 'max'=>1},
          'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Item.udi', 'min'=>0, 'max'=>Float::INFINITY},
          'bodySite' => {'type'=>'Claim::Item::BodySite', 'path'=>'Item.bodySite', 'min'=>0, 'max'=>Float::INFINITY},
          'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Item.encounter', 'min'=>0, 'max'=>Float::INFINITY},
          'detail' => {'type'=>'Claim::Item::Detail', 'path'=>'Item.detail', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class BodySite < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'BodySite.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'BodySite.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'BodySite.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'site' => {'type'=>'CodeableReference', 'path'=>'BodySite.site', 'min'=>1, 'max'=>Float::INFINITY},
            'subSite' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/FDI-surface'=>['M', 'O', 'I', 'D', 'B', 'V', 'L', 'MO', 'DO', 'DI', 'MOD']}, 'type'=>'CodeableConcept', 'path'=>'BodySite.subSite', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/surface'}}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :site              # 1-* [ CodeableReference ]
          attr_accessor :subSite           # 0-* [ CodeableConcept ]
        end

        class Detail < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Detail.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Detail.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Detail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'sequence' => {'type'=>'positiveInt', 'path'=>'Detail.sequence', 'min'=>1, 'max'=>1},
            'traceNumber' => {'type'=>'Identifier', 'path'=>'Detail.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
            'revenue' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-revenue-center'=>['0010', '0011', '1001']}, 'type'=>'CodeableConcept', 'path'=>'Detail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
            'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-benefitcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'Detail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory'}},
            'productOrService' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Detail.productOrService', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'productOrServiceEnd' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'Detail.productOrServiceEnd', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
            'modifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/modifiers'=>['a', 'b', 'c', 'e', 'rooh', 'x']}, 'type'=>'CodeableConcept', 'path'=>'Detail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
            'programCode' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-programcode'=>['as', 'hd', 'auscr', 'none']}, 'type'=>'CodeableConcept', 'path'=>'Detail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
            'patientPaid' => {'type'=>'Money', 'path'=>'Detail.patientPaid', 'min'=>0, 'max'=>1},
            'quantity' => {'type'=>'Quantity', 'path'=>'Detail.quantity', 'min'=>0, 'max'=>1},
            'unitPrice' => {'type'=>'Money', 'path'=>'Detail.unitPrice', 'min'=>0, 'max'=>1},
            'factor' => {'type'=>'decimal', 'path'=>'Detail.factor', 'min'=>0, 'max'=>1},
            'tax' => {'type'=>'Money', 'path'=>'Detail.tax', 'min'=>0, 'max'=>1},
            'net' => {'type'=>'Money', 'path'=>'Detail.net', 'min'=>0, 'max'=>1},
            'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Detail.udi', 'min'=>0, 'max'=>Float::INFINITY},
            'subDetail' => {'type'=>'Claim::Item::Detail::SubDetail', 'path'=>'Detail.subDetail', 'min'=>0, 'max'=>Float::INFINITY}
          }

          class SubDetail < Model
            include FHIR::Hashable
            include FHIR::Json
            include FHIR::Xml

            METADATA = {
              'id' => {'type'=>'string', 'path'=>'SubDetail.id', 'min'=>0, 'max'=>1},
              'extension' => {'type'=>'Extension', 'path'=>'SubDetail.extension', 'min'=>0, 'max'=>Float::INFINITY},
              'modifierExtension' => {'type'=>'Extension', 'path'=>'SubDetail.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
              'sequence' => {'type'=>'positiveInt', 'path'=>'SubDetail.sequence', 'min'=>1, 'max'=>1},
              'traceNumber' => {'type'=>'Identifier', 'path'=>'SubDetail.traceNumber', 'min'=>0, 'max'=>Float::INFINITY},
              'revenue' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-revenue-center'=>['0010', '0011', '1001']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.revenue', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-revenue-center'}},
              'category' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-benefitcategory'=>['1', '2', '3', '4', '5', '14', '23', '24', '25', '26', '27', '28', '30', '35', '36', '37', '49', '55', '56', '61', '62', '63', '69', '76', 'F1', 'F3', 'F4', 'F6']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.category', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-benefitcategory'}},
              'productOrService' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.productOrService', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
              'productOrServiceEnd' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-USCLS'=>['1101', '1102', '1103', '1201', '1205', '2101', '2102', '2141', '2601', '11101', '11102', '11103', '11104', '21211', '21212', '27211', '67211', '99111', '99333', '99555']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.productOrServiceEnd', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/service-uscls'}},
              'modifier' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/modifiers'=>['a', 'b', 'c', 'e', 'rooh', 'x']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.modifier', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/claim-modifiers'}},
              'programCode' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/ex-programcode'=>['as', 'hd', 'auscr', 'none']}, 'type'=>'CodeableConcept', 'path'=>'SubDetail.programCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/ex-program-code'}},
              'patientPaid' => {'type'=>'Money', 'path'=>'SubDetail.patientPaid', 'min'=>0, 'max'=>1},
              'quantity' => {'type'=>'Quantity', 'path'=>'SubDetail.quantity', 'min'=>0, 'max'=>1},
              'unitPrice' => {'type'=>'Money', 'path'=>'SubDetail.unitPrice', 'min'=>0, 'max'=>1},
              'factor' => {'type'=>'decimal', 'path'=>'SubDetail.factor', 'min'=>0, 'max'=>1},
              'tax' => {'type'=>'Money', 'path'=>'SubDetail.tax', 'min'=>0, 'max'=>1},
              'net' => {'type'=>'Money', 'path'=>'SubDetail.net', 'min'=>0, 'max'=>1},
              'udi' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'SubDetail.udi', 'min'=>0, 'max'=>Float::INFINITY}
            }

            attr_accessor :id                  # 0-1 string
            attr_accessor :extension           # 0-* [ Extension ]
            attr_accessor :modifierExtension   # 0-* [ Extension ]
            attr_accessor :sequence            # 1-1 positiveInt
            attr_accessor :traceNumber         # 0-* [ Identifier ]
            attr_accessor :revenue             # 0-1 CodeableConcept
            attr_accessor :category            # 0-1 CodeableConcept
            attr_accessor :productOrService    # 0-1 CodeableConcept
            attr_accessor :productOrServiceEnd # 0-1 CodeableConcept
            attr_accessor :modifier            # 0-* [ CodeableConcept ]
            attr_accessor :programCode         # 0-* [ CodeableConcept ]
            attr_accessor :patientPaid         # 0-1 Money
            attr_accessor :quantity            # 0-1 Quantity
            attr_accessor :unitPrice           # 0-1 Money
            attr_accessor :factor              # 0-1 decimal
            attr_accessor :tax                 # 0-1 Money
            attr_accessor :net                 # 0-1 Money
            attr_accessor :udi                 # 0-* [ Reference(Device) ]
          end

          attr_accessor :id                  # 0-1 string
          attr_accessor :extension           # 0-* [ Extension ]
          attr_accessor :modifierExtension   # 0-* [ Extension ]
          attr_accessor :sequence            # 1-1 positiveInt
          attr_accessor :traceNumber         # 0-* [ Identifier ]
          attr_accessor :revenue             # 0-1 CodeableConcept
          attr_accessor :category            # 0-1 CodeableConcept
          attr_accessor :productOrService    # 0-1 CodeableConcept
          attr_accessor :productOrServiceEnd # 0-1 CodeableConcept
          attr_accessor :modifier            # 0-* [ CodeableConcept ]
          attr_accessor :programCode         # 0-* [ CodeableConcept ]
          attr_accessor :patientPaid         # 0-1 Money
          attr_accessor :quantity            # 0-1 Quantity
          attr_accessor :unitPrice           # 0-1 Money
          attr_accessor :factor              # 0-1 decimal
          attr_accessor :tax                 # 0-1 Money
          attr_accessor :net                 # 0-1 Money
          attr_accessor :udi                 # 0-* [ Reference(Device) ]
          attr_accessor :subDetail           # 0-* [ Claim::Item::Detail::SubDetail ]
        end

        attr_accessor :id                      # 0-1 string
        attr_accessor :extension               # 0-* [ Extension ]
        attr_accessor :modifierExtension       # 0-* [ Extension ]
        attr_accessor :sequence                # 1-1 positiveInt
        attr_accessor :traceNumber             # 0-* [ Identifier ]
        attr_accessor :careTeamSequence        # 0-* [ positiveInt ]
        attr_accessor :diagnosisSequence       # 0-* [ positiveInt ]
        attr_accessor :procedureSequence       # 0-* [ positiveInt ]
        attr_accessor :informationSequence     # 0-* [ positiveInt ]
        attr_accessor :revenue                 # 0-1 CodeableConcept
        attr_accessor :category                # 0-1 CodeableConcept
        attr_accessor :productOrService        # 0-1 CodeableConcept
        attr_accessor :productOrServiceEnd     # 0-1 CodeableConcept
        attr_accessor :request                 # 0-* [ Reference(DeviceRequest|MedicationRequest|NutritionOrder|ServiceRequest|SupplyRequest|VisionPrescription) ]
        attr_accessor :modifier                # 0-* [ CodeableConcept ]
        attr_accessor :programCode             # 0-* [ CodeableConcept ]
        attr_accessor :servicedDate            # 0-1 date
        attr_accessor :servicedPeriod          # 0-1 Period
        attr_accessor :locationCodeableConcept # 0-1 CodeableConcept
        attr_accessor :locationAddress         # 0-1 Address
        attr_accessor :locationReference       # 0-1 Reference(Location)
        attr_accessor :patientPaid             # 0-1 Money
        attr_accessor :quantity                # 0-1 Quantity
        attr_accessor :unitPrice               # 0-1 Money
        attr_accessor :factor                  # 0-1 decimal
        attr_accessor :tax                     # 0-1 Money
        attr_accessor :net                     # 0-1 Money
        attr_accessor :udi                     # 0-* [ Reference(Device) ]
        attr_accessor :bodySite                # 0-* [ Claim::Item::BodySite ]
        attr_accessor :encounter               # 0-* [ Reference(Encounter) ]
        attr_accessor :detail                  # 0-* [ Claim::Item::Detail ]
      end

      attr_accessor :id                    # 0-1 id
      attr_accessor :meta                  # 0-1 Meta
      attr_accessor :implicitRules         # 0-1 uri
      attr_accessor :language              # 0-1 code
      attr_accessor :text                  # 0-1 Narrative
      attr_accessor :contained             # 0-* [ Resource ]
      attr_accessor :extension             # 0-* [ Extension ]
      attr_accessor :modifierExtension     # 0-* [ Extension ]
      attr_accessor :identifier            # 0-* [ Identifier ]
      attr_accessor :traceNumber           # 0-* [ Identifier ]
      attr_accessor :status                # 1-1 code
      attr_accessor :type                  # 1-1 CodeableConcept
      attr_accessor :subType               # 0-1 CodeableConcept
      attr_accessor :use                   # 1-1 code
      attr_accessor :patient               # 1-1 Reference(Patient)
      attr_accessor :billablePeriod        # 0-1 Period
      attr_accessor :created               # 1-1 dateTime
      attr_accessor :enterer               # 0-1 Reference(Practitioner|PractitionerRole|Patient|RelatedPerson)
      attr_accessor :insurer               # 0-1 Reference(Organization)
      attr_accessor :provider              # 0-1 Reference(Practitioner|PractitionerRole|Organization)
      attr_accessor :priority              # 0-1 CodeableConcept
      attr_accessor :fundsReserve          # 0-1 CodeableConcept
      attr_accessor :related               # 0-* [ Claim::Related ]
      attr_accessor :prescription          # 0-1 Reference(DeviceRequest|MedicationRequest|VisionPrescription)
      attr_accessor :originalPrescription  # 0-1 Reference(DeviceRequest|MedicationRequest|VisionPrescription)
      attr_accessor :payee                 # 0-1 Claim::Payee
      attr_accessor :referral              # 0-1 Reference(ServiceRequest)
      attr_accessor :encounter             # 0-* [ Reference(Encounter) ]
      attr_accessor :facility              # 0-1 Reference(Location|Organization)
      attr_accessor :diagnosisRelatedGroup # 0-1 CodeableConcept
      attr_accessor :event                 # 0-* [ Claim::Event ]
      attr_accessor :careTeam              # 0-* [ Claim::CareTeam ]
      attr_accessor :supportingInfo        # 0-* [ Claim::SupportingInfo ]
      attr_accessor :diagnosis             # 0-* [ Claim::Diagnosis ]
      attr_accessor :procedure             # 0-* [ Claim::Procedure ]
      attr_accessor :insurance             # 0-* [ Claim::Insurance ]
      attr_accessor :accident              # 0-1 Claim::Accident
      attr_accessor :patientPaid           # 0-1 Money
      attr_accessor :item                  # 0-* [ Claim::Item ]
      attr_accessor :total                 # 0-1 Money

      def resourceType
        'Claim'
      end
    end
  end
end