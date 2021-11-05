class Product < ApplicationRecord
  has_many :categorizations
  has_many :categories, through: :categorizations
  
  validates :name, presence: true
end
