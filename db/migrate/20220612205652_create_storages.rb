class CreateStorages < ActiveRecord::Migration[7.0]
  def change
    create_table :storages do |t|
      t.references :branch, null: false, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
