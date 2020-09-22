class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, message: "is out of setting range"}
  validates :price, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: true
  validates :image, presence: true
end