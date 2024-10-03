# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[7.2]
  def change
    create_table :roles do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.string :status, null: false, default: :new

      t.timestamps
    end
  end
end
