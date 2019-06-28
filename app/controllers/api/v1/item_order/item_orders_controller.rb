class Api::V1::ItemOrder::ItemOrdersController < ApplicationController
  def_param_group :order_item do
    param :order_item, Hash do
      param :order_id, Integer, 'Foreign key with Order Model'
      param :item_id, Integer, 'Foreign key with Item Model'
    end
  end


  api :GET, '/v1/item_order/item_orders', 'Method Index. Display all Orders'
  def index
    @oi = ::OrderItem.all

    render json: @oi
  end

  def new
    @oi = ::OrderItem.new()
  end

  api :POST, '/v1/item_order/item_orders', 'Create methods'
  param_group :order_item
  def create
    @oi = ::OrderItem.create(order_params)

    render json: @oi, status: :created
  end

  api :GET, '/v1/item_order/item_orders/:id', 'Method Show. Display ItemOrder'
  def show
    @oi = OrderItem.find(params[:id])
  end

  api :DELETE, "/v1/item_order/item_orders/:id", "Destroy ItemOrder"
  def destroy
    @oi.destroy

    render json: @oi, status: destroyed
  end

  api :PUT, "/v1/item_order/item_orders/:id", "Update ItemOrder"
  param_group :order_item
  def update
    @oi.update(item_params)
    render json: @oi, status: updated
  end

  private

  def order_params
    params.require(:order_item).permit(:priority, :description)
  end

end
