# frozen_string_literal: true

FactoryBot.define do
  factory :recruitment do
    hirer
    name { 'Recruitment X' }
    paid { true }
    payment_date { '10/10/2024' }
    status { :new }
    hirer_id { hirer.id }
  end

  factory :second_recruitment, class: 'Recruitment' do
    name { 'Recruitment Y' }
    paid { false }
    payment_date { '' }
    status { :in_progress }
    hirer_id { nil }
  end
end
