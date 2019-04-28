class CreateUsedCopons < ActiveRecord::Migration[5.2]
  def change
    create_table :used_copons do |t|

      t.timestamps
    end
  end
end
