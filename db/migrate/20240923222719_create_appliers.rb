# frozen_string_literal: true

class CreateAppliers < ActiveRecord::Migration[7.2]
  def change
    create_table :appliers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :cv_link, null: false

      t.timestamps
    end
  end
end
