# frozen_string_literal: true

class CreateJoinTableRoleApplier < ActiveRecord::Migration[7.2]
  def change
    create_join_table :roles, :appliers, column_options: { null: true }
  end
end
