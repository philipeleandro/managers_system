# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update applier' do
  let(:user) { create(:user, admin: true) }
  let(:applier) { create(:applier) }

  before { applier }

  context 'when success' do
    it 'updates applier' do
      login_as(user)
      visit admin_root_path
      click_on 'Candidato'
      click_on applier.name.to_s
      click_on "Editar #{applier.name}"
      fill_in 'Nome', with: 'New name'
      click_on 'Atualizar Candidato'

      expect(page).to have_current_path(admin_applier_path(applier.id))
      expect(page).to have_content('Candidato foi atualizado com sucesso.')
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Candidato'
        click_on applier.name.to_s
        click_on "Editar #{applier.name}"
        fill_in 'Email', with: ''
        click_on 'Atualizar Candidato'

        expect(page).to have_content('Email não pode ficar em branco')
        expect(page).to have_current_path(admin_applier_path(applier.id))
      end
    end

    context 'when field has invalid format' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Candidato'
        click_on applier.name.to_s
        click_on "Editar #{applier.name}"
        fill_in 'Telefone', with: '123456'
        click_on 'Atualizar Candidato'

        expect(page).to have_current_path(admin_applier_path(applier.id))
        expect(page).to have_content('Telefone não é válido')
      end
    end
  end
end
