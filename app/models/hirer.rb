# frozen_string_literal: true

class Hirer < ApplicationRecord
  validates :name, :company_name, :phone, :email, :cpf, presence: true
  validates :email, :cpf, :cnpj, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
