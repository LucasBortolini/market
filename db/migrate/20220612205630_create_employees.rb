class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :pis
      t.date :admission_date
      t.string :phone
      t.string :job
      t.float :salary
      t.references :branch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
