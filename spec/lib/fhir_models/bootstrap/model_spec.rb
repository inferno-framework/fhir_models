RSpec.describe 'FHIR::Model' do
  describe '#hash' do
    it 'should be the same for two identical fhir models' do
      attributes = {
        name: [
          family: [ 'Smith' ]
        ]
      }
      patient1 = FHIR::Patient.new(attributes)
      patient2 = FHIR::Patient.new(attributes)
      expect(patient1.hash).to eq patient2.hash
    end

    it 'should be different for two models that do not have the same attributes' do
      attributes1 = {
        name: [
          family: [ 'Smith' ]
        ]
      }
      attributes2 = {
        name: [
          family: [ 'Jones' ]
        ]
      }
      patient1 = FHIR::Patient.new(attributes1)
      patient2 = FHIR::Patient.new(attributes2)
      expect(patient1.hash).not_to eq patient2.hash
    end
  end

  describe '#== (alias: eql?)' do
    it 'should be true for two identical fhir models' do
      attributes = {
        name: [
          family: [ 'Smith' ]
        ]
      }
      patient1 = FHIR::Patient.new(attributes)
      patient2 = FHIR::Patient.new(attributes)
      expect(patient1).to eq patient2
      expect(patient1).to eql patient2
    end

    it 'should be false for two models that do not have the same attributes' do
      attributes1 = {
        name: [
          family: [ 'Smith' ]
        ]
      }
      attributes2 = {
        name: [
          family: [ 'Jones' ]
        ]
      }
      patient1 = FHIR::Patient.new(attributes1)
      patient2 = FHIR::Patient.new(attributes2)
      expect(patient1).not_to eq patient2
      expect(patient1).not_to eql patient2
    end

    it 'should be false when compared to a different class' do
      attributes1 = {
        name: [
          family: [ 'Smith' ]
        ]
      }
      patient1 = FHIR::Patient.new(attributes1)
      patient2 = "patient 2"
      expect(patient1).not_to eq patient2
      expect(patient1).not_to eql patient2
    end

    it 'should be false when compared to nil' do
      attributes1 = {
        name: [
          family: [ 'Smith' ]
        ]
      }
      patient1 = FHIR::Patient.new(attributes1)
      expect(patient1).not_to eq nil
      expect(patient1).not_to be_nil
    end

  end

  describe '.new' do
    it 'can be instantiated with a simple hash' do
      range = FHIR::Range.new(low: {value: 18})
      expect(range.valid?).to be_truthy
      expect(range.low.value).to equal(18)
    end

    it 'can be instantiated with another FHIR::Model' do
      range = FHIR::Range.new(low: FHIR::Quantity.new(value: 18))
      expect(range.valid?).to be_truthy
      expect(range.low.value).to equal(18)
    end
  end

  describe '#respond_to?' do
    it 'returns true for :value on choice elements' do
      extension = FHIR::Extension.new(valueInteger: 5)
      expect(extension.value).to eq(5)
      expect(extension.respond_to? :value).to be_truthy
    end

    it 'returns false for :value on nonchoice elements' do
      range = FHIR::Range.new(low: FHIR::Quantity.new(value: 18))
      expect(range.respond_to? :value).to eq(false)
    end
  end

end
