class PurchaseController < ApplicationController
  before_action :set_purchase, only: [:index, :new]
  before_action :move_to_sign_in
  before_action :set_item
  before_action :move_to_top
  def index
  end

  def new  
  end

  def create
    # @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.permit(:postal, :genre_id, :city, :house_num, :building, :phone, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵 331f27c1e15a0c1e062a9e38
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_purchase
    @purchase =PurchaseAddress.new
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
  
  def move_to_top
    @item = Item.find(params[:item_id])
    unless @item.purchase == nil
      redirect_to  controller: :items, action: :index
    end
  end
  def set_item
    @item = Item.find(params[:item_id])
  end   
end
