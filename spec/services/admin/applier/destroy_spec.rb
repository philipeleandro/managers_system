# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Applier::Destroy do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(applier: applier) }
    let(:applier) { create(:applier) }

    before { applier }

    context 'when success' do
      it { expect(result[:success]).to be_truthy }
    end

    context 'when fail' do
      before { allow(applier).to receive(:destroy).and_return(false) }

      it { expect(result[:success]).to be_falsy }
    end
  end
end
