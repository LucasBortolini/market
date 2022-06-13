class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :product
  belongs_to :employee
  belongs_to :branch

  after_create :update_storage

  private

  def update_storage
    storage = Storage.find_by({ product_id: self.product.id, branch_id: self.branch.id })
    storage.update!({ quantity: storage.quantity - 1 })
  end
end
