require 'spec_helper'
require 'password_maker'

describe PasswordMaker do
  let(:subject) { described_class.new(input_checker) }
  let(:params_hash) { { length: 4,
                        uppercase: true,
                        lowercase: true,
                        number: true,
                        special: true } }

  let(:input_checker) { double :input_checker }
  let(:lowercase_az) { ('a'..'z').to_a }
  let(:uppercase_az) { ('A'..'Z').to_a }
  let(:special) { ["!", "$", "%", "&", "*", "@", "^"] }
  let(:number) { (0..9).to_a }
  let(:all_included) { lowercase_az + uppercase_az + special + number }

  context 'When length is 4 and all params are true' do

    before do
      allow(input_checker).to receive(:valid_params) { params_hash }
    end

    it 'creates a random password that includes any of the string possibilities' do
      count = subject.generate.split("").count
      split_array = subject.generate.split("")
      substract = split_array - all_included
      expect(substract.count).not_to eq count
    end

  end

  context 'When length is 4 and all params are true except uppercase' do
    let(:params_hash) { { length: 4,
                          uppercase: false,
                          lowercase: true,
                          number: true,
                          special: true } }

    before do
      allow(input_checker).to receive(:valid_params) { params_hash }
    end

    it 'creates a random password that includes any of the string possibilities except uppercase' do
      count = subject.generate.split("").count
      split_array = subject.generate.split("")
      substract = split_array - uppercase_az
      expect(substract.count).to eq count
    end

  end

  context 'When length is 4 and all params are true except lowercase' do
    let(:params_hash) { { length: 4,
                          uppercase: true,
                          lowercase: false,
                          number: true,
                          special: true } }

    before do
      allow(input_checker).to receive(:valid_params) { params_hash }
    end

    it 'creates a random password that includes any of the string possibilities except lowercase' do
      count = subject.generate.split("").count
      split_array = subject.generate.split("")
      substract = split_array - lowercase_az
      expect(substract.count).to eq count
    end

  end

  context 'When length is 4 and all params are true except number' do
    let(:params_hash) { { length: 4,
                          uppercase: true,
                          lowercase: true,
                          number: false,
                          special: true } }

    before do
      allow(input_checker).to receive(:valid_params) { params_hash }
    end

    it 'creates a random password that includes any of the string possibilities except number' do
      count = subject.generate.split("").count
      split_array = subject.generate.split("")
      substract = split_array - number
      expect(substract.count).to eq count
    end

  end

  context 'When length is 4 and all params are true except special' do
    let(:params_hash) { { length: 4,
                          uppercase: true,
                          lowercase: true,
                          number: true,
                          special: false } }

    before do
      allow(input_checker).to receive(:valid_params) { params_hash }
    end

    it 'creates a random password that includes any of the string possibilities except number' do
      count = subject.generate.split("").count
      split_array = subject.generate.split("")
      substract = split_array - special
      expect(substract.count).to eq count
    end

  end


end
