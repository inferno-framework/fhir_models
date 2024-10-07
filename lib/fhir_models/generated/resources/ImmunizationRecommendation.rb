module FHIR
  module build.fhir.org
    class ImmunizationRecommendation < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['date', 'identifier', 'information', 'patient', 'status', 'support', 'target-disease', 'vaccine-type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ImmunizationRecommendation.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ImmunizationRecommendation.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ImmunizationRecommendation.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ImmunizationRecommendation.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ImmunizationRecommendation.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ImmunizationRecommendation.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ImmunizationRecommendation.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ImmunizationRecommendation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'ImmunizationRecommendation.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'ImmunizationRecommendation.patient', 'min'=>1, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'ImmunizationRecommendation.date', 'min'=>1, 'max'=>1},
        'authority' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'ImmunizationRecommendation.authority', 'min'=>0, 'max'=>1},
        'recommendation' => {'type'=>'ImmunizationRecommendation::Recommendation', 'path'=>'ImmunizationRecommendation.recommendation', 'min'=>1, 'max'=>Float::INFINITY}
      }

      class Recommendation < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Recommendation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Recommendation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Recommendation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'vaccineCode' => {'valid_codes'=>{'http://hl7.org/fhir/sid/cvx'=>['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100', '101', '102', '103', '104', '105', '106', '107', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118', '119', '120', '121', '122', '123', '125', '126', '127', '128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '141', '142', '143', '144', '145', '146', '147', '148', '149', '150', '151', '152', '153', '154', '155', '156', '157', '158', '159', '160', '161', '162', '163', '164', '165', '166', '167', '168', '169', '170', '171', '172', '173', '174', '175', '176', '177', '178', '179', '180', '181', '182', '183', '184', '185', '186', '187', '188', '189', '190', '191', '192', '193', '194', '195', '196', '197', '198', '200', '201', '202', '203', '204', '205', '206', '207', '208', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '223', '224', '225', '226', '227', '228', '229', '230', '231', '300', '301', '302', '303', '304', '305', '306', '307', '308', '309', '310', '311', '312', '313', '314', '315', '316', '317', '500', '501', '502', '503', '504', '505', '506', '507', '508', '509', '510', '511', '512', '513', '514', '515', '516', '517', '518', '519', '520', '521', '801', '998', '999'], 'urn:oid:1.2.36.1.2001.1005.17'=>['AGRPAL', 'AVAXM', 'BCG', 'CDT', 'CMX', 'DTP', 'DTPA', 'ENGP', 'FLRIX', 'FLUVAX', 'FLVRN', 'FVXJNR', 'GNDIP', 'GNFLU', 'GNHEP', 'GNHIB', 'GNHPA', 'GNJEN', 'GNMEA', 'GNMEN', 'GNMUM', 'GNPNE', 'GNPOL', 'GNROX', 'GNRUB', 'GNTET', 'GNVAR', 'HATWNJ', 'HAVAQ', 'HAVJ', 'HBOC', 'HBV', 'HBVP', 'HBX', 'IFHX', 'IFIP', 'IFPA', 'IFX', 'IFXB', 'INFLUV', 'IPV', 'JEVAX', 'MENJUG', 'MENTEC', 'MENUME', 'MENVAX', 'MMR', 'MMRCSL', 'MMRSKB', 'MNTRX', 'NEISVC', 'OPV', 'P', 'PANVAX', 'PDCL', 'PLCL', 'PNEUMO', 'PRPD', 'PROQAD', 'PRPOMP', 'PRPT', 'PRVNR', 'PRVTH', 'PRXTEX', 'QDCL', 'ROTRIX', 'ROTTEQ', 'SYNFLX', 'TCL', 'VAXGRP', 'VGRJNR', 'VLRIX', 'VRVAX']}, 'type'=>'CodeableConcept', 'path'=>'Recommendation.vaccineCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccine-code'}},
          'targetDisease' => {'valid_codes'=>{'http://snomed.info/sct'=>['397428000', '27836007', '76902006', '721764008', '14189004', '36989005', '36653000', '16814004', '23511006', '709410003', '56717001', '363354003', '266113007', '415822001', '66071002', '40468003', '7111000119109', '719590007', '719865001', '38907003', '4740000', '55735004', '240613006', '4834000', '85904008', '63650001', '16541001', '38362002', '61462000', '14168008', '186772009', '712986001', '52947006', '186788009', '409498004', '58750007', '19265001', '23502006', '75702008', '80612004', '186747009', '67924001', '70090004']}, 'type'=>'CodeableConcept', 'path'=>'Recommendation.targetDisease', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-target-disease'}},
          'contraindicatedVaccineCode' => {'valid_codes'=>{'http://hl7.org/fhir/sid/cvx'=>['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100', '101', '102', '103', '104', '105', '106', '107', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118', '119', '120', '121', '122', '123', '125', '126', '127', '128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '141', '142', '143', '144', '145', '146', '147', '148', '149', '150', '151', '152', '153', '154', '155', '156', '157', '158', '159', '160', '161', '162', '163', '164', '165', '166', '167', '168', '169', '170', '171', '172', '173', '174', '175', '176', '177', '178', '179', '180', '181', '182', '183', '184', '185', '186', '187', '188', '189', '190', '191', '192', '193', '194', '195', '196', '197', '198', '200', '201', '202', '203', '204', '205', '206', '207', '208', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '223', '224', '225', '226', '227', '228', '229', '230', '231', '300', '301', '302', '303', '304', '305', '306', '307', '308', '309', '310', '311', '312', '313', '314', '315', '316', '317', '500', '501', '502', '503', '504', '505', '506', '507', '508', '509', '510', '511', '512', '513', '514', '515', '516', '517', '518', '519', '520', '521', '801', '998', '999'], 'urn:oid:1.2.36.1.2001.1005.17'=>['AGRPAL', 'AVAXM', 'BCG', 'CDT', 'CMX', 'DTP', 'DTPA', 'ENGP', 'FLRIX', 'FLUVAX', 'FLVRN', 'FVXJNR', 'GNDIP', 'GNFLU', 'GNHEP', 'GNHIB', 'GNHPA', 'GNJEN', 'GNMEA', 'GNMEN', 'GNMUM', 'GNPNE', 'GNPOL', 'GNROX', 'GNRUB', 'GNTET', 'GNVAR', 'HATWNJ', 'HAVAQ', 'HAVJ', 'HBOC', 'HBV', 'HBVP', 'HBX', 'IFHX', 'IFIP', 'IFPA', 'IFX', 'IFXB', 'INFLUV', 'IPV', 'JEVAX', 'MENJUG', 'MENTEC', 'MENUME', 'MENVAX', 'MMR', 'MMRCSL', 'MMRSKB', 'MNTRX', 'NEISVC', 'OPV', 'P', 'PANVAX', 'PDCL', 'PLCL', 'PNEUMO', 'PRPD', 'PROQAD', 'PRPOMP', 'PRPT', 'PRVNR', 'PRVTH', 'PRXTEX', 'QDCL', 'ROTRIX', 'ROTTEQ', 'SYNFLX', 'TCL', 'VAXGRP', 'VGRJNR', 'VLRIX', 'VRVAX']}, 'type'=>'CodeableConcept', 'path'=>'Recommendation.contraindicatedVaccineCode', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/vaccine-code'}},
          'forecastStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/immunization-recommendation-status'=>['due', 'overdue', 'immune', 'contraindicated', 'complete']}, 'type'=>'CodeableConcept', 'path'=>'Recommendation.forecastStatus', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-status'}},
          'forecastReason' => {'valid_codes'=>{'http://snomed.info/sct'=>['77176002', '77386006']}, 'type'=>'CodeableConcept', 'path'=>'Recommendation.forecastReason', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-reason'}},
          'dateCriterion' => {'type'=>'ImmunizationRecommendation::Recommendation::DateCriterion', 'path'=>'Recommendation.dateCriterion', 'min'=>0, 'max'=>Float::INFINITY},
          'description' => {'type'=>'markdown', 'path'=>'Recommendation.description', 'min'=>0, 'max'=>1},
          'series' => {'type'=>'string', 'path'=>'Recommendation.series', 'min'=>0, 'max'=>1},
          'doseNumber' => {'type'=>'string', 'path'=>'Recommendation.doseNumber', 'min'=>0, 'max'=>1},
          'seriesDoses' => {'type'=>'string', 'path'=>'Recommendation.seriesDoses', 'min'=>0, 'max'=>1},
          'supportingImmunization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Immunization', 'http://hl7.org/fhir/StructureDefinition/ImmunizationEvaluation'], 'type'=>'Reference', 'path'=>'Recommendation.supportingImmunization', 'min'=>0, 'max'=>Float::INFINITY},
          'supportingPatientInformation' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Recommendation.supportingPatientInformation', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class DateCriterion < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'DateCriterion.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'DateCriterion.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'DateCriterion.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'code' => {'valid_codes'=>{'http://loinc.org'=>['30981-5', '30980-7', '59777-3', '59778-1']}, 'type'=>'CodeableConcept', 'path'=>'DateCriterion.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/immunization-recommendation-date-criterion'}},
            'value' => {'type'=>'dateTime', 'path'=>'DateCriterion.value', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :code              # 1-1 CodeableConcept
          attr_accessor :value             # 1-1 dateTime
        end

        attr_accessor :id                           # 0-1 string
        attr_accessor :extension                    # 0-* [ Extension ]
        attr_accessor :modifierExtension            # 0-* [ Extension ]
        attr_accessor :vaccineCode                  # 0-* [ CodeableConcept ]
        attr_accessor :targetDisease                # 0-* [ CodeableConcept ]
        attr_accessor :contraindicatedVaccineCode   # 0-* [ CodeableConcept ]
        attr_accessor :forecastStatus               # 1-1 CodeableConcept
        attr_accessor :forecastReason               # 0-* [ CodeableConcept ]
        attr_accessor :dateCriterion                # 0-* [ ImmunizationRecommendation::Recommendation::DateCriterion ]
        attr_accessor :description                  # 0-1 markdown
        attr_accessor :series                       # 0-1 string
        attr_accessor :doseNumber                   # 0-1 string
        attr_accessor :seriesDoses                  # 0-1 string
        attr_accessor :supportingImmunization       # 0-* [ Reference(Immunization|ImmunizationEvaluation) ]
        attr_accessor :supportingPatientInformation # 0-* [ Reference(Resource) ]
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :identifier        # 0-* [ Identifier ]
      attr_accessor :patient           # 1-1 Reference(Patient)
      attr_accessor :date              # 1-1 dateTime
      attr_accessor :authority         # 0-1 Reference(Organization)
      attr_accessor :recommendation    # 1-* [ ImmunizationRecommendation::Recommendation ]

      def resourceType
        'ImmunizationRecommendation'
      end
    end
  end
end