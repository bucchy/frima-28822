class PurchasesController < ApplicationController

  def new
    @purchases = Puchases.new
  end

  def index
    @item = Item.find(params[:item_id])
  end
end
