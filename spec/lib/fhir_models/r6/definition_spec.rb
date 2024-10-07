require_relative '../../../../lib/fhir_models/r6/bootstrap/definitions'
require_relative '../../../../lib/fhir_models/r6'
RSpec.describe FHIR::R6::Definitions do
  describe '#resource_definition' do
    it 'returns R6 resource definition' do
      result = FHIR::R6::Definitions.resource_definition('Patient')
      expect(result.id).to eq('Patient')
      expect(result.version).to eq('6.0.0-ballot2')
    end
  end
end