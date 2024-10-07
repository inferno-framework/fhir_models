require_relative '../test_helper'
require_relative '../../lib/fhir_models/r5'
require_relative '../../lib/fhir_models/r4b'

class ContentsTest < Test::Unit::TestCase
  EXAMPLE_JSON = File.join('lib', 'fhir_models', 'examples', 'json', 'patient-example.json')
  EXAMPLE_XML  = File.join('lib', 'fhir_models', 'examples', 'xml', 'patient-example.xml')

  def test_xml_from_contents
    xml = File.read(EXAMPLE_XML)
    patient = FHIR.from_contents(xml)
    assert !patient.nil?, 'From contents did not succeed with XML.'
    assert patient.id == 'example', 'Patient did not deserialize correctly.'
    # check memory
    before = check_memory
    patient = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_json_from_contents
    json = File.read(EXAMPLE_JSON)
    patient = FHIR.from_contents(json)
    assert !patient.nil?, 'From contents did not succeed with JSON.'
    assert patient.id == 'example', 'Patient did not deserialize correctly.'
    # check memory
    before = check_memory
    patient = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_to_reference
    json = File.read(EXAMPLE_JSON)
    patient = FHIR.from_contents(json)
    reference = patient.to_reference
    assert reference.is_a?(FHIR::Reference), 'Resource unable to create a self-reference.'
    assert reference.reference == 'Patient/example', 'Resource did not generate self-reference correctly.'
    # check memory
    before = check_memory
    patient = nil
    reference = nil
    wait_for_gc
    after = check_memory
    assert_memory(before, after)
  end

  def test_negative_json_contents
    nothing = FHIR.from_contents('{}')
    assert nothing.nil?, 'From contents should have returned nil.'
  end

  def test_negative_xml_contents
    nothing = FHIR.from_contents('<?xml version="1.0" encoding="UTF-8"?><Nothing/>')
    assert nothing.nil?, 'From contents should have returned nil.'
  end

  def test_versioned_from_contents
    xml = File.read(EXAMPLE_XML)
    json = File.read(EXAMPLE_JSON)

    # infer XML
    patient_xml= FHIR.from_contents(xml)
    assert !patient_xml.nil?, 'From contents did not succeed with XML.'
    assert patient_xml.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_xml.versioned_fhir_module == FHIR::R4

    patient_xml_r4b = FHIR::R4B.from_contents(xml)
    assert !patient_xml_r4b.nil?, 'From contents did not succeed with XML.'
    assert patient_xml_r4b.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_xml_r4b.versioned_fhir_module == FHIR::R4B

    patient_xml_r5 = FHIR::R5.from_contents(xml)
    assert !patient_xml_r5.nil?, 'From contents did not succeed with XML.'
    assert patient_xml_r5.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_xml_r5.versioned_fhir_module == FHIR::R5

    patient_xml_r6 = FHIR::R6.from_contents(xml)
    assert !patient_xml_r6.nil?, 'From contents did not succeed with XML.'
    assert patient_xml_r6.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_xml_r6.versioned_fhir_module == FHIR::R6

    # infer json
    patient_json= FHIR.from_contents(json)
    assert !patient_json.nil?, 'From contents did not succeed with JSON.'
    assert patient_json.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_json.versioned_fhir_module == FHIR::R4

    patient_json_r4b = FHIR::R4B.from_contents(json)
    assert !patient_json_r4b.nil?, 'From contents did not succeed with JSON.'
    assert patient_json_r4b.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_json_r4b.versioned_fhir_module == FHIR::R4B

    patient_json_r5 = FHIR::R5.from_contents(json)
    assert !patient_json_r5.nil?, 'From contents did not succeed with JSON.'
    assert patient_json_r5.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_json_r5.versioned_fhir_module == FHIR::R5

    patient_json_r6 = FHIR::R6.from_contents(json)
    assert !patient_json_r6.nil?, 'From contents did not succeed with JSON.'
    assert patient_json_r6.id == 'example', 'Patient did not deserialize correctly.'
    assert patient_json_r6.versioned_fhir_module == FHIR::R6
  end
end
