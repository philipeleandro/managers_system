# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Applier do
  describe 'validations' do
    subject { build(:applier) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:attachment) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }

    it { is_expected.to validate_uniqueness_of(:email) }

    it { is_expected.to allow_value('user@example.com').for(:email) }
    it { is_expected.not_to allow_value('@com.br').for(:email) }
    it { is_expected.not_to allow_value('user.com.br').for(:email) }

    it { is_expected.to have_one_attached(:attachment) }
  end

  describe 'callbacks' do
    it { is_expected.to callback(:purge_cv_file).before(:destroy) }
  end
end
