# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authorization' do
  let(:applier) { create(:applier) }

  before do
    applier
    login_as(user)
  end

  context 'when authorized' do
    let(:user) { create(:user, admin: true) }

    it 'accesses page' do
      visit admin_roles_path

      expect(page).to have_current_path(admin_roles_path)
    end
  end

  context 'when unauthorized' do
    let(:user) { create(:user, admin: false) }

    it 'logout out user' do
      visit admin_roles_path

      expect(page).to have_content('Logout efetuado com sucesso')
    end
  end
end
