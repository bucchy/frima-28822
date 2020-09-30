class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def new
    @purchase = Purchase.new
  end

  



end