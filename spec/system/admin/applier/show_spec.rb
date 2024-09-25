# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Show applier' do
  let(:user) { create(:user, admin: true) }
  let(:applier) { create(:applier) }

  before do
    login_as(user)
  end

  context 'when success' do
    before { applier }

    it 'accesses applier' do
      visit admin_root_path
      click_on 'Candidato'
      click_on applier.name.to_s

      expect(page).to have_current_path(admin_applier_path(applier.id))
      expect(page).to have_content("Visualizar #{applier.name}")
    end
  end

  context 'when fail' do
    it 'does not find link' do
      visit admin_root_path

      expect(page).to have_no_content(applier.name)
    end
  end
end
