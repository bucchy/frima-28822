class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchases = PurchaseAddress.new
    redirect_to root_url unless @item.purchase.nil?
    redirect_to root_url if @item.user_id == current_user.id
  end

  def create
    @purchases = PurchaseAddress.new(order_params)

    if @purchases.valid?
      pay_item
      @purchases.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:street_address, :phone_number, :postal_code, :prefecture_id, :city, :building_name, :purchase_id, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
