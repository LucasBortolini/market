class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cpf, unique: true
      t.string :email
      t.integer :phone
      t.string :street
      t.integer :number
      t.integer :cep

      t.timestamps
    end
  end
end
