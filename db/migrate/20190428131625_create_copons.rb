class CreateCopons < ActiveRecord::Migration[5.2]
  def change
    create_table :copons do |t|
      t.boolean :has_fixed_amount
      t.integer :discount
      t.integer :expiration_type

      t.timestamps
    end
  end
end
