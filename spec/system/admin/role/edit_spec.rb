# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update role' do
  let(:user) { create(:user, admin: true) }
  let(:role) { create(:role) }

  before { role }

  context 'when success' do
    it 'updates role' do
      login_as(user)
      visit admin_root_path
      click_on 'Vaga'
      click_on role.title
      click_on 'Editar'
      select 'Em andamento', from: 'Status'
      click_on 'Atualizar Vaga'

      expect(page).to have_current_path(admin_role_path(role.id))
      expect(page).to have_content('Vaga foi atualizado com sucesso.')
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Vaga'
        click_on role.title
        click_on 'Editar'
        fill_in 'Título', with: ''
        click_on 'Atualizar Vaga'

        expect(page).to have_content('Título não pode ficar em branco')
        expect(page).to have_current_path(admin_role_path(role.id))
      end
    end
  end
end
