class CategoryProducts < ApplicationRecord
  belongs_to :category
  belongs_to :products

end
