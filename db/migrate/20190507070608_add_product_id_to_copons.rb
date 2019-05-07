class AddProductIdToCopons < ActiveRecord::Migration[5.2]
  def change
    add_reference :copons, :product, foreign_key: true
  end
end
