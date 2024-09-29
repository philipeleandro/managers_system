# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcome' do
  before do
    login_as(user)
  end

  context 'when admin' do
    let(:user) { create(:user, admin: true) }

    it 'acesses admin profile buttons' do
      visit admin_root_path

      expect(page).to have_link('Editar')
      expect(page).to have_link('Trocar perfil')
      expect(page).to have_button('Sair')
    end
  end

  context 'when regular user' do
    let(:user) { create(:user, admin: false) }

    it 'acesses regular profile buttons' do
      visit admin_root_path

      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Logout efetuado com sucesso')
    end
  end
end
