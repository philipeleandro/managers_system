# frozen_string_literal: true

class Hirer < ApplicationRecord
  has_many :recruitments, dependent: :nullify

  validates :name, :company_name, :phone, :email, :cpf, presence: true
  validates :email, :cpf, :cnpj, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true
  validate :validate_cpf, :validate_cnpj

  has_enumeration_for :status, with: Status, create_helpers: true

  def validate_cpf
    message = I18n.t('activerecord.errors.messages.not_valid')

    errors.add(:cpf, message) unless Validator::Documents.valid_cpf?(cpf)
  end

  def validate_cnpj
    message = I18n.t('activerecord.errors.messages.not_valid')

    errors.add(:cnpj, message) unless Validator::Documents.valid_cnpj?(cnpj)
  end
end
