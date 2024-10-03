# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create role' do
  let(:user) { create(:user, admin: true) }

  context 'when success' do
    it 'creates role' do
      login_as(user)
      visit admin_root_path
      click_on 'Vaga'
      click_on 'Criar vaga'
      fill_in 'Título', with: 'Example'
      fill_in 'Descrição', with: 'Example'
      fill_in 'Requisitos', with: 'Example'
      click_on 'Criar Vaga'

      expect(page).to have_content('Vaga foi criado com sucesso')
      expect(Role.all.size).to eq 1
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Vaga'
        click_on 'Criar vaga'
        click_on 'Criar Vaga'

        expect(page).to have_content('Descrição não pode ficar em branco')
        expect(page).to have_content('Requisitos não pode ficar em branco')
        expect(page).to have_content('Título não pode ficar em branco')
      end
    end
  end
end
