class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  #金額設定用
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}

  #root to: 'items#index'
  #resources :items
  
end
