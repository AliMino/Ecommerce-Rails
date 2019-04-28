class CreateExpirationDates < ActiveRecord::Migration[5.2]
  def change
    create_table :expiration_dates do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
