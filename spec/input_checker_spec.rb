require_relative '../input_checker'
require_relative '../errors'

describe InputChecker do

  context "When valid params are passed" do
    let(:hash) { { length: 4, uppercase: false, lowercase: true, number: true, special: false } }
    let(:added_hash) { { hello: 'world' } }
    let(:incomplete_hash) { { length: 4, special: false } }
    let(:subject) { described_class.new(hash) }
    let(:subject1) { described_class.new(hash.merge(added_hash)) }
    let(:subject2) { described_class.new(incomplete_hash) }

    it "returns true if all checks are passed" do
      expect(subject).to be_truthy
    end

    it "returns true when non existent params are passed (skipped)" do
      expect(subject1).to be_truthy
    end

    it "returns true if there are missing parameters" do
      expect(subject2).to be_truthy
    end
  end

  context "When invalid params are passed" do
    let(:invalid_hash_length_integer) { { length: "not_integer" } }
    let(:invalid_hash_length_range) { { length: 2 } }
    let(:invalid_hash_uppercase) { { uppercase: 'not_boolean' } }
    let(:invalid_hash_lowercase) { { lowercase: 'not_boolean' } }
    let(:invalid_hash_number) { { number: 'not_boolean' } }
    let(:invalid_hash_special) { { special: 'not_boolean' } }
    let(:invalid_hash_all_false) { { length: 4, uppercase: false, lowercase: false, number: false, special: false } }
    let(:subject1) { described_class.new( invalid_hash_length_integer ) }
    let(:subject2) { described_class.new( invalid_hash_length_range ) }
    let(:subject3) { described_class.new( invalid_hash_uppercase ) }
    let(:subject4) { described_class.new( invalid_hash_lowercase ) }
    let(:subject5) { described_class.new( invalid_hash_number ) }
    let(:subject6) { described_class.new( invalid_hash_special ) }
    let(:subject7) { described_class.new( invalid_hash_all_false ) }

    it "raises integer only error if length is not integer" do
      expect{subject1}.to raise_error Errors::ONLY_INTEGER_ERROR
    end

    it "raises wrong range error if length is not in valid range" do
      expect{subject2}.to raise_error Errors::INVALID_RANGE_ERROR
    end

    it 'raises boolean error if uppercase is not boolean' do
      expect{subject3}.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end

    it 'raises boolean error if lowercase is not boolean' do
      expect{subject4}.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end

    it 'raises boolean error if number is not boolean' do
      expect{subject5}.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end

    it 'raises boolean error if special is not boolean' do
      expect{subject6}.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end

    it 'raises all false error if all parameters are false' do
      expect{subject7}.to raise_error Errors::ALL_FALSE_ERROR
    end

  end
end
