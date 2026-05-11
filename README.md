# fhir_models [![Build Status](https://api.travis-ci.org/fhir-crucible/fhir_models.svg?branch=master)](https://travis-ci.org/fhir-crucible/fhir_models)

FHIR R4 Resource models generated from FHIR StructureDefinitions.

The StructureDefinitions, XML Schemas, and examples are reused from the [HL7 FHIR build tools](https://github.com/HL7/fhir).

### Getting Started
```
$ bundle install
$ bundle exec rake fhir:console
```

### Features
- FHIR R4 Resource Models
- XML and JSON support
- Resource Validation
- Not Supported
  - Primitive Extensions
  - FHIR Comments

### Resource Basics

  Using XML...
  ```ruby
  xml = File.read('patient-example.xml')
  patient = FHIR.from_contents(xml)
  puts patient.to_xml
  ```
  Using JSON...
  ```ruby
  json = File.read('patient-example.json')
  patient = FHIR.from_contents(json)
  puts patient.to_json
  ```

  Creating an `Observation` by hand...
  ```ruby
  obs = FHIR::Observation.new(
    'status' => 'final',
    'code' => {
      'coding' => [{ 'system' => 'http://loinc.org', 'code' => '3141-9', 'display' => 'Weight Measured' }],
      'text' => 'Weight Measured'
    },
    'category' => {
      'coding' => [{ 'system' => 'http://hl7.org/fhir/observation-category', 'code' => 'vital-signs' }]
    },
    'subject' => { 'reference' => 'Patient/example' },
    'context' => { 'reference' => 'Encounter/example' }
  )
  obs.valueQuantity = FHIR::Quantity.new(
    'value' => 185,
    'unit' => 'lbs',
    'code' => '[lb_av]',
    'system' => 'http://unitsofmeasure.org'
  )
  ```
  
  Iterating over all elements in a resource, including nested elements...
  ```ruby
  patient.each_element do |value, metadata, path|
    puts "Info for #{path}:"
    puts "- value: #{value}"
    puts "- type: #{metadata['type']}"
    puts "- cardinality: #{metadata['min']}..#{metadata['max']}"
  end
  ```

  ### Validation

  Using built in validation...
  ```ruby
  patient.valid? # returns true or false
  patient.validate # returns Hash of errors, empty if valid
  ```

  Using a profile or structure definition...
  ```ruby
  sd = FHIR::Definitions.resource_definition('Patient')
  sd.validates_resource?(patient) # passing in FHIR::Patient
  # Validation failed? Get the errors and warnings...
  puts sd.errors
  puts sd.warnings
  ```
# License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
