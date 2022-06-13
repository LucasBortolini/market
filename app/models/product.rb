class Product < ApplicationRecord
  before_save :truncate_price
  has_many :storages

  def total_storage
    storages.sum {|s| s[:quantity] }
  end

  def truncate_price
    self.price = self.price.truncate(2)
  end
end
