# frozen_string_literal: true

class AddRecruitmentRefToRoles < ActiveRecord::Migration[7.2]
  def change
    add_reference :roles, :recruitment, foreign_key: true
  end
end
