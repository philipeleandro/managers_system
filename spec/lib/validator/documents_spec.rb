# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Validator::Documents do
  describe '#valid_cpf?' do
    subject(:result) { described_class.valid_cpf?(document) }

    context 'when valid' do
      let(:document) { CPF.generate }

      it { expect(result).to be_truthy }
    end

    context 'when invalid' do
      let(:document) { '123456' }

      it { expect(result).to be_nil }
    end

    context 'when empty' do
      let(:document) { '' }

      it { expect(result).to be_nil }
    end
  end

  describe '#valid_cnpj?' do
    subject(:result) { described_class.valid_cnpj?(document) }

    context 'when valid' do
      let(:document) { CNPJ.generate }

      it { expect(result).to be_truthy }
    end

    context 'when invalid' do
      let(:document) { '12345634332' }

      it { expect(result).to be_nil }
    end

    context 'when empty' do
      let(:document) { '' }

      it { expect(result).to be_truthy }
    end
  end
end
