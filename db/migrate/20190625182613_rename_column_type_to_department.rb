class RenameColumnTypeToDepartment < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :type, :department
  end
end
