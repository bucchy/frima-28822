class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  # ３activehashのモデルのアソシエーションを上記を参考に全てこちらに記載してください
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: "is out of setting range"}
  
  validates :name, presence: true
  validates :info, presence: true #{ greater_than_or_equal_to: 1, less_than_or_equal_to: 1000000, message: "is out of setting range"}
  validates :price, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :scheduled_delivery_id, presence: true
  
  # １ // マイグレーションファイルのカラム名とモデルのバリデーションのカラム名を一致させましょう
  # ２# モデルの名前とカラム名を一致させましょう(モデル名にidの記述は不要です) genre → categoryに変更
end