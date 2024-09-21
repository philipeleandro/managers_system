# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update hirer' do
  let(:user) { create(:user, admin: true) }
  let(:hirer) { create(:hirer) }

  before { hirer }

  context 'when success' do
    it 'updates hirer' do
      login_as(user)
      visit admin_root_path
      click_on hirer.name.to_s
      click_on "Editar #{hirer.name}"
      fill_in 'CPF', with: '1234678'
      click_on 'Atualizar Contratante'

      expect(page).to have_current_path(admin_hirer_path(hirer.id))
      expect(page).to have_content('Contratante foi atualizado com sucesso.')
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on hirer.name.to_s
        click_on "Editar #{hirer.name}"
        fill_in 'Responsável', with: ''
        click_on 'Atualizar Contratante'

        expect(page).to have_content('Responsável não pode ficar em branco')
        expect(page).to have_current_path(admin_hirer_path(hirer.id))
      end
    end

    context 'when email has invalid format' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on hirer.name.to_s
        click_on "Editar #{hirer.name}"
        fill_in 'E-mail', with: 'Example'
        click_on 'Atualizar Contratante'

        expect(page).to have_current_path(admin_hirer_path(hirer.id))
        expect(page).to have_content('E-mail não é válido')
      end
    end
  end
end
