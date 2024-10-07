module FHIR
  module R6
    class VerificationResult < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['attestation-method', 'attestation-onbehalfof', 'attestation-who', 'primarysource-date', 'primarysource-type', 'primarysource-who', 'status', 'status-date', 'target', 'validator-organization']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'VerificationResult.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'VerificationResult.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'VerificationResult.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'VerificationResult.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'VerificationResult.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'VerificationResult.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'VerificationResult.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'VerificationResult.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'target' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'VerificationResult.target', 'min'=>0, 'max'=>Float::INFINITY},
        'targetLocation' => {'type'=>'string', 'path'=>'VerificationResult.targetLocation', 'min'=>0, 'max'=>Float::INFINITY},
        'need' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/need'=>['none', 'initial', 'periodic']}, 'type'=>'CodeableConcept', 'path'=>'VerificationResult.need', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-need'}},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/CodeSystem/verificationresult-status'=>['attested', 'validated', 'in-process', 'req-revalid', 'val-fail', 'reval-fail', 'entered-in-error']}, 'type'=>'code', 'path'=>'VerificationResult.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-status'}},
        'statusDate' => {'type'=>'dateTime', 'path'=>'VerificationResult.statusDate', 'min'=>0, 'max'=>1},
        'validationType' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/validation-type'=>['nothing', 'primary', 'multiple']}, 'type'=>'CodeableConcept', 'path'=>'VerificationResult.validationType', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-validation-type'}},
        'validationProcess' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/validation-process'=>['edit-check', 'valueset', 'primary', 'multi', 'standalone', 'in-context']}, 'type'=>'CodeableConcept', 'path'=>'VerificationResult.validationProcess', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-validation-process'}},
        'frequency' => {'type'=>'Timing', 'path'=>'VerificationResult.frequency', 'min'=>0, 'max'=>1},
        'lastPerformed' => {'type'=>'dateTime', 'path'=>'VerificationResult.lastPerformed', 'min'=>0, 'max'=>1},
        'nextScheduled' => {'type'=>'date', 'path'=>'VerificationResult.nextScheduled', 'min'=>0, 'max'=>1},
        'failureAction' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/failure-action'=>['fatal', 'warn', 'rec-only', 'none']}, 'type'=>'CodeableConcept', 'path'=>'VerificationResult.failureAction', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-failure-action'}},
        'primarySource' => {'type'=>'VerificationResult::PrimarySource', 'path'=>'VerificationResult.primarySource', 'min'=>0, 'max'=>Float::INFINITY},
        'attestation' => {'type'=>'VerificationResult::Attestation', 'path'=>'VerificationResult.attestation', 'min'=>0, 'max'=>1},
        'validator' => {'type'=>'VerificationResult::Validator', 'path'=>'VerificationResult.validator', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class PrimarySource < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'PrimarySource.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'PrimarySource.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'PrimarySource.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'PrimarySource.who', 'min'=>0, 'max'=>1},
          'type' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/primary-source-type'=>['lic-board', 'prim', 'cont-ed', 'post-serv', 'rel-own', 'reg-auth', 'legal', 'issuer', 'auth-source']}, 'type'=>'CodeableConcept', 'path'=>'PrimarySource.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-primary-source-type'}},
          'communicationMethod' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/verificationresult-communication-method'=>['manual', 'portal', 'pull', 'push']}, 'type'=>'CodeableConcept', 'path'=>'PrimarySource.communicationMethod', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-communication-method'}},
          'validationStatus' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/validation-status'=>['successful', 'failed', 'unknown']}, 'type'=>'CodeableConcept', 'path'=>'PrimarySource.validationStatus', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-validation-status'}},
          'validationDate' => {'type'=>'dateTime', 'path'=>'PrimarySource.validationDate', 'min'=>0, 'max'=>1},
          'canPushUpdates' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/can-push-updates'=>['yes', 'no', 'undetermined']}, 'type'=>'CodeableConcept', 'path'=>'PrimarySource.canPushUpdates', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-can-push-updates'}},
          'pushTypeAvailable' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/push-type-available'=>['specific', 'any', 'source']}, 'type'=>'CodeableConcept', 'path'=>'PrimarySource.pushTypeAvailable', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'preferred', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-push-type-available'}}
        }

        attr_accessor :id                  # 0-1 string
        attr_accessor :extension           # 0-* [ Extension ]
        attr_accessor :modifierExtension   # 0-* [ Extension ]
        attr_accessor :who                 # 0-1 Reference(Organization|Practitioner|PractitionerRole)
        attr_accessor :type                # 0-* [ CodeableConcept ]
        attr_accessor :communicationMethod # 0-* [ CodeableConcept ]
        attr_accessor :validationStatus    # 0-1 CodeableConcept
        attr_accessor :validationDate      # 0-1 dateTime
        attr_accessor :canPushUpdates      # 0-1 CodeableConcept
        attr_accessor :pushTypeAvailable   # 0-* [ CodeableConcept ]
      end

      class Attestation < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Attestation.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Attestation.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Attestation.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'who' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Attestation.who', 'min'=>0, 'max'=>1},
          'onBehalfOf' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'Attestation.onBehalfOf', 'min'=>0, 'max'=>1},
          'communicationMethod' => {'valid_codes'=>{'http://terminology.hl7.org/CodeSystem/verificationresult-communication-method'=>['manual', 'portal', 'pull', 'push']}, 'type'=>'CodeableConcept', 'path'=>'Attestation.communicationMethod', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/verificationresult-communication-method'}},
          'date' => {'type'=>'date', 'path'=>'Attestation.date', 'min'=>0, 'max'=>1},
          'sourceIdentityCertificate' => {'type'=>'string', 'path'=>'Attestation.sourceIdentityCertificate', 'min'=>0, 'max'=>1},
          'proxyIdentityCertificate' => {'type'=>'string', 'path'=>'Attestation.proxyIdentityCertificate', 'min'=>0, 'max'=>1},
          'proxySignature' => {'type'=>'Signature', 'path'=>'Attestation.proxySignature', 'min'=>0, 'max'=>1},
          'sourceSignature' => {'type'=>'Signature', 'path'=>'Attestation.sourceSignature', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                        # 0-1 string
        attr_accessor :extension                 # 0-* [ Extension ]
        attr_accessor :modifierExtension         # 0-* [ Extension ]
        attr_accessor :who                       # 0-1 Reference(Practitioner|PractitionerRole|Organization)
        attr_accessor :onBehalfOf                # 0-1 Reference(Organization|Practitioner|PractitionerRole)
        attr_accessor :communicationMethod       # 0-1 CodeableConcept
        attr_accessor :date                      # 0-1 date
        attr_accessor :sourceIdentityCertificate # 0-1 string
        attr_accessor :proxyIdentityCertificate  # 0-1 string
        attr_accessor :proxySignature            # 0-1 Signature
        attr_accessor :sourceSignature           # 0-1 Signature
      end

      class Validator < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Validator.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Validator.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Validator.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'organization' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Organization'], 'type'=>'Reference', 'path'=>'Validator.organization', 'min'=>1, 'max'=>1},
          'identityCertificate' => {'type'=>'string', 'path'=>'Validator.identityCertificate', 'min'=>0, 'max'=>1},
          'attestationSignature' => {'type'=>'Signature', 'path'=>'Validator.attestationSignature', 'min'=>0, 'max'=>1}
        }

        attr_accessor :id                   # 0-1 string
        attr_accessor :extension            # 0-* [ Extension ]
        attr_accessor :modifierExtension    # 0-* [ Extension ]
        attr_accessor :organization         # 1-1 Reference(Organization)
        attr_accessor :identityCertificate  # 0-1 string
        attr_accessor :attestationSignature # 0-1 Signature
      end

      attr_accessor :id                # 0-1 id
      attr_accessor :meta              # 0-1 Meta
      attr_accessor :implicitRules     # 0-1 uri
      attr_accessor :language          # 0-1 code
      attr_accessor :text              # 0-1 Narrative
      attr_accessor :contained         # 0-* [ Resource ]
      attr_accessor :extension         # 0-* [ Extension ]
      attr_accessor :modifierExtension # 0-* [ Extension ]
      attr_accessor :target            # 0-* [ Reference(Resource) ]
      attr_accessor :targetLocation    # 0-* [ string ]
      attr_accessor :need              # 0-1 CodeableConcept
      attr_accessor :status            # 1-1 code
      attr_accessor :statusDate        # 0-1 dateTime
      attr_accessor :validationType    # 0-1 CodeableConcept
      attr_accessor :validationProcess # 0-* [ CodeableConcept ]
      attr_accessor :frequency         # 0-1 Timing
      attr_accessor :lastPerformed     # 0-1 dateTime
      attr_accessor :nextScheduled     # 0-1 date
      attr_accessor :failureAction     # 0-1 CodeableConcept
      attr_accessor :primarySource     # 0-* [ VerificationResult::PrimarySource ]
      attr_accessor :attestation       # 0-1 VerificationResult::Attestation
      attr_accessor :validator         # 0-* [ VerificationResult::Validator ]

      def resourceType
        'VerificationResult'
      end
    end
  end
end