# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Role::List do
  describe '#call' do
    subject(:result) { service_instance.call }

    before do
      role
      second_role
    end

    let(:action_params) { { controller: 'admin/roles', action: 'index' } }
    let(:params) do
      { dashboard: RoleDashboard.new,
        order: Administrate::Order.new,
        params: action_params,
        scoped_resource: Role.all }
    end
    let(:service_instance) { described_class.new(params) }
    let(:role) { create(:role) }
    let(:second_role) { create(:role, title: 'Test') }

    it { expect(Role.all.size).to eq 2 }
    it { expect(result[:resources].size).to eq 2 }
    it { expect(result[:resources]).to eq [role, second_role] }

    context 'when has filter' do
      let(:action_params) { { controller: 'admin/roles', action: 'index', search: 'Test' } }

      it { expect(Role.all.size).to eq 2 }
      it { expect(result[:resources].size).to eq 1 }
      it { expect(result[:resources]).to eq [second_role] }
    end
  end
end
