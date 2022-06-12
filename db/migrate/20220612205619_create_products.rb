class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :brand
      t.string :sku
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
