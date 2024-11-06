module FHIR
  module R6
    class BiologicallyDerivedProductDispense < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['identifier', 'patient', 'performer', 'product', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'BiologicallyDerivedProductDispense.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'BiologicallyDerivedProductDispense.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'BiologicallyDerivedProductDispense.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'BiologicallyDerivedProductDispense.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'BiologicallyDerivedProductDispense.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'BiologicallyDerivedProductDispense.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'BiologicallyDerivedProductDispense.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'BiologicallyDerivedProductDispense.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'BiologicallyDerivedProductDispense.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProductDispense.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'partOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProductDispense'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProductDispense.partOf', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/biologicallyderivedproductdispense-status'=>['preparation', 'in-progress', 'allocated', 'issued', 'unfulfilled', 'returned', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'BiologicallyDerivedProductDispense.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/biologicallyderivedproductdispense-status'}},
        'originRelationshipType' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/biologicallyderivedproductdispense-origin-relationship'=>['autologous', 'related', 'directed', 'allogeneic', 'xenogenic']}, 'type'=>'CodeableConcept', 'path'=>'BiologicallyDerivedProductDispense.originRelationshipType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/biologicallyderivedproductdispense-origin-relationship'}},
        'product' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProductDispense.product', 'min'=>1, 'max'=>1},
        'patient' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProductDispense.patient', 'min'=>1, 'max'=>1},
        'matchStatus' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/biologicallyderivedproductdispense-match-status'=>['crossmatched', 'selected', 'unmatched', 'least-incompatible']}, 'type'=>'CodeableConcept', 'path'=>'BiologicallyDerivedProductDispense.matchStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/biologicallyderivedproductdispense-match-status'}},
        'performer' => {'type'=>'BiologicallyDerivedProductDispense::Performer', 'path'=>'BiologicallyDerivedProductDispense.performer', 'min'=>0, 'max'=>Float::INFINITY},
        'location' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProductDispense.location', 'min'=>0, 'max'=>1},
        'quantity' => {'type'=>'Quantity', 'path'=>'BiologicallyDerivedProductDispense.quantity', 'min'=>0, 'max'=>1},
        'preparedDate' => {'type'=>'dateTime', 'path'=>'BiologicallyDerivedProductDispense.preparedDate', 'min'=>0, 'max'=>1},
        'whenHandedOver' => {'type'=>'dateTime', 'path'=>'BiologicallyDerivedProductDispense.whenHandedOver', 'min'=>0, 'max'=>1},
        'destination' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Location'], 'type'=>'Reference', 'path'=>'BiologicallyDerivedProductDispense.destination', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'BiologicallyDerivedProductDispense.note', 'min'=>0, 'max'=>Float::INFINITY},
        'usageInstruction' => {'type'=>'string', 'path'=>'BiologicallyDerivedProductDispense.usageInstruction', 'min'=>0, 'max'=>1}
      }

      class Performer < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'function' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/biologicallyderivedproductdispense-performer-function'=>['group-and-type', 'antibody-screen', 'antibody-identification', 'crossmatch', 'release', 'transport', 'receipt']}, 'type'=>'CodeableConcept', 'path'=>'Performer.function', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/biologicallyderivedproductdispense-performer-function'}},
          'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :function          # 0-1 CodeableConcept
        attr_accessor :actor             # 1-1 Reference(Practitioner)
      end

      attr_accessor :id                     # 0-1 id
      attr_accessor :meta                   # 0-1 Meta
      attr_accessor :implicitRules          # 0-1 uri
      attr_accessor :language               # 0-1 code
      attr_accessor :text                   # 0-1 Narrative
      attr_accessor :contained              # 0-* [ Resource ]
      attr_accessor :extension              # 0-* [ Extension ]
      attr_accessor :modifierExtension      # 0-* [ Extension ]
      attr_accessor :identifier             # 0-* [ Identifier ]
      attr_accessor :basedOn                # 0-* [ Reference(ServiceRequest) ]
      attr_accessor :partOf                 # 0-* [ Reference(BiologicallyDerivedProductDispense) ]
      attr_accessor :status                 # 1-1 code
      attr_accessor :originRelationshipType # 0-1 CodeableConcept
      attr_accessor :product                # 1-1 Reference(BiologicallyDerivedProduct)
      attr_accessor :patient                # 1-1 Reference(Patient)
      attr_accessor :matchStatus            # 0-1 CodeableConcept
      attr_accessor :performer              # 0-* [ BiologicallyDerivedProductDispense::Performer ]
      attr_accessor :location               # 0-1 Reference(Location)
      attr_accessor :quantity               # 0-1 Quantity
      attr_accessor :preparedDate           # 0-1 dateTime
      attr_accessor :whenHandedOver         # 0-1 dateTime
      attr_accessor :destination            # 0-1 Reference(Location)
      attr_accessor :note                   # 0-* [ Annotation ]
      attr_accessor :usageInstruction       # 0-1 string

      def resourceType
        'BiologicallyDerivedProductDispense'
      end
    end
  end
end