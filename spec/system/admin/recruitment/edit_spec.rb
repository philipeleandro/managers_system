# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update recruitment' do
  let(:user) { create(:user, admin: true) }
  let(:recruitment) { create(:recruitment) }

  before { recruitment }

  context 'when success' do
    it 'updates recruitment' do
      login_as(user)
      visit admin_root_path
      click_on 'Recrutamento'
      click_on recruitment.name
      click_on 'Editar'
      select 'Em andamento', from: 'Status'
      click_on 'Atualizar Recrutamento'

      expect(page).to have_current_path(admin_recruitment_path(recruitment.id))
      expect(page).to have_content('Recrutamento foi atualizado com sucesso.')
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Recrutamento'
        click_on recruitment.name
        click_on 'Editar'
        fill_in 'Nome', with: ''
        click_on 'Atualizar Recrutamento'

        expect(page).to have_content('Nome não pode ficar em branco')
        expect(page).to have_current_path(admin_recruitment_path(recruitment.id))
      end
    end
  end
end
