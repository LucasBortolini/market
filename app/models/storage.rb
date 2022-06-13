class Storage < ApplicationRecord
  belongs_to :branch
  belongs_to :product

  default_scope { order(product_id: :asc) }
end
