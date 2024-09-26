# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Destroy applier' do
  let(:user) { create(:user, admin: true) }
  let(:applier) { create(:applier) }

  before do
    login_as(user)
  end

  context 'when success' do
    before { applier }

    it 'delete applier' do
      visit admin_root_path
      click_on 'Candidato'
      click_on 'Deletar'

      expect(page).to have_current_path(admin_appliers_path)
      expect(page).to have_content('Candidato foi deletado com sucesso.')
    end
  end

  context 'when fail' do
    before do
      applier
      allow_any_instance_of(Applier).to receive(:destroy).and_return(false)
      # allow_any_instance_of(Admin::Hirer::Destroy).to receive(:call)
      #   .and_return({ success: false,
      #                 message: '<br/>' }
      #              )
      # Commented to help when to implement delete service for applier
    end

    it 'delete applier' do
      visit admin_root_path
      click_on 'Candidato'
      click_on 'Deletar'

      expect(page).to have_current_path(admin_appliers_path)
      expect(page).to have_no_content('Candidato foi deletado com sucesso.')
    end
  end
end
