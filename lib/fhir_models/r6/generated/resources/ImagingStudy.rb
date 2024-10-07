module FHIR
  module build.fhir.org
    class ImagingStudy < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['based-on', 'body-site', 'body-structure', 'dicom-class', 'encounter', 'endpoint', 'identifier', 'instance', 'modality', 'patient', 'performer', 'reason-concept', 'reason-reference', 'referrer', 'series', 'started', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ImagingStudy.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ImagingStudy.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ImagingStudy.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ImagingStudy.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ImagingStudy.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ImagingStudy.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ImagingStudy.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ImagingStudy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'ImagingStudy.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/imagingstudy-status'=>['registered', 'available', 'cancelled', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'ImagingStudy.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/imagingstudy-status'}},
        'modality' => {'valid_codes'=>{'http://dicom.nema.org/resources/ontology/DCM'=>['BMD', 'EOG', 'SM', 'SR', 'FID', 'OP', 'OT', 'KO', 'ECG', 'GM', 'XA', 'IOL', 'XC', 'ASMT', 'DMS', 'IVUS', 'CR', 'CT', 'PA', 'OSS', 'TG', 'REG', 'LEN', 'TEXTUREMAP', 'RTDOSE', 'OPTENF', 'HC', 'RTPLAN', 'HD', 'OCT', 'BDUS', 'M3D', 'DG', 'PR', 'PT', 'EPS', 'LS', 'PX', 'OPM', 'OPTBSV', 'OPV', 'DX', 'OPT', 'DOC', 'RTRECORD', 'MG', 'US', 'EMG', 'IVOCT', 'RTSTRUCT', 'MR', 'IO', 'EEG', 'RTIMAGE', 'VA', 'RESP', 'ES', 'RWV', 'AR', 'POS', 'SEG', 'RG', 'RF', 'AU', 'KER', 'SMR', 'CTPROTOCOL', 'STAIN', 'OAM', 'NM', 'PLAN', 'BI', 'SRF', 'CFM']}, 'type'=>'CodeableConcept', 'path'=>'ImagingStudy.modality', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_33.html'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Group'], 'type'=>'Reference', 'path'=>'ImagingStudy.subject', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'ImagingStudy.encounter', 'min'=>0, 'max'=>1},
        'started' => {'type'=>'dateTime', 'path'=>'ImagingStudy.started', 'min'=>0, 'max'=>1},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/Appointment', 'http://hl7.org/fhir/StructureDefinition/AppointmentResponse', 'http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'ImagingStudy.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure'], 'type'=>'Reference', 'path'=>'ImagingStudy.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'referrer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'ImagingStudy.referrer', 'min'=>0, 'max'=>1},
        'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'ImagingStudy.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'numberOfSeries' => {'type'=>'unsignedInt', 'path'=>'ImagingStudy.numberOfSeries', 'min'=>0, 'max'=>1},
        'numberOfInstances' => {'type'=>'unsignedInt', 'path'=>'ImagingStudy.numberOfInstances', 'min'=>0, 'max'=>1},
        'procedure' => {'type'=>'CodeableReference', 'path'=>'ImagingStudy.procedure', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'ImagingStudy.location', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'CodeableReference', 'path'=>'ImagingStudy.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'note' => {'type'=>'Annotation', 'path'=>'ImagingStudy.note', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'string', 'path'=>'ImagingStudy.description', 'min'=>0, 'max'=>1},
        'series' => {'type'=>'ImagingStudy::Series', 'path'=>'ImagingStudy.series', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Series < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Series.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Series.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Series.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'uid' => {'type'=>'id', 'path'=>'Series.uid', 'min'=>1, 'max'=>1},
          'number' => {'type'=>'unsignedInt', 'path'=>'Series.number', 'min'=>0, 'max'=>1},
          'modality' => {'valid_codes'=>{'http://dicom.nema.org/resources/ontology/DCM'=>['BMD', 'EOG', 'SM', 'SR', 'FID', 'OP', 'OT', 'KO', 'ECG', 'GM', 'XA', 'IOL', 'XC', 'ASMT', 'DMS', 'IVUS', 'CR', 'CT', 'PA', 'OSS', 'TG', 'REG', 'LEN', 'TEXTUREMAP', 'RTDOSE', 'OPTENF', 'HC', 'RTPLAN', 'HD', 'OCT', 'BDUS', 'M3D', 'DG', 'PR', 'PT', 'EPS', 'LS', 'PX', 'OPM', 'OPTBSV', 'OPV', 'DX', 'OPT', 'DOC', 'RTRECORD', 'MG', 'US', 'EMG', 'IVOCT', 'RTSTRUCT', 'MR', 'IO', 'EEG', 'RTIMAGE', 'VA', 'RESP', 'ES', 'RWV', 'AR', 'POS', 'SEG', 'RG', 'RF', 'AU', 'KER', 'SMR', 'CTPROTOCOL', 'STAIN', 'OAM', 'NM', 'PLAN', 'BI', 'SRF', 'CFM']}, 'type'=>'CodeableConcept', 'path'=>'Series.modality', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_33.html'}},
          'description' => {'type'=>'string', 'path'=>'Series.description', 'min'=>0, 'max'=>1},
          'numberOfInstances' => {'type'=>'unsignedInt', 'path'=>'Series.numberOfInstances', 'min'=>0, 'max'=>1},
          'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'Series.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
          'bodySite' => {'type'=>'CodeableReference', 'path'=>'Series.bodySite', 'min'=>0, 'max'=>1},
          'laterality' => {'valid_codes'=>{'http://snomed.info/sct'=>['51440002', '24028007', '7771000', '66459002']}, 'type'=>'CodeableConcept', 'path'=>'Series.laterality', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_244.html'}},
          'specimen' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'Series.specimen', 'min'=>0, 'max'=>Float::INFINITY},
          'started' => {'type'=>'dateTime', 'path'=>'Series.started', 'min'=>0, 'max'=>1},
          'performer' => {'type'=>'ImagingStudy::Series::Performer', 'path'=>'Series.performer', 'min'=>0, 'max'=>Float::INFINITY},
          'instance' => {'type'=>'ImagingStudy::Series::Instance', 'path'=>'Series.instance', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Performer < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'function' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v3-ParticipationType'=>['CON', 'VRF', 'PRF', 'SPRF', 'REF']}, 'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/series-performer-function'}},
            'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :function          # 0-1 CodeableConcept
          attr_accessor :actor             # 1-1 Reference(Practitioner|PractitionerRole|Organization|CareTeam|Patient|Device|RelatedPerson|HealthcareService)
        end

        class Instance < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Instance.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Instance.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Instance.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'uid' => {'type'=>'id', 'path'=>'Instance.uid', 'min'=>1, 'max'=>1},
            'sopClass' => {'type'=>'oid', 'path'=>'Instance.sopClass', 'min'=>1, 'max'=>1},
            'number' => {'type'=>'unsignedInt', 'path'=>'Instance.number', 'min'=>0, 'max'=>1},
            'title' => {'type'=>'string', 'path'=>'Instance.title', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :uid               # 1-1 id
          attr_accessor :sopClass          # 1-1 oid
          attr_accessor :number            # 0-1 unsignedInt
          attr_accessor :title             # 0-1 string
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :uid               # 1-1 id
        attr_accessor :number            # 0-1 unsignedInt
        attr_accessor :modality          # 1-1 CodeableConcept
        attr_accessor :description       # 0-1 string
        attr_accessor :numberOfInstances # 0-1 unsignedInt
        attr_accessor :endpoint          # 0-* [ Reference(Endpoint) ]
        attr_accessor :bodySite          # 0-1 CodeableReference
        attr_accessor :laterality        # 0-1 CodeableConcept
        attr_accessor :specimen          # 0-* [ Reference(Specimen) ]
        attr_accessor :started           # 0-1 dateTime
        attr_accessor :performer         # 0-* [ ImagingStudy::Series::Performer ]
        attr_accessor :instance          # 0-* [ ImagingStudy::Series::Instance ]
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
      attr_accessor :status            # 1-1 code
      attr_accessor :modality          # 0-* [ CodeableConcept ]
      attr_accessor :subject           # 1-1 Reference(Patient|Device|Group)
      attr_accessor :encounter         # 0-1 Reference(Encounter)
      attr_accessor :started           # 0-1 dateTime
      attr_accessor :basedOn           # 0-* [ Reference(CarePlan|ServiceRequest|Appointment|AppointmentResponse|Task) ]
      attr_accessor :partOf            # 0-* [ Reference(Procedure) ]
      attr_accessor :referrer          # 0-1 Reference(Practitioner|PractitionerRole)
      attr_accessor :endpoint          # 0-* [ Reference(Endpoint) ]
      attr_accessor :numberOfSeries    # 0-1 unsignedInt
      attr_accessor :numberOfInstances # 0-1 unsignedInt
      attr_accessor :procedure         # 0-* [ CodeableReference ]
      attr_accessor :location          # 0-1 Reference(Location)
      attr_accessor :reason            # 0-* [ CodeableReference ]
      attr_accessor :note              # 0-* [ Annotation ]
      attr_accessor :description       # 0-1 string
      attr_accessor :series            # 0-* [ ImagingStudy::Series ]

      def resourceType
        'ImagingStudy'
      end
    end
  end
end