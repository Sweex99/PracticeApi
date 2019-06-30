class RenameCountColumnToQuantity < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :count, :quantity
  end
end
