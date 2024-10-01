# frozen_string_literal: true

class Applier < ApplicationRecord
  HTTP_PROTOCOL = %w[http https].freeze

  has_one_attached :attachment

  validates :name, :phone, :email, :city, :state, :attachment, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true

  before_destroy :purge_cv_file

  private

  def purge_cv_file
    attachment.purge if attachment.attached?
  end
end
