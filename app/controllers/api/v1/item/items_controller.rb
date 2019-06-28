class Api::V1::Item::ItemsController < ApplicationController
  def_param_group :item do
    param :item, Hash do
      param :name, String, 'Item`s Name'
      param :description, String, 'Item`s Description'
      param :department, String, 'Item`s Department'
      param :cost, Integer, 'Item`s Price'
    end
  end


  api :GET, '/v1/item/items', 'Method Index. Display all Items'
  def index
    @order = ::Item.all

    render json: @order.first(100)
  end

  def edit
  end


  def new
    @item = ::Item.new
  end

  api :POST, '/v1/item/items', 'Create new Item'
  param_group :item
  def create
    @item = ::Item.create(item_params)

    if @item.save
      render json: @item, status: :created
    end
  end

  api :GET, '/v1/item/items/:id', 'Show one Item'
  def show
    @item = Item.find(params[:id])
  end

  api :DELETE, "/v1/item/items/:id", "Destroy Item"
  def destroy
    @join.destroy

    render json: @join, status: destroyed
  end


  api :PUT, '/v1/item/items/:id', 'Method Create'
  param_group :item
  def update
    @item.update(item_params)
    render json: @item, status: updated
  end

  private

  def item_params
    params.require(:item).permit(:name, :department, :description, :cost)
  end
end


