# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Applier::Create do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(applier_build: instance) }

    context 'when success' do
      let(:instance) { build(:applier) }

      it { expect(result).to eq({ success: true, applier: instance }) }
    end

    context 'when fail' do
      let(:instance) { build(:applier, email: '') }

      it { expect(result).to eq({ success: false, applier: instance }) }
    end
  end
end
