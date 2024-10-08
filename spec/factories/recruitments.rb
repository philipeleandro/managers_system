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
end
