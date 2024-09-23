# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Hirer::List do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:action_params) { { controller: 'admin/hirers', action: 'index' } }
    let(:params) do
      { dashboard: HirerDashboard.new,
        order: Administrate::Order.new,
        params: action_params,
        scoped_resource: Hirer.all }
    end

    let(:service_instance) { described_class.new(params) }
    let(:hirer) { create(:hirer) }

    before { hirer }

    it { expect(Hirer.all.size).to eq 1 }
    it { expect(result[:resources]).to eq [hirer] }
    it { expect(result[:resources].size).to eq 1 }

    context 'when has filter' do
      let(:other_cpf) { CPF.generate }
      let(:hirer_another_cpf) do
        create(
          :hirer,
          cpf: other_cpf,
          cnpj: CNPJ.generate,
          email: 'test@email.com'
        )
      end
      let(:action_params) { { controller: 'admin/hirers', action: 'index', search: other_cpf } }

      before { hirer_another_cpf }

      it { expect(Hirer.all.size).to eq 2 }
      it { expect(result[:resources].size).to eq 1 }
      it { expect(result[:resources]).to eq [hirer_another_cpf] }
    end
  end
end
