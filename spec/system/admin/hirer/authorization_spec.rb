# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authorization' do
  let(:hirer) { create(:hirer) }

  before do
    hirer
    login_as(user)
  end

  context 'when authorized' do
    let(:user) { create(:user, admin: true) }

    it 'accesses page' do
      visit admin_hirers_path

      expect(page).to have_current_path(admin_hirers_path)
    end
  end

  context 'when unauthorized' do
    let(:user) { create(:user, admin: false) }

    it 'logout out user' do
      visit admin_hirers_path
      click_on 'Editar'

      expect(page).to have_content('Para continuar, faça login ou registre-se.')
    end
  end
end
