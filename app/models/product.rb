class Product < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  
  validates :name, :description, :categories, presence: true
  validates :price, presence: true, numericality: true
end
