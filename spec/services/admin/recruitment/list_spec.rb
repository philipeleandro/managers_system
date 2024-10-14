# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Recruitment::List do
  describe '#call' do
    subject(:result) { service_instance.call }

    before do
      recruitment
      second_recruitment
    end

    let(:action_params) { { controller: 'admin/recruitments', action: 'index' } }
    let(:params) do
      { dashboard: RecruitmentDashboard.new,
        order: Administrate::Order.new,
        params: action_params,
        scoped_resource: Recruitment.all }
    end
    let(:service_instance) { described_class.new(params) }
    let(:recruitment) { create(:recruitment) }
    let(:second_recruitment) { create(:second_recruitment) }

    it { expect(Recruitment.all.size).to eq 2 }
    it { expect(result[:resources].size).to eq 2 }
    it { expect(result[:resources]).to eq [recruitment, second_recruitment] }

    context 'when has filter' do
      let(:action_params) { { controller: 'admin/recruitments', action: 'index', search: 'Recruitment Y' } }

      it { expect(Recruitment.all.size).to eq 2 }
      it { expect(result[:resources].size).to eq 1 }
      it { expect(result[:resources]).to eq [second_recruitment] }
    end
  end
end
