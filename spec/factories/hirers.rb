# frozen_string_literal: true

FactoryBot.define do
  factory :hirer do
    name { 'João Doe' }
    company_name { 'Doe Ltda' }
    phone { '65987064859' }
    email { 'joao@doe.com' }
    cpf { '62398144151' }
    cnpj { '10896777000130' }
    status { 'active' }
  end
end
