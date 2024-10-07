module FHIR
  module R6
    class Location < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['address', 'address-city', 'address-country', 'address-postalcode', 'address-state', 'address-use', 'characteristic', 'endpoint', 'identifier', 'mode', 'name', 'near', 'operational-status', 'organization', 'partof', 'status', 'type']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Location.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Location.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Location.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Location.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Location.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Location.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Location.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Location.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Location.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/location-status'=>['active', 'suspended', 'inactive']}, 'type'=>'code', 'path'=>'Location.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/location-status'}},
        'operationalStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0116'=>['C', 'H', 'O', 'U', 'K', 'I']}, 'type'=>'Coding', 'path'=>'Location.operationalStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0116'}},
        'name' => {'type'=>'string', 'path'=>'Location.name', 'min'=>0, 'max'=>1},
        'alias' => {'type'=>'string', 'path'=>'Location.alias', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'Location.description', 'min'=>0, 'max'=>1},
        'mode' => {'valid_codes'=>{'http://hl7.org/fhir/location-mode'=>['instance', 'kind']}, 'type'=>'code', 'path'=>'Location.mode', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/location-mode'}},
        'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/service-type'=>['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '100', '101', '102', '103', '104', '105', '106', '107', '108', '109', '110', '111', '112', '113', '114', '115', '116', '117', '118', '119', '120', '121', '122', '123', '124', '125', '126', '127', '128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '141', '142', '143', '144', '145', '146', '147', '148', '149', '150', '151', '152', '153', '154', '155', '156', '157', '158', '159', '160', '161', '162', '163', '164', '165', '166', '167', '168', '169', '170', '171', '172', '173', '174', '175', '176', '177', '178', '179', '180', '181', '182', '183', '184', '185', '186', '187', '188', '189', '190', '191', '192', '193', '194', '195', '196', '197', '198', '199', '200', '201', '202', '203', '204', '205', '206', '207', '208', '209', '210', '211', '212', '213', '214', '215', '216', '217', '218', '219', '220', '221', '222', '223', '224', '225', '226', '227', '228', '229', '230', '231', '232', '233', '234', '235', '236', '237', '238', '239', '240', '241', '242', '243', '244', '245', '246', '247', '248', '249', '250', '251', '252', '253', '254', '255', '256', '257', '258', '259', '260', '261', '262', '263', '264', '265', '266', '267', '268', '269', '270', '271', '272', '273', '274', '275', '276', '277', '278', '279', '280', '281', '282', '283', '284', '285', '286', '287', '288', '289', '290', '291', '292', '293', '294', '295', '296', '297', '298', '299', '300', '301', '302', '303', '304', '305', '306', '307', '308', '309', '310', '311', '312', '313', '314', '315', '316', '317', '318', '319', '320', '321', '322', '323', '324', '325', '326', '327', '328', '330', '331', '332', '333', '334', '335', '336', '337', '338', '339', '340', '341', '342', '343', '344', '345', '346', '347', '348', '349', '350', '351', '352', '353', '354', '355', '356', '357', '358', '359', '360', '361', '362', '364', '365', '366', '367', '368', '369', '370', '371', '372', '373', '374', '375', '376', '377', '378', '379', '380', '381', '382', '383', '384', '385', '386', '387', '388', '389', '390', '391', '392', '393', '394', '395', '396', '397', '398', '399', '400', '401', '402', '403', '404', '405', '406', '407', '408', '409', '410', '411', '412', '413', '414', '415', '416', '417', '418', '419', '420', '421', '422', '423', '424', '425', '426', '427', '428', '429', '430', '431', '432', '433', '434', '435', '436', '437', '438', '439', '440', '441', '442', '443', '444', '445', '446', '447', '448', '449', '450', '451', '452', '453', '454', '455', '456', '457', '458', '459', '460', '461', '462', '463', '464', '465', '466', '467', '468', '469', '470', '471', '472', '473', '474', '475', '476', '477', '478', '479', '480', '481', '482', '483', '484', '485', '486', '488', '489', '490', '491', '492', '493', '494', '495', '496', '497', '498', '500', '501', '502', '503', '504', '505', '506', '507', '508', '509', '510', '513', '514', '530', '531', '532', '533', '534', '535', '536', '537', '538', '539', '540', '541', '542', '543', '544', '545', '546', '547', '548', '550', '551', '552', '553', '554', '555', '556', '557', '558', '559', '560', '561', '562', '563', '564', '565', '566', '567', '568', '569', '570', '571', '572', '573', '574', '575', '576', '577', '580', '581', '582', '583', '584', '585', '589', '590', '591', '593', '599', '600', '601', '602', '603', '604', '605', '606', '607', '608', '609', '610', '611', '612', '613', '614', '615', '616', '617', '618', '619', '620', '621', '622', '623', '624', '625', '626', '627', '628', '629']}, 'type'=>'CodeableConcept', 'path'=>'Location.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://terminology.hl7.org/ValueSet/service-type'}},
        'contact' => {'type'=>'ExtendedContactDetail', 'path'=>'Location.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'address' => {'type'=>'Address', 'path'=>'Location.address', 'min'=>0, 'max'=>1},
        'form' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/location-physical-type'=>['si', 'bu', 'wi', 'wa', 'lvl', 'co', 'ro', 'bd', 've', 'ho', 'ca', 'rd', 'area', 'jdn', 'vi']}, 'type'=>'CodeableConcept', 'path'=>'Location.form', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/location-form'}},
        'position' => {'type'=>'Location::Position', 'path'=>'Location.position', 'min'=>0, 'max'=>1},
        'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Location.managingOrganization', 'min'=>0, 'max'=>1},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'Location.partOf', 'min'=>0, 'max'=>1},
        'characteristic' => {'valid_codes'=>{'http://hl7.org/fhir/location-characteristic'=>['wheelchair', 'has-translation', 'has-oxy-nitro', 'has-neg-press', 'has-iso-ward', 'has-icu']}, 'type'=>'CodeableConcept', 'path'=>'Location.characteristic', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/location-characteristic'}},
        'hoursOfOperation' => {'type'=>'Availability', 'path'=>'Location.hoursOfOperation', 'min'=>0, 'max'=>1},
        'virtualService' => {'type'=>'VirtualServiceDetail', 'path'=>'Location.virtualService', 'min'=>0, 'max'=>Float::INFINITY},
        'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Location.endpoint', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Position < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Position.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Position.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Position.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'longitude' => {'type'=>'decimal', 'path'=>'Position.longitude', 'min'=>1, 'max'=>1},
          'latitude' => {'type'=>'decimal', 'path'=>'Position.latitude', 'min'=>1, 'max'=>1},
          'altitude' => {'type'=>'decimal', 'path'=>'Position.altitude', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :longitude         # 1-1 decimal
        attr_accessor :latitude          # 1-1 decimal
        attr_accessor :altitude          # 0-1 decimal
      end

      attr_accessor :id                   # 0-1 id
      attr_accessor :meta                 # 0-1 Meta
      attr_accessor :implicitRules        # 0-1 uri
      attr_accessor :language             # 0-1 code
      attr_accessor :text                 # 0-1 Narrative
      attr_accessor :contained            # 0-* [ Resource ]
      attr_accessor :extension            # 0-* [ Extension ]
      attr_accessor :modifierExtension    # 0-* [ Extension ]
      attr_accessor :identifier           # 0-* [ Identifier ]
      attr_accessor :status               # 0-1 code
      attr_accessor :operationalStatus    # 0-1 Coding
      attr_accessor :name                 # 0-1 string
      attr_accessor :alias                # 0-* [ string ]
      attr_accessor :description          # 0-1 markdown
      attr_accessor :mode                 # 0-1 code
      attr_accessor :type                 # 0-* [ CodeableConcept ]
      attr_accessor :contact              # 0-* [ ExtendedContactDetail ]
      attr_accessor :address              # 0-1 Address
      attr_accessor :form                 # 0-1 CodeableConcept
      attr_accessor :position             # 0-1 Location::Position
      attr_accessor :managingOrganization # 0-1 Reference(Organization)
      attr_accessor :partOf               # 0-1 Reference(Location)
      attr_accessor :characteristic       # 0-* [ CodeableConcept ]
      attr_accessor :hoursOfOperation     # 0-1 Availability
      attr_accessor :virtualService       # 0-* [ VirtualServiceDetail ]
      attr_accessor :endpoint             # 0-* [ Reference(Endpoint) ]

      def resourceType
        'Location'
      end
    end
  end
end