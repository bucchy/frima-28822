class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  # def new
  #   @purchase = Purchase.new
  # end
end
