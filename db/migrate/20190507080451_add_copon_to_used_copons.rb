class AddCoponToUsedCopons < ActiveRecord::Migration[5.2]
  def change
    add_reference :used_copons, :copon, foreign_key: true
  end
end
