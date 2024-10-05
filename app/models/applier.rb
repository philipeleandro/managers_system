# frozen_string_literal: true

class Applier < ApplicationRecord
  has_and_belongs_to_many :roles

  HTTP_PROTOCOL = %w[http https].freeze

  has_one_attached :attachment

  ACCEPTABLE_ATTACHMENT_TYPES = ['application/pdf',
                                 'application/msword',
                                 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
                                ].freeze

  validates :name, :phone, :email, :city, :state, :attachment, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, phone: true
  validates :attachment, attached: true, content_type: ACCEPTABLE_ATTACHMENT_TYPES

  before_destroy :purge_cv_file

  private

  def purge_cv_file
    attachment.purge if attachment.attached?
  end
end
