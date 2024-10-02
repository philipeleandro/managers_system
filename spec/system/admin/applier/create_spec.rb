# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Create applier' do
  let(:user) { create(:user, admin: true) }
  let(:temp_file) { Tempfile.new(['cv', '.pdf']) }

  context 'when success' do
    it 'creates applier' do
      login_as(user)
      visit admin_root_path
      click_on 'Candidato'
      click_on 'Criar candidato'
      fill_in 'Nome', with: 'Example'
      fill_in 'Email', with: 'example@test.com'
      fill_in 'Cidade', with: 'New city'
      select 'CE', from: 'Estado'
      fill_in 'Telefone', with: '11912345678'
      attach_file 'Currículo', temp_file.path
      click_on 'Criar Candidato'

      expect(page).to have_content('Candidato foi criado com sucesso')
      expect(Applier.all.size).to eq 1
    end
  end

  context 'when fail' do
    context 'when missing required field' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Candidato'
        click_on 'Criar candidato'
        fill_in 'Nome', with: 'Example'
        fill_in 'Cidade', with: 'New city'
        select 'CE', from: 'Estado'
        fill_in 'Telefone', with: '11912345678'
        click_on 'Criar Candidato'

        expect(page).to have_content('Email não pode ficar em branco')
        expect(page).to have_content('Currículo não pode ficar em branco')
        expect(page).to have_content('Criar Candidato')
      end
    end

    context 'when email has invalid format' do
      it 'shows error message' do
        login_as(user)
        visit admin_root_path
        click_on 'Candidato'
        click_on 'Criar candidato'
        fill_in 'Nome', with: 'Example'
        fill_in 'Email', with: 'example.com'
        fill_in 'Cidade', with: 'New city'
        select 'CE', from: 'Estado'
        fill_in 'Telefone', with: '11912345678'
        attach_file 'Currículo', temp_file.path
        click_on 'Criar Candidato'

        expect(page).to have_content('Email não é válido')
      end
    end
  end
end
