class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  #３つのコードを１つにしてpriceを追加
  def item_params
  # params.require(:item).permit(:title, :text, :genre_id, :condition_id, :shippingfee_id, :price)
  # params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  params.require(:item).permit(:name, :price, :category_id, :condition_id, :user_id, :info, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end

    

end