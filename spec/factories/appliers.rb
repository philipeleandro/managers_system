# frozen_string_literal: true

FactoryBot.define do
  factory :applier do
    name { 'MyString' }
    email { 'MyString@testing.com' }
    phone { '11922223333' }
    state { 'MyString' }
    city { 'MyString' }
  end
end
