FactoryBot.define do
  factory :hier do
    name { 'João Doe' }
    company_name { 'Doe Ltda' }
    phone { '65987064859' }
    email { 'joao@doe.com' }
    cpf { '62398144151' }
    cnpj { '10896777000130' }
    status_id { 0 }
  end
end
