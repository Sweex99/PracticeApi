class Api::V1::Order::OrdersController < ApplicationController
  def_param_group :order do
    param :order, Hash do
      param :user_id, Integer, 'asd'
      param :priority, String, 'asd'
      param :description, String, 'asd'
      param :item_id, Integer, 'asd'
    end
  end

  api :GET, '/v1/order/orders', 'Method Index. Display all Orders'
  def index
    @order = ::Order.all

    render json: @order
  end


  def new
    @order = ::Order.new()
  end


  api :POST, '/v1/order/orders', 'Create new Order'
  param_group :order
  def create
    @order = ::Order.create(user_id: params[:order][:user_id], priority: params[:order][:priority], description: params[:order][:description])
    @order << Item.find(item_id: params[:order][:item_id])

    render json: @order, status: :created
  end


  api :GET, '/v1/order/orders/:id', 'Method Show. Display Order'
  def show
    @order = Order.find(params[:id])
  end


  api :DELETE, "/v1/order/orders/:id", "Destroy Order"
  def destroy
    @order.destroy

    render json: @order, status: destroyed
  end


  api :PUT, "/v1/order/orders/:id", "Update Order"
  param_group :order
  def update
    @order.update(user_id: params[:order][:user_id], priority: params[:order][:priority], description: params[:order][:description])
    render json: @order, status: updated
  end

end
