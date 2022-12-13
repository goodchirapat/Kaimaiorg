class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.float :price
      t.integer :qty
      t.references :buyer
      t.references :seller
      t.references :item
      t.timestamps
    end
    add_foreign_key :inventories, :users, column: :buyer_id, primary_key: :id
    add_foreign_key :inventories, :users, column: :seller_id, primary_key: :id
    add_foreign_key :inventories, :items, column: :item_id, primary_key: :id
  end
end
