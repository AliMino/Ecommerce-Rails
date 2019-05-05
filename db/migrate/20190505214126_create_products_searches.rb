class CreateProductsSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :products_searches do |t|
      t.float :min_price
      t.float :max_price
      t.string :category
      t.string :brand
      t.string :seller

      t.timestamps
    end
  end
end
