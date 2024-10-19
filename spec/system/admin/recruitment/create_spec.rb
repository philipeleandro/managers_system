# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create recruitment' do
  let(:user) { create(:user, admin: true) }

  context 'when success' do
    it 'creates recruitment' do
      login_as(user)
      visit admin_root_path
      click_on 'Recrutamento'
      click_on 'Criar recrutamento'
      fill_in 'Nome', with: 'Example'
      check 'Pago'
      fill_in 'Data do pagamento', with: '01/01/2024'
      select 'Novo', from: 'Status'
      click_on 'Criar Recrutamento'

      expect(page).to have_content('Recrutamento foi criado com sucesso')
      expect(Recruitment.all.size).to eq 1
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Recrutamento'
        click_on 'Criar recrutamento'
        check 'Pago'
        click_on 'Criar Recrutamento'

        expect(page).to have_content('Nome não pode ficar em branco')
      end
    end
  end
end
