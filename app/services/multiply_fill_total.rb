class MultiplyFillTotal

  def initialize(order)
    @order = order
  end

  def multiply
    @order.items.pluck(:cost).zip(@order.order_items.pluck(:quantity)).map{|x, y| sum += x*y}
  end
end