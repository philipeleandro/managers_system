# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Change status of recruitment' do
  let(:user) { create(:user, admin: true) }
  let(:recruitment) { create(:recruitment) }

  before { recruitment }

  it 'changes recruitment' do
    login_as(user)
    visit admin_root_path
    click_on 'Recrutamento'
    click_on recruitment.name
    click_on 'Alterar status'

    expect(page).to have_current_path(admin_recruitment_path(recruitment.id))
    expect(page).to have_content('Finalizado')
  end
end
