class Storage < ApplicationRecord
  belongs_to :branch
  belongs_to :product
end
