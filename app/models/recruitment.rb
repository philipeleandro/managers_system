# frozen_string_literal: true

class Recruitment < ApplicationRecord
  belongs_to :hirer, optional: true

  validates :name, :status, presence: true

  has_enumeration_for :status, with: Role::Status, create_helpers: true
end
