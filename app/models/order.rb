class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items, after_add: :track_item_added

  private

  def track_item_added(item)
    self.total = MultiplyFillTotal.new(self).multiply

    Rails.logger.debug(self.total)

     # self.total = oi.quantity * Item.find(item.id).cost
    # Rails.logger.debug("#{self.total}")
  end

end
