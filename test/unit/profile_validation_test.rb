require_relative '../test_helper'
require 'ostruct'

class ProfileValidationTest < Test::Unit::TestCase
  ERROR_DIR = File.join('tmp', 'errors', 'ProfileValidationTest')
  FIXTURES_DIR = File.join('test', 'fixtures')

  # Cache the US Core IG definitions
  us_core_ig = File.join(FIXTURES_DIR, 'us_core', '*.json')
  PROFILES = {}
  Dir.glob(us_core_ig).each do |definition|
    next if definition.end_with? '/package.json'
    json = File.read(definition)
    resource = FHIR.from_contents(json)
    PROFILES[resource.url] = resource if resource
  end

  # Create a blank folder for the errors
  FileUtils.rm_rf(ERROR_DIR) if File.directory?(ERROR_DIR)
  FileUtils.mkdir_p ERROR_DIR

  us_core_fixtures = File.join(FIXTURES_DIR, 'us_core_examples', '*.json')
  Dir.glob(us_core_fixtures).each do |example_file|
    example_name = File.basename(example_file, '.json')
    define_method("test_profile_validation_#{example_name}") do
      run_profile_validation(example_file, example_name)
    end
  end

  def run_profile_validation(example_file, example_name)
    json = File.read(example_file)
    resource = FHIR::Json.from_json(json)
    errors = []
    warnings = []
    if resource.meta
      # validate against the declared profile
      resource.meta.profile.each do |profile_uri|
        profile = PROFILES[profile_uri]
        profile = FHIR::Definitions.profile(profile_uri) unless profile
        assert profile, "Failed to find profile: #{profile_uri}"
        profile_errors = profile.validate_resource(resource)
        profile_warnings = profile.warnings
        unless profile_errors.empty?
          errors.concat profile_errors
          errors << "Validated against #{profile_uri}"
        end
        unless profile_warnings.empty?
          warnings.concat profile_warnings
          warnings << "Validated against #{profile_uri}"
        end
      end
    else
      # validate the base resource
      errors = resource.validate
      errors << "Validated against base resource definition" unless errors.empty?
    end
    unless errors.empty?
      File.open("#{ERROR_DIR}/#{example_name}.err", 'w:UTF-8') { |file| file.write(errors.join("\n")) }
      File.open("#{ERROR_DIR}/#{example_name}.json", 'w:UTF-8') { |file| file.write(json) }
    end
    unless warnings.empty?
      File.open("#{ERROR_DIR}/#{example_name}.warn", 'w:UTF-8') { |file| file.write(warnings.join("\n")) }
      File.open("#{ERROR_DIR}/#{example_name}.json", 'w:UTF-8') { |file| file.write(json) }
    end
    assert errors.empty?, 'Record failed to validate.'
    # check memory
    before = check_memory
    resource = nil
    profile = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_profile_validation_rejects_bad_resource
    definition = FHIR::Definitions.resource_definition('Bundle')
    assert !definition.validates_resource?(String.new), 'Bundle StructureDefinition should reject anything that is not a FHIR::Model.'
    # check memory
    before = check_memory
    definition = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_profile_with_multiple_extensions
    structure_definition_file = File.join(FIXTURES_DIR, 'custom_profiles', 'StructureDefinition-us-core-patient-modified.json')
    # use a modified version of the core patient profile, that changes certain extensions like race and ethnicity from 0..1 to 1..1
    structure_definition_json = JSON.parse(File.read(structure_definition_file))
    profile = FHIR::StructureDefinition.new(structure_definition_json)

    example_name = 'Patient-example.json'
    patient_record = File.join(FIXTURES_DIR, 'us_core_examples', example_name)
    input_json = File.read(patient_record)
    patient = FHIR::Json.from_json(input_json)

    errors = profile.validate_resource(patient)
    assert !errors.empty?, 'Record was expected to fail to validate against modified core profile'
    # check memory
    before = check_memory
    structure_definition_file = nil
    structure_definition_json = nil
    profile = nil
    patient = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_language_binding_validation
    binding_strength = FHIR::Resource::METADATA['language']['binding']['strength']
    FHIR::Resource::METADATA['language']['binding']['strength'] = 'required'
    model = FHIR::Resource.new('language' => 'en-US')
    assert model.valid?, 'Language validation failed.'
    FHIR::Resource::METADATA['language']['binding']['strength'] = binding_strength
    # check memory
    before = check_memory
    model = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_cardinality_check
    sd = FHIR::StructureDefinition.new

    element = FHIR::ElementDefinition.new('min' => 0, 'max' => '1', 'path' => "test1")
    nodes = []
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)

    nodes = ["one"]
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)

    nodes = [1, 2, 3]
    sd.errors = []    
    sd.verify_cardinality(element, nodes)
    assert_equal("test1 failed cardinality test (0..1) -- found 3", sd.errors[0])

    element = FHIR::ElementDefinition.new('min' => 1, 'max' => '1', 'path' => "test2")
    nodes = []
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test2 failed cardinality test (1..1) -- found 0", sd.errors[0])

    nodes = ["one"]
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)

    nodes = [1, 2, 3]
    sd.errors = []    
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test2 failed cardinality test (1..1) -- found 3", sd.errors[0])

    element = FHIR::ElementDefinition.new('min' => 2, 'max' => '*', 'path' => "test3")
    nodes = []
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test3 failed cardinality test (2..Infinity) -- found 0", sd.errors[0])

    nodes = ["one"]
    sd.errors = []
    sd.send(:verify_cardinality, element, nodes)
    assert_equal("test3 failed cardinality test (2..Infinity) -- found 1", sd.errors[0])

    nodes = [1, 2, 3]
    sd.errors = []    
    sd.send(:verify_cardinality, element, nodes)
    assert_empty(sd.errors)
  end

  def test_maximum_string_length_check
    sd = FHIR::StructureDefinition.new
    sd.warnings = []

    element = FHIR::ElementDefinition.new('path' => 'string', 'type' => [{ 'code' => 'String' }], 'maxLength' => 4, 'min' => 0, 'max' => '*')
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack to make this work, wish it was cleaner
    sd.errors = []
    sd.send(:verify_element, element, 'string' => "1234")
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'string' => "12345")
    assert_equal("string exceed maximum length of 4: 12345", sd.errors[0])

    element = FHIR::ElementDefinition.new('path' => 'string', 'type' => [{ 'code' => 'String' }], 'min' => 0, 'max' => '*') # no maxlength

    sd.errors = []
    sd.send(:verify_element, element, 'string' => "1234")
    assert_empty(sd.errors)

    sd.errors = []
    long_string = (1..10000).map{ rand(10000).to_s }.join(', ') # somewhere in the range of 60k chars
    sd.send(:verify_element, element, 'string' => long_string)
    assert_empty(sd.errors)
  end

  def test_fixed_value
    sd = FHIR::StructureDefinition.new
    
    element = FHIR::ElementDefinition.new('path' => "fixed_value_test") # fixed == nil
    sd.errors = []
    sd.verify_fixed_value(element, nil)
    assert_empty(sd.errors)

    sd.errors = []
    sd.verify_fixed_value(element, "some_other_value_it_doesnt_matter")
    assert_empty(sd.errors)

    element = FHIR::ElementDefinition.new('path' => "fixed_value_test", 'fixedString' => "string_value")
    sd.errors = []
    sd.verify_fixed_value(element, nil)
    assert_equal("fixed_value_test value of '' did not match fixed value: string_value", sd.errors[0])

    sd.errors = []
    sd.verify_fixed_value(element, "string_value")
    assert_empty(sd.errors)

    sd.errors = []
    sd.verify_fixed_value(element, "some_other_value")
    assert_equal("fixed_value_test value of 'some_other_value' did not match fixed value: string_value", sd.errors[0])

    element = FHIR::ElementDefinition.new('path' => "fixed_value_test", 'fixedCodeableConcept' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }] } )
    sd.errors = []
    sd.verify_fixed_value(element, nil)
    assert_equal("fixed_value_test value of '' did not match fixed value: #{element.fixed}", sd.errors[0])
    # these test cases use the string interpolation in because the error message includes the object ID which isn't constant

    sd.errors = []
    sd.verify_fixed_value(element, "some_other_value")
    assert_equal("fixed_value_test value of 'some_other_value' did not match fixed value: #{element.fixed}", sd.errors[0])

    sd.errors = []
    sd.verify_fixed_value(element, FHIR::CodeableConcept.new('coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }]))
    assert_empty(sd.errors)

    sd.errors = []
    value = FHIR::CodeableConcept.new('coding' => [{ 'system' => 'http://snomed.info/sct', 'code' => 'C2004062' }])
    sd.verify_fixed_value(element, value)
    assert_equal("fixed_value_test value of '#{value}' did not match fixed value: #{element.fixed}", sd.errors[0])
  end

  def test_codeableConcept_pattern
    sd = FHIR::StructureDefinition.new
    sd.warnings = []

    element = FHIR::ElementDefinition.new('path' => 'cc', 'type' => [{ 'code' => 'CodeableConcept' }], 'min' => 1, 'max' => '1',
                                          'patternCodeableConcept' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }] })
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack to make this work, wish it was cleaner
    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }] }) # exact match
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062' }], 'text' => 'some dummy text' }) # added text
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2004062', 'display' => 'some_value' }] }) # match, with added 'display'
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://ncimeta.nci.nih.gov', 'code' => 'C2222222' }] }) # wrong code
    assert_equal("cc CodeableConcept did not match defined pattern: {\"coding\"=>[{\"system\"=>\"http://ncimeta.nci.nih.gov\", \"code\"=>\"C2004062\"}]}", sd.errors[0])

    sd.errors = []
    sd.send(:verify_element, element, 'cc' => { 'coding' => [{ 'system' => 'http://hl7.org/fhir/sid/icd-10', 'code' => 'Q841' }] }) # completely different
    assert_equal("cc CodeableConcept did not match defined pattern: {\"coding\"=>[{\"system\"=>\"http://ncimeta.nci.nih.gov\", \"code\"=>\"C2004062\"}]}", sd.errors[0])
  end

  def test_invalid_value_per_type
    sd = FHIR::StructureDefinition.new
    sd.warnings = []
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack to make this work, wish it was cleaner

    element = FHIR::ElementDefinition.new('path' => 'vinv', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1')
    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 'string_value')
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 12345)
    assert_equal("vinv is not a valid string: '12345'", sd.errors[0])
    assert_equal("vinv did not match one of the valid data types: [\"string\"]", sd.errors[1])

    element = FHIR::ElementDefinition.new('path' => 'vinv', 'type' => [{ 'code' => 'integer' }], 'min' => 1, 'max' => '1')
    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 12345)
    assert_empty(sd.errors)

    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 'string_value')
    assert_equal("vinv is not a valid integer: 'string_value'", sd.errors[0])
    assert_equal("vinv did not match one of the valid data types: [\"integer\"]", sd.errors[1])

    element = FHIR::ElementDefinition.new('path' => 'vinv', 'type' => [{ 'code' => 'Observation' }], 'min' => 1, 'max' => '1')
    sd.errors = []
    sd.send(:verify_element, element, 'vinv' => 'something_that_isnt_an_Observation')
    assert_equal("Unable to verify Observation as a FHIR Resource.", sd.errors[0])
    assert_equal("vinv is not a valid Observation: 'something_that_isnt_an_Observation'", sd.errors[1])
    assert_equal("vinv did not match one of the valid data types: [\"Observation\"]", sd.errors[2])
  end

  def test_unable_to_guess_type
    sd = FHIR::StructureDefinition.new
    sd.warnings = []
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack

    element = FHIR::ElementDefinition.new('path' => 'no_type', 'min' => 1, 'max' => '1')
    sd.send(:verify_element, element, 'no_type' => 'abcd')
    assert_equal("Unable to guess data type for no_type", sd.warnings[0])

    element = FHIR::ElementDefinition.new('path' => 'has_type','type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1')
    sd.warnings = []
    sd.errors = []
    sd.send(:verify_element, element, 'has_type' => 'abcd')
    assert_empty(sd.errors)
    assert_empty(sd.warnings)

    # this test is unique in that the message is based purely on the element definition,
    # not the object being validated against that definition
  end

  def test_valueset_binding
    sd = FHIR::StructureDefinition.new
    sd.warnings = []
    sd.hierarchy = OpenStruct.new(path: 'x') # just a hack

    # first 2 value sets are special cases
    element = FHIR::ElementDefinition.new('path' => 'mime', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSet' => 'http://hl7.org/fhir/ValueSet/mimetypes' })
    sd.errors = []
    sd.send(:check_binding_element, element, 'xml')
    assert_empty(sd.errors)

    sd.send(:check_binding_element, element, 'application/xml')
    assert_empty(sd.errors)

    sd.send(:check_binding_element, element, 'jpeg')
    assert_equal("mime has invalid mime-type: 'jpeg'", sd.errors[0])

    element = FHIR::ElementDefinition.new('path' => 'lang', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSet' => 'http://hl7.org/fhir/ValueSet/languages' })
    sd.errors = []
    sd.send(:check_binding_element, element, 'en')
    assert_empty(sd.errors)

    sd.send(:check_binding_element, element, 'English (United States)')
    assert_equal("lang has unrecognized language: 'English (United States)'", sd.errors[0])

    sd.errors = []
    sd.send(:check_binding_element, element, 'qq')
    assert_equal("lang has unrecognized language: 'qq'", sd.errors[0])


    # use a valueset we don't have defined here
    element = FHIR::ElementDefinition.new('path' => 'problem', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSet' => 'http://standardhealthrecord.org/shr/problem/vs/ProblemCategoryVS' })
    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, 'disease')
    assert_empty(sd.errors)
    assert_equal("problem has unknown ValueSet: 'http://standardhealthrecord.org/shr/problem/vs/ProblemCategoryVS'", sd.warnings[0])


    # regular case, FHIR VS with nothing special about it
    # binding strength required => error if wrong
    element = FHIR::ElementDefinition.new('path' => 'support', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSet' => 'http://hl7.org/fhir/ValueSet/code-search-support',
                                                         'strength' => 'required' })
    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, 'explicit')
    assert_empty(sd.errors)
    assert_empty(sd.warnings)

    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, 'some')
    assert_equal("support has invalid code 'some' from http://hl7.org/fhir/ValueSet/code-search-support", sd.errors[0])
    assert_empty(sd.warnings)

    # binding strength example => warning if wrong
    element = FHIR::ElementDefinition.new('path' => 'support', 'type' => [{ 'code' => 'string' }], 'min' => 1, 'max' => '1',
                                          'binding' => { 'valueSet' => 'http://hl7.org/fhir/ValueSet/code-search-support',
                                                         'strength' => 'example' })
    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, 'explicit')
    assert_empty(sd.errors)
    assert_empty(sd.warnings)

    sd.errors = []
    sd.warnings = []
    sd.send(:check_binding_element, element, 'some')
    assert_equal("support has invalid code 'some' from http://hl7.org/fhir/ValueSet/code-search-support", sd.warnings[0])
    assert_empty(sd.errors)
  end

  def test_get_json_nodes
    sd = FHIR::StructureDefinition.new
    json = { "colors" => ["red", "green", "blue"], 
      "people" => [{ "first" => "John", "last" => "Smith"}, { "first" => "Jane", "last" => "Doe"} ],
      "nested_level_1" => { "nested_level_2" => { "nested_level_3" => "value"}}}

    nodes = sd.send(:get_json_nodes, json, "colors")
    assert_equal(["red", "green", "blue"], nodes)

    nodes = sd.send(:get_json_nodes, json, "people.first")
    assert_equal(["John", "Jane"], nodes)

    node = sd.send(:get_json_nodes, json, "nested_level_1.nested_level_2.nested_level_3")
    assert_equal(["value"], node)
  end
end
