class CreateClients < ActiveRecord::Migration[7.2]
  def change
    create_table :hiers do |t|
      t.string :name, null: false
      t.string :company_name, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :cpf, null: false
      t.string :cnpj
      t.integer :status_id, null: false, default: 0

      t.timestamps
    end
  end
end
