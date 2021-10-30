class CreateCategoriesProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
    #this migration makes posible to use "has_and_belongs_to_many" method on product's and category's models
    create_join_table :categories, :products
  end
end
