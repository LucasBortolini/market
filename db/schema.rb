# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_12_205702) do
  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.integer "phone"
    t.string "street"
    t.integer "number"
    t.integer "cep"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "pis"
    t.date "admission_date"
    t.string "phone"
    t.string "job"
    t.float "salary"
    t.integer "branch_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_employees_on_branch_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "product_id", null: false
    t.integer "employee_id", null: false
    t.integer "branch_id", null: false
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_orders_on_branch_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["employee_id"], name: "index_orders_on_employee_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "brand"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storages", force: :cascade do |t|
    t.integer "branch_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id", "product_id"], name: "index_storages_on_branch_id_and_product_id", unique: true
    t.index ["branch_id"], name: "index_storages_on_branch_id"
    t.index ["product_id"], name: "index_storages_on_product_id"
  end

  add_foreign_key "employees", "branches"
  add_foreign_key "orders", "branches"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "employees"
  add_foreign_key "orders", "products"
  add_foreign_key "storages", "branches"
  add_foreign_key "storages", "products"
end
