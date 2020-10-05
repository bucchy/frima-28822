class OrdersController < ApplicationController

  def index
    @purchases = PurchaseAddress.new
    @item = Item.find(params[:item_id])#.user.id.to_i == current_user.id 
  end

  def new
    @purchases = Purchase.new
  end

  def create
    @purchases = PurchaseAddress.new(order_params)
    @item = Item.find(params[:item_id])

    if @purchases.valid?
      pay_item
      @purchases.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:street_address, :phone_number, :postal_code, :prefecture_id, :city, :building_name, :purchase_id, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end