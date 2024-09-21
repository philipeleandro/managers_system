# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'joao@doe.com' }
    password { '123456' }
  end
end
