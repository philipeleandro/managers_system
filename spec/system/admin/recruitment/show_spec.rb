# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show recruitment' do
  let(:user) { create(:user, admin: true) }
  let(:recruitment) { create(:recruitment) }

  before do
    login_as(user)
  end

  context 'when success' do
    before { recruitment }

    it 'accesses recruitment' do
      visit admin_root_path
      click_on 'Recrutamento'
      click_on recruitment.name.to_s

      expect(page).to have_current_path(admin_recruitment_path(recruitment.id))
      expect(page).to have_content(recruitment.hirer.company_name)
      expect(page).to have_content('Visualizar')
    end
  end

  context 'when fail' do
    it 'does not find a link' do
      visit admin_root_path
      click_on 'Recrutamento'

      expect(page).to have_no_content(recruitment.name)
    end
  end
end
