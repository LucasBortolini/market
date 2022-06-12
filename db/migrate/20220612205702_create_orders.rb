class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
