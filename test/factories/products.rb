FactoryBot.define do
  factory :product do
    name { FFaker::Product.product_name }
    brand { FFaker::Product.brand }
    sku { FFaker::Product.model }
    price { rand(10.0..100.0) }
  end
end