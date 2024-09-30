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
      login_as(user)
      visit admin_root_path

      expect(page).to have_content('Lista de usuários')
      expect(page).to have_content(user.email)
    end

    context 'when two users' do
      before do
        login_as(second_user)
      end

      it 'changes an user' do
        visit admin_root_path

        click_on 'Trocar perfil', match: :first

        expect(page).to have_content("Perfil #{user.email} alterado com sucesso!")
      end
    end
  end

  context 'when regular user' do
    let(:user) { create(:user, admin: false) }

    it 'can not access' do
      visit admin_root_path

      expect(page).to have_current_path(root_path)
    end
  end
end
