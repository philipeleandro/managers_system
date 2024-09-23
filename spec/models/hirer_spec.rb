# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Hirer do
  describe 'validations' do
    subject { build(:hirer) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:company_name) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:cnpj).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:email) }

    it { is_expected.to allow_value('user@example.com').for(:email) }
    it { is_expected.not_to allow_value('@com.br').for(:email) }
    it { is_expected.not_to allow_value('user.com.br').for(:email) }

    describe '.validate_cpf' do
      context 'when valid' do
        subject(:hirer) { build(:hirer, cpf: CPF.generate) }

        it { expect(hirer).to be_valid }
      end

      context 'when invalid' do
        subject(:hirer) { build(:hirer, cpf: '123456') }

        it { expect(hirer).not_to be_valid }
      end
    end

    describe '.validate_cnpj' do
      context 'when valid' do
        subject(:hirer) { build(:hirer, cnpj: CNPJ.generate) }

        it { expect(hirer).to be_valid }
      end

      context 'when invalid' do
        subject(:hirer) { build(:hirer, cnpj: '12231256') }

        it { expect(hirer).not_to be_valid }
      end
    end
  end
end
