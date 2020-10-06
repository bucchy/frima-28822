class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :street_address, :phone_number, :postal_code, :prefecture_id, :city, :building_name, :purchase_id, :created_at, :updated_at, :token, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

    #   validates :street_address, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    #   validates :phone_number, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."}
  end
  def save
    purchase = Purchase.create!(user_id: user_id, item_id: item_id)
    Address.create(street_address: street_address, phone_number: phone_number, postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_name: building_name, created_at: created_at, updated_at: updated_at, purchase_id: purchase.id)
  end
end