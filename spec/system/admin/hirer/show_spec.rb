# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show hirer' do
  let(:user) { create(:user, admin: true) }
  let(:hirer) { create(:hirer) }

  before do
    login_as(user)
  end

  context 'when success' do
    before { hirer }

    it 'accesses hirer' do
      visit admin_root_path
      click_on 'Contratante'
      click_on hirer.name.to_s

      expect(page).to have_current_path(admin_hirer_path(hirer.id))
      expect(page).to have_content("Visualizar #{hirer.name}")
    end
  end

  context 'when fail' do
    it 'does not find link' do
      visit admin_root_path

      expect(page).to have_no_content(hirer.name)
    end
  end
end
