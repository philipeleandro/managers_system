# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    title { 'MyString' }
    description { 'MyText' }
    requirements { 'MyText' }
    status { :new }
  end
end
