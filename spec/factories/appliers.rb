# frozen_string_literal: true

FactoryBot.define do
  factory :applier do
    name { 'MyString' }
    email { 'MyString@testing.com' }
    phone { '11922223333' }
    state { 'MyString' }
    city { 'MyString' }
    cv_link { 'https://www.mystring.com' }
  end

  factory :second_applier, class: 'Applier' do
    name { 'Ana' }
    email { 'ana@testing.com' }
    phone { '11933332222' }
    state { 'SP' }
    city { 'String' }
    cv_link { 'https://www.mycv.com' }
  end
end
