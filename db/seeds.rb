# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

include FactoryBot::Syntax::Methods

branches = FactoryBot.create_list(:branch, 2)

puts "Created 2 branches"

products = FactoryBot.create_list(:product, 9)
puts "Created 10 products"

branches.each do |branch|
	FactoryBot.create_list(:employee, 3, branch: branch)
  puts "Created 3 employees for branch ##{branch.id}"

  products.each do |product|
    Storage.create(branch: branch, product: product, quantity: rand(10))
    puts "Added storage for product ##{product.id} at branch ##{branch.id}"
  end
end

customers = FactoryBot.create_list(:customer, 4)
puts "Created 4 customers"

5.times do
  product = products.sample

  Order.create!({
    customer_id: customers.pluck(:id).sample,
    product_id: product.id,
    branch: branches.sample,
    employee_id: Employee.all.pluck(:id).sample,
    price: product.price
  })
end

puts "Created 5 orders"

