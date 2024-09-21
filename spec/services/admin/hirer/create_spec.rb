# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Hirer::Create do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(hirer_build: instance) }

    context 'when success' do
      let(:instance) { build(:hirer) }

      it { expect(result).to eq({ success: true, hirer: instance }) }
    end

    context 'when fail' do
      let(:instance) { build(:hirer, email: '') }

      it { expect(result).to eq({ success: false, hirer: instance }) }
    end
  end
end
