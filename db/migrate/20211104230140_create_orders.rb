class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: false do |t|
      t.integer :department_id
      t.string :description, size: 10
      t.datetime :created_at
    end
    add_column :orders, :autoincrement_primary_key, :primary_key
    add_index :orders, :description, using: 'btree'
  end
end
