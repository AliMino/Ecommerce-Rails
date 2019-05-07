class AddUserToUsedCopons < ActiveRecord::Migration[5.2]
  def change
    add_reference :used_copons, :user, foreign_key: true
  end
end
