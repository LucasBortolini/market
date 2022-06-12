json.extract! customer, :id, :name, :cpf, :email, :phone, :street, :number, :cep, :created_at, :updated_at
json.url customer_url(customer, format: :json)
