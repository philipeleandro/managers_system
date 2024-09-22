# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create hirer' do
  let(:user) { create(:user, admin: true) }

  context 'when success' do
    it 'creates hirer' do
      login_as(user)
      visit admin_root_path
      click_on 'Contratante'
      click_on 'Criar contratante'
      fill_in 'Responsável', with: 'Example'
      fill_in 'Empresa', with: 'Example'
      fill_in 'CPF', with: '123456789'
      fill_in 'E-mail', with: 'example@test.com'
      fill_in 'Telefone', with: '1111111111'
      click_on 'Criar Contratante'

      expect(page).to have_content('Contratante foi criado com sucesso')
      expect(User.all.size).to eq 1
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Contratante'
        click_on 'Criar contratante'
        fill_in 'Responsável', with: 'Example'
        fill_in 'Empresa', with: 'Example'
        fill_in 'Telefone', with: '1111111111'
        click_on 'Criar Contratante'

        expect(page).to have_content('E-mail não pode ficar em branco')
        expect(page).to have_content('CPF não pode ficar em branco')
        expect(page).to have_content('Criar Contratante')
      end
    end

    context 'when email has invalid format' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Contratante'
        click_on 'Criar contratante'
        fill_in 'Responsável', with: 'Example'
        fill_in 'E-mail', with: 'example'
        fill_in 'Empresa', with: 'Example'
        fill_in 'Telefone', with: '1111111111'
        click_on 'Criar Contratante'

        expect(page).to have_content('E-mail não é válido')
      end
    end
  end
end
