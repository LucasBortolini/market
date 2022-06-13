class Product < ApplicationRecord
  has_many :storages

  def total_storage
    storages.sum {|s| s[:quantity] }
  end
end
