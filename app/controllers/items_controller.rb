class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

 private
  def item_params
    params.require(:item).permit(:name, :category, :image, :text, :status, :burden, :shipping_origin, :shipping_day, :price)
  end
end
