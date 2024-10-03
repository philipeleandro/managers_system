# frozen_string_literal: true

class Role < ApplicationRecord
  validates :title, :requirements, :description, :status, presence: true

  has_enumeration_for :status, with: Status, create_helpers: true
end
