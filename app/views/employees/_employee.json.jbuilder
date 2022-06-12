json.extract! employee, :id, :name, :pis, :admission_date, :phone, :sector, :payment, :branch_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
