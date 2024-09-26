# frozen_string_literal: true

class Applier < ApplicationRecord
  HTTP_PROTOCOL = %w[http https].freeze

  validates :name, :phone, :email, :city, :state, :cv_link, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true
  validates :cv_link, format: { with: URI::DEFAULT_PARSER.make_regexp(HTTP_PROTOCOL) }
end
