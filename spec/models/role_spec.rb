# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role do
  subject { build(:role) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:requirements) }
  end
end
