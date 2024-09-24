# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users list' do
  before do
    login_as(user)
  end

  context 'when admin' do
    let(:user) { create(:user, admin: true) }
    let(:second_user) { create(:user, id: 22, email: 'ana@doe.com', admin: true) }

    it 'accesses users list' do
      visit admin_root_path
      click_on 'Lista de Usuários'

      expect(page).to have_current_path(users_path)
      expect(page).to have_content('Lista de Usuários')
      expect(page).to have_content(user.email)
    end

    it 'changes second user to admin' do
      visit admin_root_path
      click_on 'Lista de Usuários'
      fill_in 'email', with: second_user.email
      click_on 'Buscar'
      click_on 'Trocar perfil'

      expect(page).to have_current_path(users_path)
      expect(page).to have_content('Perfil ana@doe.com alterado com sucesso!')
    end
  end

  context 'when regular user' do
    let(:user) { create(:user, admin: false) }

    it 'can not access' do
      visit admin_root_path

      expect(page).to have_no_link('Lista de Usuários')
      expect(page).to have_current_path(admin_root_path)
    end
  end
end
