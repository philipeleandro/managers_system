# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Destroy recruitment' do
  let(:user) { create(:user, admin: true) }
  let(:recruitment) { create(:recruitment) }

  before do
    recruitment

    login_as(user)
  end

  context 'when success' do
    it 'delete recruitment' do
      visit admin_root_path
      click_on 'Recrutamento'
      click_on 'Deletar'

      expect(page).to have_current_path(admin_recruitments_path)
      expect(page).to have_content('Recrutamento foi deletado com sucesso.')
    end
  end

  context 'when fail' do
    before { allow_any_instance_of(Recruitment).to receive(:destroy).and_return(false) }

    it 'delete recruitment' do
      visit admin_root_path
      click_on 'Recrutamento'
      click_on 'Deletar'

      expect(page).to have_current_path(admin_recruitments_path)
      expect(page).to have_no_content('Recrutamento foi deletado com sucesso.')
    end
  end
end
