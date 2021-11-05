class CreateCategorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizations do |t|
      t.belongs_to :category, index: true
      t.belongs_to :product, index: true
      t.datetime :categorization_date
      t.timestamps
    end
  end
end
