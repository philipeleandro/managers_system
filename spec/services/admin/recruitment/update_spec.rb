# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Recruitment::Update do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(recruitment: recruitment, params: params) }
    let(:recruitment) { create(:recruitment) }

    before { recruitment }

    context 'when success' do
      let(:params) { { name: 'Recruitment W' } }

      it { expect(result).to be_truthy }
    end

    context 'when fail' do
      let(:params) { { status: nil } }

      it { expect(result).to be_falsy }
    end
  end
end
