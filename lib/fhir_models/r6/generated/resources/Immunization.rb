module FHIR
  module R6
    class Immunization < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'occurrence' => ['dateTime', 'string']
      }
      SEARCH_PARAMS = ['date', 'identifier', 'location', 'lot-number', 'manufacturer', 'patient', 'performer', 'reaction', 'reaction-date', 'reason-code', 'reason-reference', 'series', 'status', 'status-reason', 'target-disease', 'vaccine-code']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Immunization.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Immunization.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Immunization.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Immunization.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Immunization.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Immunization.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Immunization.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Immunization.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Immunization.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/MedicationRequest', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation'], 'type'=>'Reference', 'path'=>'Immunization.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/event-status'=>['completed', 'entered-in-error', 'not-done']}, 'type'=>'code', 'path'=>'Immunization.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-status'}},
        'statusReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActReason'=>['IMMUNE', 'MEDPREC', 'OSTOCK', 'PATOBJ', 'PHILISOP', 'RELIG', 'VACEFF', 'VACSAF']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.statusReason', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-status-reason'}},
        'vaccineCode' => {'valid_codes'=>{'http://hl7.org/fhir/sid/cvx'=>['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100', '101', '102', '103', '104', '105', '106', '107', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118', '119', '120', '121', '122', '123', '125', '126', '127', '128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '141', '142', '143', '144', '145', '146', '147', '148', '149', '150', '151', '152', '153', '154', '155', '156', '157', '158', '159', '160', '161', '162', '163', '164', '165', '166', '167', '168', '169', '170', '171', '172', '173', '174', '175', '176', '177', '178', '179', '180', '181', '182', '183', '184', '185', '186', '187', '188', '189', '190', '191', '192', '193', '194', '195', '196', '197', '198', '200', '201', '202', '203', '204', '205', '206', '207', '208', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '223', '224', '225', '226', '227', '228', '229', '230', '231', '300', '301', '302', '303', '304', '305', '306', '307', '308', '309', '310', '311', '312', '313', '314', '315', '316', '317', '500', '501', '502', '503', '504', '505', '506', '507', '508', '509', '510', '511', '512', '513', '514', '515', '516', '517', '518', '519', '520', '521', '801', '998', '999'], 'urn:oid:1.2.36.1.2001.1005.17'=>['AGRPAL', 'AVAXM', 'BCG', 'CDT', 'CMX', 'DTP', 'DTPA', 'ENGP', 'FLRIX', 'FLUVAX', 'FLVRN', 'FVXJNR', 'GNDIP', 'GNFLU', 'GNHEP', 'GNHIB', 'GNHPA', 'GNJEN', 'GNMEA', 'GNMEN', 'GNMUM', 'GNPNE', 'GNPOL', 'GNROX', 'GNRUB', 'GNTET', 'GNVAR', 'HATWNJ', 'HAVAQ', 'HAVJ', 'HBOC', 'HBV', 'HBVP', 'HBX', 'IFHX', 'IFIP', 'IFPA', 'IFX', 'IFXB', 'INFLUV', 'IPV', 'JEVAX', 'MENJUG', 'MENTEC', 'MENUME', 'MENVAX', 'MMR', 'MMRCSL', 'MMRSKB', 'MNTRX', 'NEISVC', 'OPV', 'P', 'PANVAX', 'PDCL', 'PLCL', 'PNEUMO', 'PRPD', 'PROQAD', 'PRPOMP', 'PRPT', 'PRVNR', 'PRVTH', 'PRXTEX', 'QDCL', 'ROTRIX', 'ROTTEQ', 'SYNFLX', 'TCL', 'VAXGRP', 'VGRJNR', 'VLRIX', 'VRVAX']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.vaccineCode', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccine-code'}},
        'administeredProduct' => {'type'=>'CodeableReference', 'path'=>'Immunization.administeredProduct', 'min'=>0, 'max'=>1},
        'manufacturer' => {'type'=>'CodeableReference', 'path'=>'Immunization.manufacturer', 'min'=>0, 'max'=>1},
        'lotNumber' => {'type'=>'string', 'path'=>'Immunization.lotNumber', 'min'=>0, 'max'=>1},
        'expirationDate' => {'type'=>'date', 'path'=>'Immunization.expirationDate', 'min'=>0, 'max'=>1},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'Immunization.patient', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'Immunization.encounter', 'min'=>0, 'max'=>1},
        'supportingInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Immunization.supportingInformation', 'min'=>0, 'max'=>Float::INFINITY},
        'occurrenceDateTime' => {'type'=>'dateTime', 'path'=>'Immunization.occurrence[x]', 'min'=>1, 'max'=>1},
        'occurrenceString' => {'type'=>'string', 'path'=>'Immunization.occurrence[x]', 'min'=>1, 'max'=>1},
        'primarySource' => {'type'=>'boolean', 'path'=>'Immunization.primarySource', 'min'=>0, 'max'=>1},
        'informationSource' => {'type'=>'CodeableReference', 'path'=>'Immunization.informationSource', 'min'=>0, 'max'=>1},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Immunization.location', 'min'=>0, 'max'=>1},
        'site' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ActSite'=>['LA', 'RA']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.site', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-site'}},
        'route' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-RouteOfAdministration'=>['IDINJ', 'IM', 'IVINJ', 'PO', 'SQ', 'TRNSDERM']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.route', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-route'}},
        'doseQuantity' => {'type'=>'Quantity', 'path'=>'Immunization.doseQuantity', 'min'=>0, 'max'=>1},
        'performer' => {'type'=>'Immunization::Performer', 'path'=>'Immunization.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'Immunization.note', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'type'=>'CodeableReference', 'path'=>'Immunization.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'isSubpotent' => {'type'=>'boolean', 'path'=>'Immunization.isSubpotent', 'min'=>0, 'max'=>1},
        'subpotentReason' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/immunization-subpotent-reason'=>['partialdose', 'coldchainbreak', 'recall', 'adversestorage', 'expired']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.subpotentReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-subpotent-reason'}},
        'programEligibility' => {'type'=>'Immunization::ProgramEligibility', 'path'=>'Immunization.programEligibility', 'min'=>0, 'max'=>Float::INFINITY},
        'fundingSource' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/immunization-funding-source'=>['private', 'public']}, 'type'=>'CodeableConcept', 'path'=>'Immunization.fundingSource', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-funding-source'}},
        'reaction' => {'type'=>'Immunization::Reaction', 'path'=>'Immunization.reaction', 'min'=>0, 'max'=>Float::INFINITY},
        'protocolApplied' => {'type'=>'Immunization::ProtocolApplied', 'path'=>'Immunization.protocolApplied', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Performer < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'function' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0443'=>['OP', 'AP']}, 'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-function'}},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|Patient|RelatedPerson)
      end

      class ProgramEligibility < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ProgramEligibility.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ProgramEligibility.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ProgramEligibility.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'program' => {'valid_codes'=>{'http://loinc.org'=>['64994-7']}, 'type'=>'CodeableConcept', 'path'=>'ProgramEligibility.program', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-vaccine-funding-program'}},
          'programStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/immunization-program-eligibility'=>['ineligible', 'uninsured']}, 'type'=>'CodeableConcept', 'path'=>'ProgramEligibility.programStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-program-eligibility'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :program           # 1-1 CodeableConcept
        attr_accessor :programStatus     # 1-1 CodeableConcept
      end

      class Reaction < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Reaction.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Reaction.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Reaction.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'date' => {'type'=>'dateTime', 'path'=>'Reaction.date', 'min'=>0, 'max'=>1},
          'manifestation' => {'type'=>'CodeableReference', 'path'=>'Reaction.manifestation', 'min'=>0, 'max'=>1},
          'reported' => {'type'=>'boolean', 'path'=>'Reaction.reported', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :date              # 0-1 dateTime
        attr_accessor :manifestation     # 0-1 CodeableReference
        attr_accessor :reported          # 0-1 boolean
      end

      class ProtocolApplied < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ProtocolApplied.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ProtocolApplied.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ProtocolApplied.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'series' => {'type'=>'string', 'path'=>'ProtocolApplied.series', 'min'=>0, 'max'=>1},
          'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ProtocolApplied.authority', 'min'=>0, 'max'=>1},
          'targetDisease' => {'valid_codes'=>{'http://snomed.info/sct'=>['397428000', '27836007', '76902006', '721764008', '14189004', '36989005', '36653000', '16814004', '23511006', '709410003', '56717001', '363354003', '266113007', '415822001', '66071002', '40468003', '7111000119109', '719590007', '719865001', '38907003', '4740000', '55735004', '240613006', '4834000', '85904008', '63650001', '16541001', '38362002', '61462000', '14168008', '186772009', '712986001', '52947006', '186788009', '409498004', '58750007', '19265001', '23502006', '75702008', '80612004', '186747009', '67924001', '70090004']}, 'type'=>'CodeableConcept', 'path'=>'ProtocolApplied.targetDisease', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-target-disease'}},
          'doseNumber' => {'type'=>'string', 'path'=>'ProtocolApplied.doseNumber', 'min'=>0, 'max'=>1},
          'seriesDoses' => {'type'=>'string', 'path'=>'ProtocolApplied.seriesDoses', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :series            # 0-1 string
        attr_accessor :authority         # 0-1 Reference(Organization)
        attr_accessor :targetDisease     # 0-* [ CodeableConcept ]
        attr_accessor :doseNumber        # 0-1 string
        attr_accessor :seriesDoses       # 0-1 string
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
      attr_accessor :basedOn               # 0-* [ Reference(CarePlan|MedicationRequest|ServiceRequest|ImmunizationRecommendation) ]
      attr_accessor :status                # 1-1 code
      attr_accessor :statusReason          # 0-1 CodeableConcept
      attr_accessor :vaccineCode           # 1-1 CodeableConcept
      attr_accessor :administeredProduct   # 0-1 CodeableReference
      attr_accessor :manufacturer          # 0-1 CodeableReference
      attr_accessor :lotNumber             # 0-1 string
      attr_accessor :expirationDate        # 0-1 date
      attr_accessor :patient               # 1-1 Reference(Patient)
      attr_accessor :encounter             # 0-1 Reference(Encounter)
      attr_accessor :supportingInformation # 0-* [ Reference(Resource) ]
      attr_accessor :occurrenceDateTime    # 1-1 dateTime
      attr_accessor :occurrenceString      # 1-1 string
      attr_accessor :primarySource         # 0-1 boolean
      attr_accessor :informationSource     # 0-1 CodeableReference
      attr_accessor :location              # 0-1 Reference(Location)
      attr_accessor :site                  # 0-1 CodeableConcept
      attr_accessor :route                 # 0-1 CodeableConcept
      attr_accessor :doseQuantity          # 0-1 Quantity
      attr_accessor :performer             # 0-* [ Immunization::Performer ]
      attr_accessor :note                  # 0-* [ Annotation ]
      attr_accessor :reason                # 0-* [ CodeableReference ]
      attr_accessor :isSubpotent           # 0-1 boolean
      attr_accessor :subpotentReason       # 0-* [ CodeableConcept ]
      attr_accessor :programEligibility    # 0-* [ Immunization::ProgramEligibility ]
      attr_accessor :fundingSource         # 0-1 CodeableConcept
      attr_accessor :reaction              # 0-* [ Immunization::Reaction ]
      attr_accessor :protocolApplied       # 0-* [ Immunization::ProtocolApplied ]

      def resourceType
        'Immunization'
      end
    end
  end
end