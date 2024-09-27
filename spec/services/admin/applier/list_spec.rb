# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Applier::List do
  describe '#call' do
    subject(:result) { service_instance.call }

    before do
      applier
      second_applier
    end

    let(:action_params) { { controller: 'admin/appliers', action: 'index' } }
    let(:params) do
      { dashboard: ApplierDashboard.new,
        order: Administrate::Order.new,
        params: action_params,
        scoped_resource: Applier.all }
    end
    let(:service_instance) { described_class.new(params) }
    let(:applier) { create(:applier) }
    let(:second_applier) { create(:second_applier) }

    it { expect(Applier.all.size).to eq 2 }
    it { expect(result[:resources].size).to eq 2 }
    it { expect(result[:resources]).to eq [applier, second_applier] }

    context 'when has filter' do
      let(:action_params) { { controller: 'admin/appliers', action: 'index', search: 'ana@testing.com' } }

      it { expect(Applier.all.size).to eq 2 }
      it { expect(result[:resources].size).to eq 1 }
      it { expect(result[:resources]).to eq [second_applier] }
    end
  end
end
