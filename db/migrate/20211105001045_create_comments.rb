class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, id: false do |t|
      t.integer :order_id
      t.string :description, size: 10
    end
    add_index :comments, :order_id, using: 'hash'
    add_column :comments, :autoincrement_primary_key, :primary_key
  end
end
