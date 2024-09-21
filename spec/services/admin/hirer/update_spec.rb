# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::Hirer::Update do
  describe '#call' do
    subject(:result) { service_instance.call }

    let(:service_instance) { described_class.new(hirer: hirer, params: params) }
    let(:hirer) { create(:hirer) }

    before { hirer }

    context 'when success' do
      let(:params) { { email: 'new_email@test.com' } }

      it { expect(result).to be_truthy }
    end

    context 'when fail' do
      let(:params) { { email: 'new_email' } }

      it { expect(result).to be_falsy }
    end
  end
end
