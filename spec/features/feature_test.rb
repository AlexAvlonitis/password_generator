require_relative '../../lib/password_generator'
require_relative '../../lib/errors'

describe 'Feature test 1: Generate a Password' do
  let(:lowercase_az) { ('a'..'z').to_a }
  let(:uppercase_az) { ('A'..'Z').to_a }
  let(:special) { ["!", "$", "%", "&", "*", "@", "^"] }
  let(:number) { (0..9).to_a }
  let(:invalid_hash_all_false) { { length: 4, uppercase: false, lowercase: false, number: false, special: false } }

  context 'When params are correct' do
    it 'should return a 6 character long password' do
      generator = PasswordGenerator.build(length: 6)
      password_array = generator.create_password.split("")
      expect(password_array.count).to eq 6
    end

    context 'When all params are true except uppercase' do
      it 'should create a password without containing an uppercase letter' do
        generator = PasswordGenerator.build(length: 6, uppercase: false)
        count_password_chars = generator.create_password.split("").count
        split_array = generator.create_password.split("")
        result = split_array - uppercase_az
        expect(result.count).to eq count_password_chars
      end
    end

    context 'When all params are true except lowercase' do
      it 'should create a password without containing a lowercase letter' do
        generator = PasswordGenerator.build(length: 6, lowercase: false)
        count_password_chars = generator.create_password.split("").count
        split_array = generator.create_password.split("")
        result = split_array - lowercase_az
        expect(result.count).to eq count_password_chars
      end
    end

    context 'When all params are true except number' do
      it 'should create a password without containing a number' do
        generator = PasswordGenerator.build(length: 6, lowercase: false)
        count_password_chars = generator.create_password.split("").count
        split_array = generator.create_password.split("")
        result = split_array - lowercase_az
        expect(result.count).to eq count_password_chars
      end
    end

    context 'When all params are true except special' do
      it 'should create a password without containing a special character' do
        generator = PasswordGenerator.build(length: 6, special: false)
        count_password_chars = generator.create_password.split("").count
        split_array = generator.create_password.split("")
        result = split_array - special
        expect(result.count).to eq count_password_chars
      end
    end
  end

  context 'When params are invalid' do
    it 'should return an error if nothing no params are passed' do
      expect{PasswordGenerator.build}.to raise_error ArgumentError
    end

    it 'should return an error if all params are false' do
      expect{ PasswordGenerator.build(invalid_hash_all_false) }.to raise_error Errors::ALL_FALSE_ERROR
    end

    it 'should retun an error if length is not in correct range' do
      expect{ PasswordGenerator.build(length: 1) }.to raise_error Errors::INVALID_RANGE_ERROR
    end

    it 'should return an error if length is not integer' do
      expect{ PasswordGenerator.build(length: '4') }.to raise_error Errors::ONLY_INTEGER_ERROR
    end

    it 'should return an error if uppercase is not boolean' do
      expect{ PasswordGenerator.build(uppercase: 'not_boolean') }.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end

    it 'should return an error if lowercase is not boolean' do
      expect{ PasswordGenerator.build(lowercase: 'not_boolean') }.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end

    it 'should return an error if number is not boolean' do
      expect{ PasswordGenerator.build(number: 'not_boolean') }.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end

    it 'should return an error if special is not boolean' do
      expect{ PasswordGenerator.build(special: 'not_boolean') }.to raise_error Errors::ONLY_BOOLEAN_ERROR
    end
  end
end
