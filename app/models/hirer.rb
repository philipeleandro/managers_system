# frozen_string_literal: true

class Hirer < ApplicationRecord
  validates :name, :company_name, :phone, :email, :cpf, presence: true
  validates :email, :cpf, :cnpj, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true
  validate :validate_cpf, :validate_cnpj

  has_enumeration_for :status, with: Status, create_helpers: true

  def validate_cpf
    document = CPF.new(cpf)

    return if document.valid?

    errors.add(:cpf, 'não é valido!')
  end

  def validate_cnpj
    return if cnpj.blank?

    document = CNPJ.new(cnpj)

    return if document.valid?

    errors.add(:cnpj, 'não é valido!')
  end

  def formatted_cpf
    CPF.new(cpf).formatted
  end

  def formatted_cnpj
    CNPJ.new(cnpj).formatted
  end

  def formatted_phone
    phone_number = Phonelib.parse(phone)

    phone_number.local_number
  end
end
