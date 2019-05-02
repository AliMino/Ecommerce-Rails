class DropOrderState < ActiveRecord::Migration[5.2]
  def change
    drop_table :order_states
  end
end
