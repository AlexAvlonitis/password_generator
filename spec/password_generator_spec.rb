require 'spec_helper'
require 'password_generator'

describe PasswordGenerator do
  let(:subject) { described_class.new(password_maker) }
  let(:params_hash) { { length: 4 } }

  let(:password_maker) { double :password_maker }
  let(:password) { '2j3%' }

  context 'When params are correct' do

    before do
      allow(password_maker).to receive(:generate) { password }
    end

    it 'makes a call to password_maker and returns a string' do
      expect(subject.create_password).to eq password
    end

  end
end
