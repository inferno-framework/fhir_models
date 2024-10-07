module FHIR
  module build.fhir.org
    class Subscription < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['contact', 'content-level', 'filter-event', 'filter-value', 'identifier', 'name', 'owner', 'payload', 'status', 'topic', 'type', 'url']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Subscription.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Subscription.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Subscription.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Subscription.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Subscription.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Subscription.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Subscription.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Subscription.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Subscription.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'name' => {'type'=>'string', 'path'=>'Subscription.name', 'min'=>0, 'max'=>1},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/subscription-status'=>['requested', 'active', 'error', 'off', 'entered-in-error']}, 'type'=>'code', 'path'=>'Subscription.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-status'}},
        'topic' => {'type'=>'canonical', 'path'=>'Subscription.topic', 'min'=>1, 'max'=>1},
        'contact' => {'type'=>'ContactPoint', 'path'=>'Subscription.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'end' => {'type'=>'instant', 'path'=>'Subscription.end', 'min'=>0, 'max'=>1},
        'managingEntity' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/CareTeam', 'http://hl7.org/fhir/StructureDefinition/HealthcareService', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/RelatedPerson', 'http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Subscription.managingEntity', 'min'=>0, 'max'=>1},
        'reason' => {'type'=>'string', 'path'=>'Subscription.reason', 'min'=>0, 'max'=>1},
        'filterBy' => {'type'=>'Subscription::FilterBy', 'path'=>'Subscription.filterBy', 'min'=>0, 'max'=>Float::INFINITY},
        'channelType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/subscription-channel-type'=>['rest-hook', 'websocket', 'email', 'message']}, 'type'=>'Coding', 'path'=>'Subscription.channelType', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-channel-type'}},
        'endpoint' => {'type'=>'url', 'path'=>'Subscription.endpoint', 'min'=>0, 'max'=>1},
        'parameter' => {'type'=>'Subscription::Parameter', 'path'=>'Subscription.parameter', 'min'=>0, 'max'=>Float::INFINITY},
        'heartbeatPeriod' => {'type'=>'unsignedInt', 'path'=>'Subscription.heartbeatPeriod', 'min'=>0, 'max'=>1},
        'timeout' => {'type'=>'unsignedInt', 'path'=>'Subscription.timeout', 'min'=>0, 'max'=>1},
        'contentType' => {'type'=>'code', 'path'=>'Subscription.contentType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
        'content' => {'valid_codes'=>{'http://hl7.org/fhir/subscription-payload-content'=>['empty', 'id-only', 'full-resource']}, 'type'=>'code', 'path'=>'Subscription.content', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/subscription-payload-content'}},
        'maxCount' => {'type'=>'positiveInt', 'path'=>'Subscription.maxCount', 'min'=>0, 'max'=>1}
      }

      class FilterBy < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'FilterBy.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'FilterBy.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'FilterBy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'resource' => {'type'=>'uri', 'path'=>'FilterBy.resource', 'min'=>0, 'max'=>1},
          'filterParameter' => {'type'=>'string', 'path'=>'FilterBy.filterParameter', 'min'=>1, 'max'=>1},
          'comparator' => {'valid_codes'=>{'http://hl7.org/fhir/search-comparator'=>['eq', 'ne', 'gt', 'lt', 'ge', 'le', 'sa', 'eb', 'ap']}, 'type'=>'code', 'path'=>'FilterBy.comparator', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-comparator'}},
          'modifier' => {'valid_codes'=>{'http://hl7.org/fhir/search-modifier-code'=>['missing', 'exact', 'contains', 'not', 'text', 'in', 'not-in', 'below', 'above', 'type', 'identifier', 'of-type', 'code-text', 'text-advanced', 'iterate']}, 'type'=>'code', 'path'=>'FilterBy.modifier', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/search-modifier-code'}},
          'value' => {'type'=>'string', 'path'=>'FilterBy.value', 'min'=>1, 'max'=>1},
          'event' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/v2-0003'=>['X01', 'A01', 'A02', 'A03', 'A04', 'A05', 'A06', 'A07', 'A08', 'A09', 'A10', 'A11', 'A12', 'A13', 'A14', 'A15', 'A16', 'A17', 'A18', 'A19', 'A20', 'A21', 'A22', 'A23', 'A24', 'A25', 'A26', 'A27', 'A28', 'A29', 'A30', 'A31', 'A32', 'A33', 'A34', 'A35', 'A36', 'A37', 'A38', 'A39', 'A40', 'A41', 'A42', 'A43', 'A44', 'A45', 'A46', 'A47', 'A48', 'A49', 'A50', 'A51', 'A52', 'A53', 'A54', 'A55', 'A60', 'A61', 'A62', 'B01', 'B02', 'B03', 'B04', 'B05', 'B06', 'B07', 'B08', 'C01', 'C02', 'C03', 'C04', 'C05', 'C06', 'C07', 'C08', 'C09', 'C10', 'C11', 'C12', 'CNQ', 'E01', 'E02', 'E03', 'varies', 'E04', 'E10', 'E12', 'E13', 'E15', 'E20', 'E21', 'E22', 'E24', 'E30', 'E31', 'I01', 'I02', 'I03', 'I04', 'I05', 'I06', 'I07', 'I08', 'I09', 'I10', 'I11', 'I12', 'I13', 'I14', 'I15', 'I16', 'I17', 'I18', 'I19', 'I20', 'I21', 'I22', 'J01', 'J02', 'K11', 'K13', 'K15', 'K21', 'K22', 'K23', 'K24', 'K25', 'K31', 'K32', 'K33', 'K34', 'M01', 'M02', 'M03', 'M04', 'M05', 'M06', 'M07', 'M08', 'M09', 'M10', 'M11', 'M12', 'M13', 'M14', 'M15', 'R0R', 'M16', 'M17', 'M18', 'N01', 'N02', 'O01', 'O02', 'O03', 'O04', 'O05', 'O06', 'O07', 'O08', 'O09', 'O10', 'O11', 'O12', 'O13', 'O14', 'O15', 'O16', 'O17', 'O18', 'O19', 'O20', 'O21', 'O22', 'O23', 'O24', 'O25', 'O26', 'O27', 'O28', 'O29', 'O30', 'O31', 'O32', 'O33', 'O34', 'O35', 'R05', 'O36', 'R06', 'O37', 'O38', 'O39', 'O40', 'O41', 'O42', 'RAR', 'O43', 'RDR', 'Q04', 'O44', 'RER', 'O45', 'RGR', 'O46', 'Q07', 'O47', 'Q08', 'O48', 'Q09', 'O49', 'O50', 'O51', 'O52', 'O53', 'O54', 'O55', 'O56', 'O57', 'O58', 'O59', 'P01', 'P02', 'P03', 'P04', 'P05', 'P06', 'P07', 'R03', 'P08', 'P09', 'P10', 'R07', 'P11', 'R08', 'P12', 'PC1', 'R09', 'PC2', 'PC3', 'PC4', 'PC5', 'PC6', 'PC7', 'PC8', 'PC9', 'PCA', 'PCB', 'PCC', 'PCD', 'PCE', 'PCF', 'PCG', 'PCH', 'PCJ', 'PCK', 'PCL', 'Q01', 'Q02', 'Q03', 'Q05', 'Q06', 'Q11', 'Q13', 'Q15', 'Q16', 'Q17', 'Q21', 'Q22', 'Q23', 'Q24', 'Q25', 'Q26', 'Q27', 'Q28', 'Q29', 'Q30', 'Q31', 'Q32', 'Q33', 'Q34', 'R01', 'R02', 'R04', 'R21', 'R22', 'R23', 'R24', 'R25', 'R26', 'R30', 'R31', 'R32', 'R33', 'R40', 'R41', 'R42', 'R43', 'ROR', 'S01', 'S02', 'S03', 'S04', 'S05', 'S06', 'S07', 'S08', 'S09', 'S10', 'S11', 'S12', 'S13', 'S14', 'S15', 'S16', 'S17', 'S18', 'S19', 'S20', 'S21', 'S22', 'S23', 'S24', 'S25', 'S26', 'S27', 'S28', 'S29', 'S30', 'S31', 'S32', 'S33', 'S34', 'S35', 'S36', 'S37', 'S38', 'S39', 'S40', 'S41', 'S42', 'S43', 'S44', 'S45', 'S46', 'S47', 'S48', 'S49', 'S50', 'S51', 'S52', 'T01', 'T02', 'T03', 'T04', 'T05', 'T06', 'T07', 'T08', 'T09', 'T10', 'T11', 'T12', 'U01', 'U02', 'U03', 'U04', 'U05', 'U06', 'U07', 'U08', 'U09', 'U10', 'U11', 'U12', 'U13', 'U14', 'V01', 'V02', 'V03', 'V04', 'Varies', 'W01', 'W02']}, 'type'=>'CodeableConcept', 'path'=>'FilterBy.event', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://terminology.hl7.org/ValueSet/v2-0003'}}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :resource          # 0-1 uri
        attr_accessor :filterParameter   # 1-1 string
        attr_accessor :comparator        # 0-1 code
        attr_accessor :modifier          # 0-1 code
        attr_accessor :value             # 1-1 string
        attr_accessor :event             # 0-* [ CodeableConcept ]
      end

      class Parameter < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Parameter.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Parameter.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Parameter.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'name' => {'type'=>'string', 'path'=>'Parameter.name', 'min'=>1, 'max'=>1},
          'value' => {'type'=>'string', 'path'=>'Parameter.value', 'min'=>1, 'max'=>1}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :name              # 1-1 string
        attr_accessor :value             # 1-1 string
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
      attr_accessor :name              # 0-1 string
      attr_accessor :status            # 1-1 code
      attr_accessor :topic             # 1-1 canonical
      attr_accessor :contact           # 0-* [ ContactPoint ]
      attr_accessor :end               # 0-1 instant
      attr_accessor :managingEntity    # 0-1 Reference(CareTeam|HealthcareService|Organization|RelatedPerson|Patient|Practitioner|PractitionerRole)
      attr_accessor :reason            # 0-1 string
      attr_accessor :filterBy          # 0-* [ Subscription::FilterBy ]
      attr_accessor :channelType       # 1-1 Coding
      attr_accessor :endpoint          # 0-1 url
      attr_accessor :parameter         # 0-* [ Subscription::Parameter ]
      attr_accessor :heartbeatPeriod   # 0-1 unsignedInt
      attr_accessor :timeout           # 0-1 unsignedInt
      attr_accessor :contentType       # 0-1 code
      attr_accessor :content           # 0-1 code
      attr_accessor :maxCount          # 0-1 positiveInt

      def resourceType
        'Subscription'
      end
    end
  end
end