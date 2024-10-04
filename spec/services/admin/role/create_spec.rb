# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Role::Create do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(role_build: instance) }

    context 'when success' do
      let(:instance) { build(:role) }

      it { expect(result).to eq({ success: true, role: instance }) }
    end

    context 'when fail' do
      let(:instance) { build(:role, title: '') }

      it { expect(result).to eq({ success: false, role: instance }) }
    end
  end
end
