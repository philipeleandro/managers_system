# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Recruitment::Create do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(recruitment_build: instance) }

    context 'when success' do
      let(:instance) { build(:recruitment) }

      it { expect(result).to eq({ success: true, recruitment: instance }) }
    end

    context 'when fail' do
      let(:instance) { build(:recruitment, name: '') }

      it { expect(result).to eq({ success: false, recruitment: instance }) }
    end
  end
end
