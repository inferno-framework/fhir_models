require 'fhir_models'
namespace :fhir do
  desc 'console'
  task :console, [] do |_t, _args|
    sh 'bin/console'
  end

  desc 'generate fhir models'
  task :generate, [] do |_t, _args|
    require_relative '../generator/generator'
    FHIR::Generator.generate
  end

  desc 'preprocess definitions'
  task :preprocess, [] do |_t, _args|
    FileList['lib/fhir_models/definitions/structures/*.json'].each do |file|
      FHIR::Boot::Preprocess.pre_process_bundle(file)
    end
    FileList['lib/fhir_models/definitions/valuesets/*.json'].each do |file|
      FHIR::Boot::Preprocess.pre_process_bundle(file)
    end
    FileList['lib/fhir_models/definitions/schema/*.xsd'].each do |file|
      FHIR::Boot::Preprocess.pre_process_schema(file)
    end
    FileList['lib/fhir_models/examples/json/*.json'].each do |file|
      FHIR::Boot::Preprocess.pre_process_json_example(file)
    end
    FileList['lib/fhir_models/examples/xml/*.xml'].each do |file|
      FHIR::Boot::Preprocess.pre_process_xml_example(file)
    end
  end

  desc 'shrink implementation guide'
  task :shrinkig, [:file_path] do |_t, args|
    file_path = args[:file_path]
    files = Dir.glob(File.join(file_path, '*.json'))
    files.each do |filename|
      # Load each file
      start = File.size(filename)
      json = File.open(filename, 'r:UTF-8', &:read)
      hash = JSON.parse(json)

      # process each file
      FHIR::Boot::Preprocess.pre_process_structuredefinition(hash) if 'StructureDefinition' == hash['resourceType']
      FHIR::Boot::Preprocess.pre_process_valueset(hash) if 'ValueSet' == hash['resourceType']
      FHIR::Boot::Preprocess.pre_process_codesystem(hash) if 'CodeSystem' == hash['resourceType']
      FHIR::Boot::Preprocess.pre_process_searchparam(hash) if 'SearchParameter' == hash['resourceType']
      FHIR::Boot::Preprocess.remove_fhir_comments(hash)

      # if BlueButton, fix URLs
      if 'StructureDefinition' == hash['resourceType']
        # hash['url'].gsub!('http://hl7.org/fhir/StructureDefinition/','https://bluebutton.cms.gov/assets/ig/StructureDefinition-')
        fix_blue_button_urls(hash)
      end

      # Output the post processed file
      f = File.open(filename, 'w:UTF-8')
      f.write(JSON.pretty_unparse(hash))
      f.close
      finish = File.size(filename)
      puts "  Removed #{(start - finish) / 1024} KB" if start != finish
    end
  end

  def self.fix_blue_button_urls(hash)
    hash.each do |key, value|
      if value.is_a?(String)
        if value.start_with?('http://hl7.org/fhir/StructureDefinition/bluebutton')
          hash[key] = value.gsub('http://hl7.org/fhir/StructureDefinition/bluebutton', 'https://bluebutton.cms.gov/assets/ig/StructureDefinition-bluebutton')
        end
      elsif value.is_a?(Hash)
        fix_blue_button_urls(value)
      elsif value.is_a?(Array)
        value.each do |v|
          fix_blue_button_urls(v) if v.is_a?(Hash)
        end
      end
    end
  end

  desc 'copy artifacts from FHIR build'
  task :update, [:fhir_build_path] do |_t, args|
    fhir_build_path = args[:fhir_build_path]
    root = File.expand_path '../..', File.dirname(File.absolute_path(__FILE__))
    defns = File.join(root, 'fhir_models', 'definitions')

    # copy structure definitions and profiles...
    src = File.join(fhir_build_path, 'publish')
    dest = File.join(defns, 'structures')
    copy_artifacts(['profiles-types.json', 'profiles-resources.json', 'profiles-others.json', 'search-parameters.json', 'extension-definitions.json'], src, dest)

    # copy valuesets and expansions...
    dest = File.join(defns, 'valuesets')
    copy_artifacts(['expansions.json', 'valuesets.json', 'v2-tables.json', 'v3-codesystems.json'], src, dest)

    # copy all the XML schemas
    puts '  Copying XML schemas...'
    files = Dir.glob(File.join(src, '*.xsd'))
    files.map! { |f| File.basename(f) }
    dest = File.join(defns, 'schema')
    copy_artifacts(files, src, dest, false)

    # delete the JSON examples
    dest = File.join(root, 'fhir_models', 'examples', 'json')
    puts '  Replacing JSON examples...'
    Dir.glob(File.join(dest, '*')).each { |f| File.delete(f) unless File.directory?(f) }
    # copy the new JSON examples over
    files = Dir.glob(File.join(src, '*.json'))
    files.map! { |f| File.basename(f) }
    files.keep_if { |f| f.include?('example') && !f.include?('canonical') }
    copy_artifacts(files, src, dest, false)
    # copy the qicore examples too
    qicore = File.join(src, 'qicore')
    files = Dir.glob(File.join(qicore, '*.json'))
    files.map! { |f| File.basename(f) }
    files.keep_if { |f| f.include?('example') && !f.include?('canonical') }
    copy_artifacts(files, qicore, dest, false)

    # delete the XML examples
    dest = File.join(root, 'fhir_models', 'examples', 'xml')
    puts '  Replacing XML examples...'
    Dir.glob(File.join(dest, '*')).each { |f| File.delete(f) unless File.directory?(f) }
    # copy the new XML examples over
    files = Dir.glob(File.join(src, '*.xml'))
    files.map! { |f| File.basename(f) }
    files.keep_if { |f| f.include?('example') && !f.include?('canonical') }
    copy_artifacts(files, src, dest, false)
    # copy the qicore examples too
    files = Dir.glob(File.join(qicore, '*.xml'))
    files.map! { |f| File.basename(f) }
    files.keep_if { |f| f.include?('example') && !f.include?('canonical') }
    copy_artifacts(files, qicore, dest, false)

    # copy the version info
    copy_artifacts(['version.info'], src, defns)

    puts 'Done.'
  end

  desc 'output invariant expressions from definitions'
  task :invariants, [] do |_t, _args|
    # create a generator and load the definitions
    d = FHIR::Definitions
    defs = d.complex_types + d.resource_definitions
    invariants = {}
    defs.each do |structure_definition|
      structure_definition['snapshot']['element'].each do |element|
        next unless element['constraint']
        element['constraint'].each do |constraint|
          next unless constraint['expression']
          invariants[constraint['key']] = {
            path: element['path'],
            expression: constraint['expression'],
            human: constraint['human']
          }
        end
      end
    end
    File.open('invariants.txt', 'w:UTF-8') do |file|
      invariants.each do |key, value|
        file.write "#{key}|#{value[:path]}|#{value[:expression]}|#{value[:human]}\n"
      end
    end
    puts 'Wrote invariants into pipe-delimited file: invariants.txt'
  end

  def copy_artifacts(artifacts, src_folder, dest_folder, verbose = true)
    artifacts.each do |artifact|
      puts "  Copying #{artifact}..." if verbose
      src = File.join(src_folder, artifact)
      FileUtils.copy src, dest_folder
    end
  end
end
