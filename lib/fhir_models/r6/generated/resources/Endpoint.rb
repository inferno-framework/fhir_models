module FHIR
  module R6
    class Endpoint < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['connection-type', 'identifier', 'name', 'organization', 'payload-type', 'status']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'Endpoint.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'Endpoint.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'Endpoint.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'Endpoint.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'Endpoint.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'Endpoint.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'Endpoint.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'Endpoint.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'Endpoint.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/endpoint-status'=>['active', 'suspended', 'error', 'off', 'entered-in-error']}, 'type'=>'code', 'path'=>'Endpoint.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/endpoint-status'}},
        'connectionType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/endpoint-connection-type'=>['dicom-wado-rs', 'dicom-qido-rs', 'dicom-stow-rs', 'dicom-wado-uri', 'hl7-fhir-rest', 'hl7-fhir-msg', 'hl7v2-mllp', 'secure-email', 'direct-project', 'cds-hooks-service', 'ihe-xcpd', 'ihe-xca', 'ihe-xdr', 'ihe-xds', 'ihe-iid']}, 'type'=>'CodeableConcept', 'path'=>'Endpoint.connectionType', 'min'=>1, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/endpoint-connection-type'}},
        'name' => {'type'=>'string', 'path'=>'Endpoint.name', 'min'=>0, 'max'=>1},
        'description' => {'type'=>'string', 'path'=>'Endpoint.description', 'min'=>0, 'max'=>1},
        'environmentType' => {'valid_codes'=>{'http://hl7.org/fhir/endpoint-environment'=>['prod', 'staging', 'dev', 'test', 'train']}, 'type'=>'CodeableConcept', 'path'=>'Endpoint.environmentType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://hl7.org/fhir/ValueSet/endpoint-environment'}},
        'managingOrganization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Endpoint.managingOrganization', 'min'=>0, 'max'=>1},
        'contact' => {'type'=>'ContactPoint', 'path'=>'Endpoint.contact', 'min'=>0, 'max'=>Float::INFINITY},
        'period' => {'type'=>'Period', 'path'=>'Endpoint.period', 'min'=>0, 'max'=>1},
        'availability' => {'type'=>'Availability', 'path'=>'Endpoint.availability', 'min'=>0, 'max'=>1},
        'payload' => {'type'=>'Endpoint::Payload', 'path'=>'Endpoint.payload', 'min'=>0, 'max'=>Float::INFINITY},
        'address' => {'type'=>'url', 'path'=>'Endpoint.address', 'min'=>1, 'max'=>1},
        'header' => {'type'=>'string', 'path'=>'Endpoint.header', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Payload < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Payload.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Payload.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Payload.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/endpoint-payload-type'=>['any', 'none'], 'http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode'=>['urn:ihe:pcc:xphr:2007', 'urn:ihe:pcc:aps:2007', 'urn:ihe:pcc:xds-ms:2007', 'urn:ihe:pcc:edr:2007', 'urn:ihe:pcc:edes:2007', 'urn:ihe:pcc:apr:handp:2008', 'urn:ihe:pcc:apr:lab:2008', 'urn:ihe:pcc:apr:edu:2008', 'urn:ihe:pcc:crc:2008', 'urn:ihe:pcc:cm:2008', 'urn:ihe:pcc:ic:2008', 'urn:ihe:pcc:tn:2007', 'urn:ihe:pcc:nn:2007', 'urn:ihe:pcc:ctn:2007', 'urn:ihe:pcc:edpn:2007', 'urn:ihe:pcc:hp:2008', 'urn:ihe:pcc:ldhp:2009', 'urn:ihe:pcc:lds:2009', 'urn:ihe:pcc:mds:2009', 'urn:ihe:pcc:nds:2010', 'urn:ihe:pcc:ppvs:2010', 'urn:ihe:pcc:trs:2011', 'urn:ihe:pcc:ets:2011', 'urn:ihe:pcc:its:2011', 'urn:ihe:pcc:ript:2017', 'urn:ihe:pcc:pcs-cs:2018', 'urn:ihe:pcc:pcs-cr:2018', 'urn:ihe:pcc:ips:2020', 'urn:ihe:pcc:360x:hl7:OMG:O19:2017', 'urn:ihe:pcc:360x:hl7:OSU:O51:2017', 'urn:ihe:pcc:360x:hl7:SIU:S12:2017', 'urn:ihe:pcc:360x:hl7:SIU:S13:2017', 'urn:ihe:pcc:360x:hl7:SIU:S15:2017', 'urn:ihe:pcc:360x:hl7:SIU:S26:2017', 'urn:ihe:iti:bppc:2007', 'urn:ihe:iti:bppc-sd:2007', 'urn:ihe:iti:xds-sd:pdf:2008', 'urn:ihe:iti:xds-sd:text:2008', 'urn:ihe:iti:xdw:2011:workflowDoc', 'urn:ihe:iti:dsg:detached:2014', 'urn:ihe:iti:dsg:enveloping:2014', 'urn:ihe:iti:appc:2016:consent', 'urn:ihe:iti:xds:2017:mimeTypeSufficient', 'urn:ihe:lab:xd-lab:2008', 'urn:ihe:rad:TEXT', 'urn:ihe:rad:PDF', 'urn:ihe:rad:CDA:ImagingReportStructuredHeadings:2013', 'urn:ihe:card:imaging:2011', 'urn:ihe:card:CRC:2012', 'urn:ihe:card:EPRC-IE:2014', 'urn:ihe:card:CPN:2017', 'urn:ihe:dent:TEXT', 'urn:ihe:dent:PDF', 'urn:ihe:dent:CDA:ImagingReportStructuredHeadings:2013', 'urn:ihe.palm:apsr:2016', 'urn:ihe:pharm:pre:2010', 'urn:ihe:pharm:padv:2010', 'urn:ihe:pharm:dis:2010', 'urn:ihe:pharm:pml:2013', 'urn:ihe:pharm:mtp:2015', 'urn:ihe:pharm:cma:2017', 'urn:ihe:qrph:crd:2008', 'urn:ihe:qrph:dsc:2008', 'urn:ihe:qrph:prph:2009', 'urn:ihe:qrph:LDS-VR:2013', 'urn:ihe:qrph:BFDR-Birth:2014', 'urn:ihe:qrph:BFDR-FDeath:2014', 'urn:ihe:qrph:vrdr:2013', 'urn:ihe:qrph:ms-vrdr:2013', 'urn:ihe:qrph:hw:2013', 'urn:ihe:qrph:NHS-Catl-UV:2015', 'urn:ihe:qrph:NHS-CatIII-UV:2015', 'urn:ihe:qrph:HPoCUS:2014', 'urn:ihe:qrph:HPoCUV:2014', 'urn:ihe:qrph:fp:2017', 'urn:ihe:qrph:ehdiwd:2013', 'urn:ihe:qrph:prq:2019', 'urn:ihe:eyecare:geneyeevalpn:2014', 'urn:ihe:eyecare:geneyeevalcn:2014', 'urn:ihe:eyecare:summary:2015'], 'http://terminology.hl7.org/CodeSystem/v3-HL7DocumentFormatCodes'=>['urn:hl7-org:sdwg:ccda-structuredBody:1.1', 'urn:hl7-org:sdwg:ccda-nonXMLBody:1.1', 'urn:hl7-org:sdwg:ccda-structuredBody:2.1', 'urn:hl7-org:sdwg:ccda-nonXMLBody:2.1', 'urn:hl7-org:sdwg:pacp-structuredBody:1.0', 'urn:hl7-org:sdwg:pacp-nonXMLBody:1.0', 'urn:hl7-org:sdwg:pacp-structuredBody:1.1', 'urn:hl7-org:sdwg:pacp-nonXMLBody:1.1', 'urn:hl7-org:sdwg:pacp-structuredBody:1.2', 'urn:hl7-org:sdwg:pacp-nonXMLBody:1.2', 'urn:hl7-org:sdwg:pacp-structuredBody:1.3', 'urn:hl7-org:sdwg:pacp-nonXMLBody:1.3', 'urn:hl7-org:sdwg:ccda-structuredBody:2.2', 'urn:hl7-org:sdwg:ccda-nonXMLBody:2.2']}, 'type'=>'CodeableConcept', 'path'=>'Payload.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/endpoint-payload-type'}},
          'mimeType' => {'type'=>'code', 'path'=>'Payload.mimeType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/mimetypes'}},
          'profileCanonical' => {'type'=>'canonical', 'path'=>'Payload.profileCanonical', 'min'=>0, 'max'=>Float::INFINITY},
          'profileUri' => {'type'=>'uri', 'path'=>'Payload.profileUri', 'min'=>0, 'max'=>Float::INFINITY}
        }

        attr_accessor :id                # 0-1 string
        attr_accessor :extension         # 0-* [ Extension ]
        attr_accessor :modifierExtension # 0-* [ Extension ]
        attr_accessor :type              # 0-* [ CodeableConcept ]
        attr_accessor :mimeType          # 0-* [ code ]
        attr_accessor :profileCanonical  # 0-* [ canonical ]
        attr_accessor :profileUri        # 0-* [ uri ]
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
      attr_accessor :status               # 1-1 code
      attr_accessor :connectionType       # 1-* [ CodeableConcept ]
      attr_accessor :name                 # 0-1 string
      attr_accessor :description          # 0-1 string
      attr_accessor :environmentType      # 0-* [ CodeableConcept ]
      attr_accessor :managingOrganization # 0-1 Reference(Organization)
      attr_accessor :contact              # 0-* [ ContactPoint ]
      attr_accessor :period               # 0-1 Period
      attr_accessor :availability         # 0-1 Availability
      attr_accessor :payload              # 0-* [ Endpoint::Payload ]
      attr_accessor :address              # 1-1 url
      attr_accessor :header               # 0-* [ string ]

      def resourceType
        'Endpoint'
      end
    end
  end
end