class Purchase < ApplicationRecord
  
  belongs_to :item
  belongs_to :user
  belongs_to :address

  # def new
  #   @purchase = Purchase.new
  # end

end