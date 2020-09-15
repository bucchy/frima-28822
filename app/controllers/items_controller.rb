class ItemsController < ApplicationController
  #before_action: :redirect_top only:[:new, :create]

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  private

   def redirect_top
    unless user_signed_in? 
      redirect_to root_path
     end

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
      params.require(:item).permit(:title, :text, :genre_id, :condition_id, :shippingfee_id, :price)
      params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
    end

    

  end
