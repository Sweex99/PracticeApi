class Item < ApplicationRecord
  has_many :order_items
  has_many :orders, through: :order_items, after_remove: :al



  def al(item)
    #self.total = self.order_items.
    puts "Success #{item.id}"
  end
end
