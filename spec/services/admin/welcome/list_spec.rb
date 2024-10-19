# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Welcome::List do
  describe '#call' do
    subject(:result) { service_instance.call }

    before do
      user
      second_user
    end

    let(:action_params) { { controller: 'admin/welcomes', action: 'index' } }
    let(:params) do
      { dashboard: WelcomeDashboard.new,
        order: Administrate::Order.new,
        params: action_params,
        scoped_resource: User.all }
    end
    let(:service_instance) { described_class.new(params) }
    let(:user) { create(:user) }
    let(:second_user) { create(:user, email: 'test@test.testing') }

    it { expect(User.all.size).to eq 2 }
    it { expect(result[:resources].size).to eq 2 }
    it { expect(result[:resources]).to eq [user, second_user] }

    context 'when has filter' do
      let(:action_params) { { controller: 'admin/welcomes', action: 'index', search: 'Test' } }

      it { expect(User.all.size).to eq 2 }
      it { expect(result[:resources].size).to eq 1 }
      it { expect(result[:resources]).to eq [second_user] }
    end
  end
end
