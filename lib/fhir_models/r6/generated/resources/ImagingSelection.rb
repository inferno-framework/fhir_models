module FHIR
  module R6
    class ImagingSelection < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['based-on', 'body-site', 'body-structure', 'category', 'code', 'derived-from', 'identifier', 'issued', 'patient', 'status', 'study-uid', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'ImagingSelection.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'ImagingSelection.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'ImagingSelection.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'ImagingSelection.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'ImagingSelection.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'ImagingSelection.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'ImagingSelection.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'ImagingSelection.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'ImagingSelection.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/imagingselection-status'=>['available', 'entered-in-error', 'inactive', 'unknown']}, 'type'=>'code', 'path'=>'ImagingSelection.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/imagingselection-status'}},
        'category' => {'valid_codes'=>{'http://dicom.nema.org/resources/ontology/DCM'=>['113000', '113001', '113002', '113003', '113004', '128219', '128218', '128211', '128210', '128213', '128212', '128215', '128214', '128217', '128216', '113005', '113006', '113007', '113008', '113009', '113030', '113031', '113032', '113033', '113034', '113035', '113036', '113037', '128208', '128207', '128209', '128200', '128202', '128201', '128204', '128203', '128206', '128205', '113038', '113039', '113020', '113021', '113022', '128714', '128713', '128199', '128710', '128711', '128192', '128191', '128194', '128193', '128196', '128195', '128198', '128197', '113010', '113013', '128190', '130373', '130372', '130371', '130370', '128222', '128189', '128221', '128188', '128223', '128181', '128180', '113018', '128183', '128182', '128185', '128184', '128220', '128187', '128186']}, 'type'=>'CodeableConcept', 'path'=>'ImagingSelection.category', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_7010.html'}},
        'code' => {'valid_codes'=>{'http://dicom.nema.org/resources/ontology/DCM'=>['113000', '113001', '113002', '113003', '113004', '128219', '128218', '128211', '128210', '128213', '128212', '128215', '128214', '128217', '128216', '113005', '113006', '113007', '113008', '113009', '113030', '113031', '113032', '113033', '113034', '113035', '113036', '113037', '128208', '128207', '128209', '128200', '128202', '128201', '128204', '128203', '128206', '128205', '113038', '113039', '113020', '113021', '113022', '128714', '128713', '128199', '128710', '128711', '128192', '128191', '128194', '128193', '128196', '128195', '128198', '128197', '113010', '113013', '128190', '130373', '130372', '130371', '130370', '128222', '128189', '128221', '128188', '128223', '128181', '128180', '113018', '128183', '128182', '128185', '128184', '128220', '128187', '128186']}, 'type'=>'CodeableConcept', 'path'=>'ImagingSelection.code', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_7010.html'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/Medication', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'ImagingSelection.subject', 'min'=>0, 'max'=>1},
        'issued' => {'type'=>'instant', 'path'=>'ImagingSelection.issued', 'min'=>0, 'max'=>1},
        'performer' => {'type'=>'ImagingSelection::Performer', 'path'=>'ImagingSelection.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CarePlan', 'http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/Appointment', 'http://hl7.org/fhir/StructureDefinition/AppointmentResponse', 'http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'ImagingSelection.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'derivedFrom' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ImagingStudy', 'http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'ImagingSelection.derivedFrom', 'min'=>0, 'max'=>Float::INFINITY},
        'studyUid' => {'type'=>'id', 'path'=>'ImagingSelection.studyUid', 'min'=>0, 'max'=>1},
        'seriesUid' => {'type'=>'id', 'path'=>'ImagingSelection.seriesUid', 'min'=>0, 'max'=>1},
        'seriesNumber' => {'type'=>'unsignedInt', 'path'=>'ImagingSelection.seriesNumber', 'min'=>0, 'max'=>1},
        'frameOfReferenceUid' => {'type'=>'id', 'path'=>'ImagingSelection.frameOfReferenceUid', 'min'=>0, 'max'=>1},
        'bodySite' => {'type'=>'CodeableReference', 'path'=>'ImagingSelection.bodySite', 'min'=>0, 'max'=>Float::INFINITY},
        'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ImagingSelection'], 'type'=>'Reference', 'path'=>'ImagingSelection.focus', 'min'=>0, 'max'=>Float::INFINITY},
        'endpoint' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Endpoint'], 'type'=>'Reference', 'path'=>'ImagingSelection.endpoint', 'min'=>0, 'max'=>Float::INFINITY},
        'instance' => {'type'=>'ImagingSelection::Instance', 'path'=>'ImagingSelection.instance', 'min'=>0, 'max'=>Float::INFINITY},
        'imageRegion3D' => {'type'=>'ImagingSelection::ImageRegion3D', 'path'=>'ImagingSelection.imageRegion3D', 'min'=>0, 'max'=>Float::INFINITY}
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
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Device', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/HealthcareService'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 0-1 Reference(Practitioner|PractitionerRole|Device|Organization|CareTeam|Patient|RelatedPerson|HealthcareService)
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
          'number' => {'type'=>'unsignedInt', 'path'=>'Instance.number', 'min'=>0, 'max'=>1},
          'sopClass' => {'type'=>'oid', 'path'=>'Instance.sopClass', 'min'=>0, 'max'=>1},
          'subset' => {'type'=>'string', 'path'=>'Instance.subset', 'min'=>0, 'max'=>Float::INFINITY},
          'imageRegion2D' => {'type'=>'ImagingSelection::Instance::ImageRegion2D', 'path'=>'Instance.imageRegion2D', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class ImageRegion2D < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'ImageRegion2D.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'ImageRegion2D.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'ImageRegion2D.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'regionType' => {'valid_codes'=>{'http://hl7.org/fhir/imagingselection-2dgraphictype'=>['point', 'polyline', 'multipoint', 'circle', 'ellipse']}, 'type'=>'code', 'path'=>'ImageRegion2D.regionType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/imagingselection-2dgraphictype'}},
            'coordinate' => {'type'=>'decimal', 'path'=>'ImageRegion2D.coordinate', 'min'=>1, 'max'=>Float::INFINITY}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :regionType        # 1-1 code
          attr_accessor :coordinate        # 1-* [ decimal ]
        end

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :uid               # 1-1 id
        attr_accessor :number            # 0-1 unsignedInt
        attr_accessor :sopClass          # 0-1 oid
        attr_accessor :subset            # 0-* [ string ]
        attr_accessor :imageRegion2D     # 0-* [ ImagingSelection::Instance::ImageRegion2D ]
      end

      class ImageRegion3D < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'ImageRegion3D.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'ImageRegion3D.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'ImageRegion3D.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'regionType' => {'valid_codes'=>{'http://hl7.org/fhir/imagingselection-3dgraphictype'=>['point', 'multipoint', 'polyline', 'polygon', 'ellipse', 'ellipsoid']}, 'type'=>'code', 'path'=>'ImageRegion3D.regionType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/imagingselection-3dgraphictype'}},
          'coordinate' => {'type'=>'decimal', 'path'=>'ImageRegion3D.coordinate', 'min'=>1, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :regionType        # 1-1 code
        attr_accessor :coordinate        # 1-* [ decimal ]
      end

      attr_accessor :id                  # 0-1 id
      attr_accessor :meta                # 0-1 Meta
      attr_accessor :implicitRules       # 0-1 uri
      attr_accessor :language            # 0-1 code
      attr_accessor :text                # 0-1 Narrative
      attr_accessor :contained           # 0-* [ Resource ]
      attr_accessor :extension           # 0-* [ Extension ]
      attr_accessor :modifierExtension   # 0-* [ Extension ]
      attr_accessor :identifier          # 0-* [ Identifier ]
      attr_accessor :status              # 1-1 code
      attr_accessor :category            # 0-* [ CodeableConcept ]
      attr_accessor :code                # 1-1 CodeableConcept
      attr_accessor :subject             # 0-1 Reference(Patient|Group|Device|Procedure|Practitioner|Medication|Substance|Specimen)
      attr_accessor :issued              # 0-1 instant
      attr_accessor :performer           # 0-* [ ImagingSelection::Performer ]
      attr_accessor :basedOn             # 0-* [ Reference(CarePlan|ServiceRequest|Appointment|AppointmentResponse|Task) ]
      attr_accessor :derivedFrom         # 0-* [ Reference(ImagingStudy|DocumentReference) ]
      attr_accessor :studyUid            # 0-1 id
      attr_accessor :seriesUid           # 0-1 id
      attr_accessor :seriesNumber        # 0-1 unsignedInt
      attr_accessor :frameOfReferenceUid # 0-1 id
      attr_accessor :bodySite            # 0-* [ CodeableReference ]
      attr_accessor :focus               # 0-* [ Reference(ImagingSelection) ]
      attr_accessor :endpoint            # 0-* [ Reference(Endpoint) ]
      attr_accessor :instance            # 0-* [ ImagingSelection::Instance ]
      attr_accessor :imageRegion3D       # 0-* [ ImagingSelection::ImageRegion3D ]

      def resourceType
        'ImagingSelection'
      end
    end
  end
end