# frozen_string_literal: true

class Recruitment < ApplicationRecord
  belongs_to :hirer, optional: true

  validates :name, :duration, :status, presence: true

  has_enumeration_for :status, with: Hirer::Status, create_helpers: true
end
