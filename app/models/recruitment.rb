# frozen_string_literal: true

class Recruitment < ApplicationRecord
  belongs_to :hirer

  validates :name, :status, :hirer_id, presence: true

  has_enumeration_for :status, with: Status, create_helpers: true
end
