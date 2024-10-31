# frozen_string_literal: true

FactoryBot.define do
  factory :recruitment do
    hirer factory: %i[hirer]
    name { 'Recruitment X' }
    paid { true }
    payment_date { '10/10/2024' }
    status { :started }
  end

  factory :second_recruitment, class: 'Recruitment' do
    hirer factory: %i[hirer2]
    name { 'Recruitment Y' }
    paid { false }
    payment_date { '' }
    status { :finished }
  end
end
