# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Delete hirer' do
  let(:user) { create(:user, admin: true) }
  let(:hirer) { create(:hirer) }

  before do
    login_as(user)
  end

  context 'when success' do
    before { hirer }

    it 'delete hirer' do
      visit admin_root_path
      click_on 'Deletar'

      expect(page).to have_current_path(admin_hirers_path)
      expect(page).to have_content('Contratante foi deletado com sucesso.')
    end
  end
end
