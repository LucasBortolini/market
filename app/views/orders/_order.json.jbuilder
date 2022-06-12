json.extract! order, :id, :customer_id, :product_id, :employee_id, :price, :created_at, :updated_at
json.url order_url(order, format: :json)
