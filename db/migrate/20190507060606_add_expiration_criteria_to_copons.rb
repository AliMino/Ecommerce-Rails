class AddExpirationCriteriaToCopons < ActiveRecord::Migration[5.2]
  def change
    add_column :copons, :associative, :integer
  end
end
