class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit]
  before_action :set_item, only:[:show, :edit, :destroy, :update]
  before_action :baria_user, only: [:edit, :destroy, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

 def show

 end

 def edit

 end

 def baria_user
  unless 
   Item.find(params[:id]).user.id.to_i == current_user.id 
   redirect_to items_path(current_user)
  end
 end

 def update
  if @item.update(item_params)
    redirect_to root_path
  else
    render :show
  end
 end

 def destroy
  @item.destroy
  redirect_to items_path
 end

  private

 def item_params
   params.require(:item).permit(:image, :name, :price, :category_id, :condition_id, :user_id, :info, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
 end

 def set_item
    @item = Item.find(params[:id])
 end

end