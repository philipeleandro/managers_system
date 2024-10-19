# frozen_string_literal: true

class CreateRecruitments < ActiveRecord::Migration[7.2]
  def change
    create_table :recruitments do |t|
      t.string :name, null: false
      t.boolean :paid, null: false, default: false
      t.date :payment_date
      t.string :status, null: false, default: :new
      t.references :hirer, foreign_key: true, null: true

      t.timestamps
    end
  end
end
