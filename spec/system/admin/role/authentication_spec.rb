# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authentication' do
  let(:user) { create(:user, admin: true) }

  context 'when logged in' do
    it 'accesses page' do
      login_as(user)
      visit admin_roles_path

      expect(page).to have_current_path(admin_roles_path)
    end
  end

  context 'when not logged in' do
    it 'redirects to new session path' do
      visit admin_roles_path

      expect(page).to have_current_path(new_user_session_path)
    end
  end
end
