# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController do
  subject(:result) { controller.after_sign_in_path_for(user) }

  let(:user) { create(:user, admin: true) }

  context 'when after logged in' do
    it { expect(result).to eq(admin_welcomes_path) }
  end
end
