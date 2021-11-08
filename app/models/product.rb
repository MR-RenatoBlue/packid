class Product < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  
  validates :name, :description, :price, :categories, presence: true
end
