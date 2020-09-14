class ItemsController < ApplicationController
  #before_action: :redirect_top only:[:new, :create]

  def index
    
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
  end
