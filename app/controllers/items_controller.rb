class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index,]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'items/new'
    end
  end

 private
  def item_params
    params.require(:item).permit(:name, :category_id, :image, :text, :status_id, :burden_id, :shipping_origin_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
end
