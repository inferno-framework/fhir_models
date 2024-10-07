module FHIR
  module R6
    class Group < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      MULTIPLE_TYPES = {
        'versionAlgorithm' => ['string', 'Coding']
      }
      SEARCH_PARAMS = ['characteristic', 'characteristic-reference', 'characteristic-value', 'code', 'exclude', 'identifier', 'managing-entity', 'member', 'membership', 'name', 'status', 'type', 'url', 'value']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Group.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Group.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Group.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Group.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Group.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Group.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Group.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Group.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'url' => {'type'=>'uri', 'path'=>'Group.url', 'min'=>0, 'max'=>1},
        'identifier' => {'type'=>'Identifier', 'path'=>'Group.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'version' => {'type'=>'string', 'path'=>'Group.version', 'min'=>0, 'max'=>1},
        'versionAlgorithmString' => {'type'=>'string', 'path'=>'Group.versionAlgorithm[x]', 'min'=>0, 'max'=>1},
        'versionAlgorithmCoding' => {'valid_codes'=>{'http://hl7.org/fhir/version-algorithm'=>['semver', 'integer', 'alpha', 'date', 'natural']}, 'type'=>'Coding', 'path'=>'Group.versionAlgorithm[x]', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/version-algorithm'}},
        'name' => {'type'=>'string', 'path'=>'Group.name', 'min'=>0, 'max'=>1},
        'title' => {'type'=>'string', 'path'=>'Group.title', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/publication-status'=>['draft', 'active', 'retired', 'unknown']}, 'type'=>'code', 'path'=>'Group.status', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/publication-status'}},
        'experimental' => {'type'=>'boolean', 'path'=>'Group.experimental', 'min'=>0, 'max'=>1},
        'date' => {'type'=>'dateTime', 'path'=>'Group.date', 'min'=>0, 'max'=>1},
        'publisher' => {'type'=>'string', 'path'=>'Group.publisher', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactDetail', 'path'=>'Group.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'Group.description', 'min'=>0, 'max'=>1},
        'useContext' => {'type'=>'UsageContext', 'path'=>'Group.useContext', 'min'=>0, 'max'=>Float::INFINITY},
        'purpose' => {'type'=>'markdown', 'path'=>'Group.purpose', 'min'=>0, 'max'=>1},
        'copyright' => {'type'=>'markdown', 'path'=>'Group.copyright', 'min'=>0, 'max'=>1},
        'copyrightLabel' => {'type'=>'string', 'path'=>'Group.copyrightLabel', 'min'=>0, 'max'=>1},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/group-type'=>['person', 'animal', 'practitioner', 'device', 'careteam', 'healthcareservice', 'location', 'organization', 'relatedperson', 'specimen']}, 'type'=>'code', 'path'=>'Group.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/group-type'}},
        'membership' => {'valid_codes'=>{'http://hl7.org/fhir/group-membership-basis'=>['definitional', 'conceptual', 'enumerated']}, 'type'=>'code', 'path'=>'Group.membership', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/group-membership-basis'}},
        'code' => {'valid_codes'=>{'http://hl7.org/fhir/group-code'=>['patient-list', 'family', 'household', 'workplace', 'event-attendee', 'exposure-group', 'herd', 'locality', 'organization', 'collection']}, 'type'=>'CodeableConcept', 'path'=>'Group.code', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/group-code'}},
        'quantity' => {'type'=>'unsignedInt', 'path'=>'Group.quantity', 'min'=>0, 'max'=>1},
        'managingEntity' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Group.managingEntity', 'min'=>0, 'max'=>1},
        'combinationMethod' => {'valid_codes'=>{'http://hl7.org/fhir/group-characteristic-combination'=>['all-of', 'any-of', 'at-least', 'at-most', 'except-subset']}, 'type'=>'code', 'path'=>'Group.combinationMethod', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/group-characteristic-combination'}},
        'combinationThreshold' => {'type'=>'positiveInt', 'path'=>'Group.combinationThreshold', 'min'=>0, 'max'=>1},
        'characteristic' => {'type'=>'Group::Characteristic', 'path'=>'Group.characteristic', 'min'=>0, 'max'=>Float::INFINITY},
        'member' => {'type'=>'Group::Member', 'path'=>'Group.member', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Characteristic < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        MULTIPLE_TYPES = {
          'value' => ['CodeableConcept', 'boolean', 'Quantity', 'Range', 'Reference', 'uri', 'Expression'],
          'determinedBy' => ['Reference', 'Expression'],
          'instances' => ['Quantity', 'Range'],
          'duration' => ['Duration', 'Range']
        }
        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Characteristic.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Characteristic.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Characteristic.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'code' => {'type'=>'CodeableConcept', 'path'=>'Characteristic.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example'}},
          'valueCodeableConcept' => {'type'=>'CodeableConcept', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example'}},
          'valueBoolean' => {'type'=>'boolean', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueQuantity' => {'type'=>'Quantity', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueRange' => {'type'=>'Range', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueReference' => {'type'=>'Reference', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueUri' => {'type'=>'uri', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'valueExpression' => {'type'=>'Expression', 'path'=>'Characteristic.value[x]', 'min'=>1, 'max'=>1},
          'exclude' => {'type'=>'boolean', 'path'=>'Characteristic.exclude', 'min'=>1, 'max'=>1},
          'description' => {'type'=>'markdown', 'path'=>'Characteristic.description', 'min'=>0, 'max'=>1},
          'method' => {'local_name'=>'local_method', 'valid_codes'=>{'http://hl7.org/fhir/definition-method'=>['systematic-assessment', 'non-systematic-assessment', 'mean', 'median', 'mean-of-mean', 'mean-of-median', 'median-of-mean', 'median-of-median']}, 'type'=>'CodeableConcept', 'path'=>'Characteristic.method', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/definition-method'}},
          'determinedByReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/DeviceDefinition', 'http://hl7.org/fhir/StructureDefinition/DeviceMetric'], 'type'=>'Reference', 'path'=>'Characteristic.determinedBy[x]', 'min'=>0, 'max'=>1},
          'determinedByExpression' => {'type'=>'Expression', 'path'=>'Characteristic.determinedBy[x]', 'min'=>0, 'max'=>1},
          'offset' => {'valid_codes'=>{'http://hl7.org/fhir/characteristic-offset'=>['UNL', 'LNL']}, 'type'=>'CodeableConcept', 'path'=>'Characteristic.offset', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/characteristic-offset'}},
          'instancesQuantity' => {'type'=>'Quantity', 'path'=>'Characteristic.instances[x]', 'min'=>0, 'max'=>1},
          'instancesRange' => {'type'=>'Range', 'path'=>'Characteristic.instances[x]', 'min'=>0, 'max'=>1},
          'durationDuration' => {'type'=>'Duration', 'path'=>'Characteristic.duration[x]', 'min'=>0, 'max'=>1},
          'durationRange' => {'type'=>'Range', 'path'=>'Characteristic.duration[x]', 'min'=>0, 'max'=>1},
          'period' => {'type'=>'Period', 'path'=>'Characteristic.period', 'min'=>0, 'max'=>1},
          'timing' => {'type'=>'RelativeTime', 'path'=>'Characteristic.timing', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                     # 0-1 string
        attr_accessor :extension              # 0-* [ Extension ]
        attr_accessor :modifierExtension      # 0-* [ Extension ]
        attr_accessor :code                   # 1-1 CodeableConcept
        attr_accessor :valueCodeableConcept   # 1-1 CodeableConcept
        attr_accessor :valueBoolean           # 1-1 boolean
        attr_accessor :valueQuantity          # 1-1 Quantity
        attr_accessor :valueRange             # 1-1 Range
        attr_accessor :valueReference         # 1-1 Reference()
        attr_accessor :valueUri               # 1-1 uri
        attr_accessor :valueExpression        # 1-1 Expression
        attr_accessor :exclude                # 1-1 boolean
        attr_accessor :description            # 0-1 markdown
        attr_accessor :local_method           # 0-* [ CodeableConcept ]
        attr_accessor :determinedByReference  # 0-1 Reference(Device|DeviceDefinition|DeviceMetric)
        attr_accessor :determinedByExpression # 0-1 Expression
        attr_accessor :offset                 # 0-1 CodeableConcept
        attr_accessor :instancesQuantity      # 0-1 Quantity
        attr_accessor :instancesRange         # 0-1 Range
        attr_accessor :durationDuration       # 0-1 Duration
        attr_accessor :durationRange          # 0-1 Range
        attr_accessor :period                 # 0-1 Period
        attr_accessor :timing                 # 0-* [ RelativeTime ]
      end

      class Member < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Member.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Member.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Member.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'entity' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Location', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'Member.entity', 'min'=>1, 'max'=>1},
          'involvement' => {'valid_codes'=>{'http://hl7.org/fhir/group-involvement'=>['index-case', 'primary-exposure', 'secondary-exposure', 'owner', 'resident', 'visitor', 'staff', 'pet', 'full-time', 'part-time', 'casual'], 'http://terminology.hl7.org/CodeSystem/v3-RoleCode'=>['FAMMEMB', 'CHILD', 'CHLDADOPT', 'DAUADOPT', 'SONADOPT', 'CHLDFOST', 'DAUFOST', 'SONFOST', 'DAUC', 'DAU', 'STPDAU', 'NCHILD', 'SON', 'SONC', 'STPSON', 'STPCHLD', 'EXT', 'AUNT', 'MAUNT', 'PAUNT', 'COUSN', 'MCOUSN', 'PCOUSN', 'GGRPRN', 'GGRFTH', 'MGGRFTH', 'PGGRFTH', 'GGRMTH', 'MGGRMTH', 'PGGRMTH', 'MGGRPRN', 'PGGRPRN', 'GRNDCHILD', 'GRNDDAU', 'GRNDSON', 'GRPRN', 'GRFTH', 'MGRFTH', 'PGRFTH', 'GRMTH', 'MGRMTH', 'PGRMTH', 'MGRPRN', 'PGRPRN', 'INLAW', 'CHLDINLAW', 'DAUINLAW', 'SONINLAW', 'PRNINLAW', 'FTHINLAW', 'MTHINLAW', 'MTHINLOAW', 'SIBINLAW', 'BROINLAW', 'SISINLAW', 'SISLINLAW', 'NIENEPH', 'NEPHEW', 'NIECE', 'UNCLE', 'MUNCLE', 'PUNCLE', 'PRN', 'ADOPTP', 'ADOPTF', 'ADOPTM', 'FTH', 'FTHFOST', 'NFTH', 'NFTHF', 'STPFTH', 'MTH', 'GESTM', 'MTHFOST', 'NMTH', 'NMTHF', 'STPMTH', 'NPRN', 'PRNFOST', 'STPPRN', 'SIB', 'BRO', 'HBRO', 'NBRO', 'TWINBRO', 'FTWINBRO', 'ITWINBRO', 'STPBRO', 'HSIB', 'HSIS', 'NSIB', 'NSIS', 'TWINSIS', 'FTWINSIS', 'ITWINSIS', 'TWIN', 'FTWIN', 'ITWIN', 'SIS', 'STPSIS', 'STPSIB', 'SIGOTHR', 'DOMPART', 'FMRSPS', 'SPS', 'HUSB', 'WIFE']}, 'type'=>'CodeableConcept', 'path'=>'Member.involvement', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/group-involvement-set'}},
          'period' => {'type'=>'Period', 'path'=>'Member.period', 'min'=>0, 'max'=>1},
          'inactive' => {'type'=>'boolean', 'path'=>'Member.inactive', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :entity            # 1-1 Reference(CareTeam|Device|Group|HealthcareService|Location|Organization|Patient|Practitioner|PractitionerRole|RelatedPerson|Specimen)
        attr_accessor :involvement       # 0-* [ CodeableConcept ]
        attr_accessor :period            # 0-1 Period
        attr_accessor :inactive          # 0-1 boolean
      end

      attr_accessor :id                     # 0-1 id
      attr_accessor :meta                   # 0-1 Meta
      attr_accessor :implicitRules          # 0-1 uri
      attr_accessor :language               # 0-1 code
      attr_accessor :text                   # 0-1 Narrative
      attr_accessor :contained              # 0-* [ Resource ]
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :url                    # 0-1 uri
      attr_accessor :identifier             # 0-* [ Identifier ]
      attr_accessor :version                # 0-1 string
      attr_accessor :versionAlgorithmString # 0-1 string
      attr_accessor :versionAlgorithmCoding # 0-1 Coding
      attr_accessor :name                   # 0-1 string
      attr_accessor :title                  # 0-1 string
      attr_accessor :status                 # 0-1 code
      attr_accessor :experimental           # 0-1 boolean
      attr_accessor :date                   # 0-1 dateTime
      attr_accessor :publisher              # 0-1 string
      attr_accessor :contact                # 0-* [ ContactDetail ]
      attr_accessor :description            # 0-1 markdown
      attr_accessor :useContext             # 0-* [ UsageContext ]
      attr_accessor :purpose                # 0-1 markdown
      attr_accessor :copyright              # 0-1 markdown
      attr_accessor :copyrightLabel         # 0-1 string
      attr_accessor :type                   # 0-1 code
      attr_accessor :membership             # 1-1 code
      attr_accessor :code                   # 0-1 CodeableConcept
      attr_accessor :quantity               # 0-1 unsignedInt
      attr_accessor :managingEntity         # 0-1 Reference(Organization|RelatedPerson|Practitioner|PractitionerRole)
      attr_accessor :combinationMethod      # 0-1 code
      attr_accessor :combinationThreshold   # 0-1 positiveInt
      attr_accessor :characteristic         # 0-* [ Group::Characteristic ]
      attr_accessor :member                 # 0-* [ Group::Member ]

      def resourceType
        'Group'
      end
    end
  end
end