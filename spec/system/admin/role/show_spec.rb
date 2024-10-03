# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show role' do
  let(:user) { create(:user, admin: true) }
  let(:role) { create(:role) }

  before do
    login_as(user)
  end

  context 'when success' do
    before { role }

    it 'accesses role' do
      visit admin_root_path
      click_on 'Vaga'
      click_on role.title.to_s

      expect(page).to have_current_path(admin_role_path(role.id))
      expect(page).to have_content('Visualizar')
    end
  end

  context 'when fail' do
    it 'does not find a link' do
      visit admin_root_path
      click_on 'Vaga'

      expect(page).to have_no_content(role.title)
    end
  end
end
