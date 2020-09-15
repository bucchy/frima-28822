class Item < ApplicationRecord

  belongs_to :user
  has_one    :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :title, :text, :genre, presence: true
  validates :genre_id, numericality: { other_than: 1 } 

  #root to: 'items#index'
  #resources :items

end
