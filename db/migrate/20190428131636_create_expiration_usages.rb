class CreateExpirationUsages < ActiveRecord::Migration[5.2]
  def change
    create_table :expiration_usages do |t|
      t.integer :usage

      t.timestamps
    end
  end
end
