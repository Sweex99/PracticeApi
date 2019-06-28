class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :priority
      t.text :description
      t.integer :order_item_id
      t.decimal :total

      t.timestamps
    end
    create_table :items do |t|
      t.string :name
      t.string :type
      t.integer :order_item
      t.text :description
      t.decimal :cost

      t.timestamps
    end
    create_table :order_items do |t|
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true
      t.integer :count

      t.timestamps
    end
  end
end
