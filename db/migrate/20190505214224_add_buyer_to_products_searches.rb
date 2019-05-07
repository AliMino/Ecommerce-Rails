class AddBuyerToProductsSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :products_searches, :user_id, :integer
  end
end
