# frozen_string_literal: true

class Applier < ApplicationRecord
  validates :name, :phone, :email, :city, :state, :cv_link, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true
end
