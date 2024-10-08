# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :appliers, through: :appliers_roles

  belongs_to :recruitment, optional: true

  validates :title, :requirements, :description, :status, presence: true

  has_enumeration_for :status, with: Status, create_helpers: true
end
