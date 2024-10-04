# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Role::Update do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(role: role, params: params) }
    let(:role) { create(:role) }

    before { role }

    context 'when success' do
      let(:params) { { description: 'Test' } }

      it { expect(result).to be_truthy }
    end

    context 'when fail' do
      let(:params) { { description: 'Test' } }

      before { allow(role).to receive(:update).and_return(false) }

      it { expect(result).to be_falsy }
    end
  end
end
