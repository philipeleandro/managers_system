class ChangeStatusIdToStatus < ActiveRecord::Migration[7.2]
  def change

    change_column(:hirers, :status_id, :string, :default => :active, null: false)
    rename_column(:hirers, :status_id, :status)
  end
end
