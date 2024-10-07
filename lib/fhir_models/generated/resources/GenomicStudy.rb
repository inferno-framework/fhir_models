module FHIR
  module build.fhir.org
    class GenomicStudy < Model
      include FHIR::Hashable
      include FHIR::Json
      include FHIR::Xml

      SEARCH_PARAMS = ['focus', 'identifier', 'patient', 'status', 'subject']
      METADATA = {
        'id' => {'type'=>'id', 'path'=>'GenomicStudy.id', 'min'=>0, 'max'=>1},
        'meta' => {'type'=>'Meta', 'path'=>'GenomicStudy.meta', 'min'=>0, 'max'=>1},
        'implicitRules' => {'type'=>'uri', 'path'=>'GenomicStudy.implicitRules', 'min'=>0, 'max'=>1},
        'language' => {'type'=>'code', 'path'=>'GenomicStudy.language', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'required', 'additional'=>[{'purpose'=>'starter', 'valueSet'=>'http://hl7.org/fhir/ValueSet/languages'}], 'uri'=>'http://hl7.org/fhir/ValueSet/all-languages'}},
        'text' => {'type'=>'Narrative', 'path'=>'GenomicStudy.text', 'min'=>0, 'max'=>1},
        'contained' => {'type'=>'Resource', 'path'=>'GenomicStudy.contained', 'min'=>0, 'max'=>Float::INFINITY},
        'extension' => {'type'=>'Extension', 'path'=>'GenomicStudy.extension', 'min'=>0, 'max'=>Float::INFINITY},
        'modifierExtension' => {'type'=>'Extension', 'path'=>'GenomicStudy.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
        'identifier' => {'type'=>'Identifier', 'path'=>'GenomicStudy.identifier', 'min'=>0, 'max'=>Float::INFINITY},
        'status' => {'valid_codes'=>{'http://hl7.org/fhir/genomicstudy-status'=>['registered', 'available', 'cancelled', 'entered-in-error', 'unknown']}, 'type'=>'code', 'path'=>'GenomicStudy.status', 'min'=>1, 'max'=>1, 'binding'=>{'strength'=>'required', 'uri'=>'http://hl7.org/fhir/ValueSet/genomicstudy-status'}},
        'type' => {'valid_codes'=>{'http://hl7.org/fhir/genomicstudy-type'=>['alt-splc', 'chromatin', 'cnv', 'epi-alt-hist', 'epi-alt-dna', 'fam-var-segr', 'func-var', 'gene-expression', 'post-trans-mod', 'snp', 'str', 'struc-var']}, 'type'=>'CodeableConcept', 'path'=>'GenomicStudy.type', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/genomicstudy-type'}},
        'subject' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Patient', 'http://hl7.org/fhir/StructureDefinition/Group', 'http://hl7.org/fhir/StructureDefinition/Substance', 'http://hl7.org/fhir/StructureDefinition/BiologicallyDerivedProduct', 'http://hl7.org/fhir/StructureDefinition/NutritionProduct'], 'type'=>'Reference', 'path'=>'GenomicStudy.subject', 'min'=>1, 'max'=>1},
        'encounter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Encounter'], 'type'=>'Reference', 'path'=>'GenomicStudy.encounter', 'min'=>0, 'max'=>1},
        'startDate' => {'type'=>'dateTime', 'path'=>'GenomicStudy.startDate', 'min'=>0, 'max'=>1},
        'basedOn' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/ServiceRequest', 'http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'GenomicStudy.basedOn', 'min'=>0, 'max'=>Float::INFINITY},
        'referrer' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'GenomicStudy.referrer', 'min'=>0, 'max'=>1},
        'interpreter' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole'], 'type'=>'Reference', 'path'=>'GenomicStudy.interpreter', 'min'=>0, 'max'=>Float::INFINITY},
        'reason' => {'type'=>'CodeableReference', 'path'=>'GenomicStudy.reason', 'min'=>0, 'max'=>Float::INFINITY},
        'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'GenomicStudy.instantiatesCanonical', 'min'=>0, 'max'=>1},
        'instantiatesUri' => {'type'=>'uri', 'path'=>'GenomicStudy.instantiatesUri', 'min'=>0, 'max'=>1},
        'note' => {'type'=>'Annotation', 'path'=>'GenomicStudy.note', 'min'=>0, 'max'=>Float::INFINITY},
        'description' => {'type'=>'markdown', 'path'=>'GenomicStudy.description', 'min'=>0, 'max'=>1},
        'analysis' => {'type'=>'GenomicStudy::Analysis', 'path'=>'GenomicStudy.analysis', 'min'=>0, 'max'=>Float::INFINITY}
      }

      class Analysis < Model
        include FHIR::Hashable
        include FHIR::Json
        include FHIR::Xml

        METADATA = {
          'id' => {'type'=>'string', 'path'=>'Analysis.id', 'min'=>0, 'max'=>1},
          'extension' => {'type'=>'Extension', 'path'=>'Analysis.extension', 'min'=>0, 'max'=>Float::INFINITY},
          'modifierExtension' => {'type'=>'Extension', 'path'=>'Analysis.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
          'identifier' => {'type'=>'Identifier', 'path'=>'Analysis.identifier', 'min'=>0, 'max'=>Float::INFINITY},
          'methodType' => {'valid_codes'=>{'http://hl7.org/fhir/genomicstudy-methodtype'=>['biochemical-genetics', 'cytogenetics', 'molecular-genetics', 'analyte', 'chromosome-breakage-studies', 'deletion-duplication-analysis', 'detection-of-homozygosity', 'enzyme-assay', 'fish-interphase', 'fish-metaphase', 'flow-cytometry', 'fish', 'immunohistochemistry', 'karyotyping', 'linkage-analysis', 'methylation-analysis', 'msi', 'm-fish', 'mutation-scanning-of-select-exons', 'mutation-scanning-of-the-entire-coding-region', 'protein-analysis', 'protein-expression', 'rna-analysis', 'sequence-analysis-of-select-exons', 'sequence-analysis-of-the-entire-coding-region', 'sister-chromatid-exchange', 'targeted-variant-analysis', 'udp', 'aspe', 'alternative-splicing-detection', 'bi-directional-sanger-sequence-analysis', 'c-banding', 'cia', 'chromatin-immunoprecipitation-on-chip', 'comparative-genomic-hybridization', 'damid', 'digital-virtual-karyotyping', 'digital-microfluidic-microspheres', 'enzymatic-levels', 'enzyme-activity', 'elisa', 'fluorometry', 'fusion-genes-microarrays', 'g-banding', 'gc-ms', 'gene-expression-profiling', 'gene-id', 'gold-nanoparticle-probe-technology', 'hplc', 'lc-ms', 'lc-ms-ms', 'metabolite-levels', 'methylation-specific-pcr', 'microarray', 'mlpa', 'ngs-mps', 'ola', 'oligonucleotide-hybridization-based-dna-sequencing', 'other', 'pcr', 'pcr-with-allele-specific-hybridization', 'pcr-rflp-with-southern-hybridization', 'protein-truncation-test', 'pyrosequencing', 'q-banding', 'qpcr', 'r-banding', 'rflp', 'rt-lamp', 'rt-pcr', 'rt-pcr-with-gel-analysis', 'rt-qpcr', 'snp-detection', 'silver-staining', 'sky', 't-banding', 'ms-ms', 'tetra-nucleotide-repeat-by-pcr-or-southern-blot', 'tiling-arrays', 'trinucleotide-repeat-by-pcr-or-southern-blot', 'uni-directional-sanger-sequencing']}, 'type'=>'CodeableConcept', 'path'=>'Analysis.methodType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/genomicstudy-methodtype'}},
          'changeType' => {'valid_codes'=>{'http://hl7.org/fhir/genomicstudy-changetype'=>['DNA', 'RNA', 'AA', 'CHR', 'CNV']}, 'type'=>'CodeableConcept', 'path'=>'Analysis.changeType', 'min'=>0, 'max'=>Float::INFINITY, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/genomicstudy-changetype'}},
          'genomeBuild' => {'type'=>'CodeableConcept', 'path'=>'Analysis.genomeBuild', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'extensible', 'uri'=>'http://loinc.org/vs/LL1040-6'}},
          'instantiatesCanonical' => {'type'=>'canonical', 'path'=>'Analysis.instantiatesCanonical', 'min'=>0, 'max'=>1},
          'instantiatesUri' => {'type'=>'uri', 'path'=>'Analysis.instantiatesUri', 'min'=>0, 'max'=>1},
          'title' => {'type'=>'string', 'path'=>'Analysis.title', 'min'=>0, 'max'=>1},
          'focus' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Resource'], 'type'=>'Reference', 'path'=>'Analysis.focus', 'min'=>0, 'max'=>Float::INFINITY},
          'specimen' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Specimen'], 'type'=>'Reference', 'path'=>'Analysis.specimen', 'min'=>0, 'max'=>Float::INFINITY},
          'date' => {'type'=>'dateTime', 'path'=>'Analysis.date', 'min'=>0, 'max'=>1},
          'note' => {'type'=>'Annotation', 'path'=>'Analysis.note', 'min'=>0, 'max'=>Float::INFINITY},
          'protocolPerformed' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Procedure', 'http://hl7.org/fhir/StructureDefinition/Task'], 'type'=>'Reference', 'path'=>'Analysis.protocolPerformed', 'min'=>0, 'max'=>1},
          'regionsStudied' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Analysis.regionsStudied', 'min'=>0, 'max'=>Float::INFINITY},
          'regionsCalled' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference', 'http://hl7.org/fhir/StructureDefinition/Observation'], 'type'=>'Reference', 'path'=>'Analysis.regionsCalled', 'min'=>0, 'max'=>Float::INFINITY},
          'input' => {'type'=>'GenomicStudy::Analysis::Input', 'path'=>'Analysis.input', 'min'=>0, 'max'=>Float::INFINITY},
          'output' => {'type'=>'GenomicStudy::Analysis::Output', 'path'=>'Analysis.output', 'min'=>0, 'max'=>Float::INFINITY},
          'performer' => {'type'=>'GenomicStudy::Analysis::Performer', 'path'=>'Analysis.performer', 'min'=>0, 'max'=>Float::INFINITY},
          'device' => {'type'=>'GenomicStudy::Analysis::Device', 'path'=>'Analysis.device', 'min'=>0, 'max'=>Float::INFINITY}
        }

        class Input < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          MULTIPLE_TYPES = {
            'generatedBy' => ['Identifier', 'Reference']
          }
          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Input.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Input.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Input.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'file' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Input.file', 'min'=>0, 'max'=>1},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/genomicstudy-dataformat'=>['bam', 'bed', 'bedpe', 'bedgraph', 'bigbed', 'bigWig', 'birdsuite-files', 'broadpeak', 'cbs', 'chemical-reactivity-probing-profiles', 'chrom-sizes', 'cn', 'custom-file-formats', 'cytoband', 'fasta', 'gct', 'cram', 'genepred', 'gff-gtf', 'gistic', 'goby', 'gwas', 'igv', 'loh', 'maf-multiple-alignment-format', 'maf-mutation-annotation-format', 'merged-bam-file', 'mut', 'narrowpeak', 'psl', 'res', 'rna-secondary-structure-formats', 'sam', 'sample-info-attributes-file', 'seg', 'tdf', 'track-line', 'type-line', 'vcf', 'wig']}, 'type'=>'CodeableConcept', 'path'=>'Input.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/genomicstudy-dataformat'}},
            'generatedByIdentifier' => {'type'=>'Identifier', 'path'=>'Input.generatedBy[x]', 'min'=>0, 'max'=>1},
            'generatedByReference' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/GenomicStudy'], 'type'=>'Reference', 'path'=>'Input.generatedBy[x]', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                    # 0-1 string
          attr_accessor :extension             # 0-* [ Extension ]
          attr_accessor :modifierExtension     # 0-* [ Extension ]
          attr_accessor :file                  # 0-1 Reference(DocumentReference)
          attr_accessor :type                  # 0-1 CodeableConcept
          attr_accessor :generatedByIdentifier # 0-1 Identifier
          attr_accessor :generatedByReference  # 0-1 Reference(GenomicStudy)
        end

        class Output < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Output.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Output.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Output.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'file' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/DocumentReference'], 'type'=>'Reference', 'path'=>'Output.file', 'min'=>0, 'max'=>1},
            'type' => {'valid_codes'=>{'http://hl7.org/fhir/genomicstudy-dataformat'=>['bam', 'bed', 'bedpe', 'bedgraph', 'bigbed', 'bigWig', 'birdsuite-files', 'broadpeak', 'cbs', 'chemical-reactivity-probing-profiles', 'chrom-sizes', 'cn', 'custom-file-formats', 'cytoband', 'fasta', 'gct', 'cram', 'genepred', 'gff-gtf', 'gistic', 'goby', 'gwas', 'igv', 'loh', 'maf-multiple-alignment-format', 'maf-mutation-annotation-format', 'merged-bam-file', 'mut', 'narrowpeak', 'psl', 'res', 'rna-secondary-structure-formats', 'sam', 'sample-info-attributes-file', 'seg', 'tdf', 'track-line', 'type-line', 'vcf', 'wig']}, 'type'=>'CodeableConcept', 'path'=>'Output.type', 'min'=>0, 'max'=>1, 'binding'=>{'strength'=>'example', 'uri'=>'http://hl7.org/fhir/ValueSet/genomicstudy-dataformat'}}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :file              # 0-1 Reference(DocumentReference)
          attr_accessor :type              # 0-1 CodeableConcept
        end

        class Performer < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Performer.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Performer.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Performer.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'actor' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Practitioner', 'http://hl7.org/fhir/StructureDefinition/PractitionerRole', 'http://hl7.org/fhir/StructureDefinition/Organization', 'http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Performer.actor', 'min'=>0, 'max'=>1},
            'role' => {'type'=>'CodeableConcept', 'path'=>'Performer.role', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :actor             # 0-1 Reference(Practitioner|PractitionerRole|Organization|Device)
          attr_accessor :role              # 0-1 CodeableConcept
        end

        class Device < Model
          include FHIR::Hashable
          include FHIR::Json
          include FHIR::Xml

          METADATA = {
            'id' => {'type'=>'string', 'path'=>'Device.id', 'min'=>0, 'max'=>1},
            'extension' => {'type'=>'Extension', 'path'=>'Device.extension', 'min'=>0, 'max'=>Float::INFINITY},
            'modifierExtension' => {'type'=>'Extension', 'path'=>'Device.modifierExtension', 'min'=>0, 'max'=>Float::INFINITY},
            'device' => {'type_profiles'=>['http://hl7.org/fhir/StructureDefinition/Device'], 'type'=>'Reference', 'path'=>'Device.device', 'min'=>0, 'max'=>1},
            'function' => {'type'=>'CodeableConcept', 'path'=>'Device.function', 'min'=>0, 'max'=>1}
          }

          attr_accessor :id                # 0-1 string
          attr_accessor :extension         # 0-* [ Extension ]
          attr_accessor :modifierExtension # 0-* [ Extension ]
          attr_accessor :device            # 0-1 Reference(Device)
          attr_accessor :function          # 0-1 CodeableConcept
        end

        attr_accessor :id                    # 0-1 string
        attr_accessor :extension             # 0-* [ Extension ]
        attr_accessor :modifierExtension     # 0-* [ Extension ]
        attr_accessor :identifier            # 0-* [ Identifier ]
        attr_accessor :methodType            # 0-* [ CodeableConcept ]
        attr_accessor :changeType            # 0-* [ CodeableConcept ]
        attr_accessor :genomeBuild           # 0-1 CodeableConcept
        attr_accessor :instantiatesCanonical # 0-1 canonical
        attr_accessor :instantiatesUri       # 0-1 uri
        attr_accessor :title                 # 0-1 string
        attr_accessor :focus                 # 0-* [ Reference(Resource) ]
        attr_accessor :specimen              # 0-* [ Reference(Specimen) ]
        attr_accessor :date                  # 0-1 dateTime
        attr_accessor :note                  # 0-* [ Annotation ]
        attr_accessor :protocolPerformed     # 0-1 Reference(Procedure|Task)
        attr_accessor :regionsStudied        # 0-* [ Reference(DocumentReference|Observation) ]
        attr_accessor :regionsCalled         # 0-* [ Reference(DocumentReference|Observation) ]
        attr_accessor :input                 # 0-* [ GenomicStudy::Analysis::Input ]
        attr_accessor :output                # 0-* [ GenomicStudy::Analysis::Output ]
        attr_accessor :performer             # 0-* [ GenomicStudy::Analysis::Performer ]
        attr_accessor :device                # 0-* [ GenomicStudy::Analysis::Device ]
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
      attr_accessor :status                # 1-1 code
      attr_accessor :type                  # 0-* [ CodeableConcept ]
      attr_accessor :subject               # 1-1 Reference(Patient|Group|Substance|BiologicallyDerivedProduct|NutritionProduct)
      attr_accessor :encounter             # 0-1 Reference(Encounter)
      attr_accessor :startDate             # 0-1 dateTime
      attr_accessor :basedOn               # 0-* [ Reference(ServiceRequest|Task) ]
      attr_accessor :referrer              # 0-1 Reference(Practitioner|PractitionerRole)
      attr_accessor :interpreter           # 0-* [ Reference(Practitioner|PractitionerRole) ]
      attr_accessor :reason                # 0-* [ CodeableReference ]
      attr_accessor :instantiatesCanonical # 0-1 canonical
      attr_accessor :instantiatesUri       # 0-1 uri
      attr_accessor :note                  # 0-* [ Annotation ]
      attr_accessor :description           # 0-1 markdown
      attr_accessor :analysis              # 0-* [ GenomicStudy::Analysis ]

      def resourceType
        'GenomicStudy'
      end
    end
  end
end