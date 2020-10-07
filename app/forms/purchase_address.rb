class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :street_address, :phone_number, :postal_code, :prefecture_id, :city, :building_name, :purchase_id, :token, :item_id, :user_id, :users_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city, presence: true
    validates :street_address, presence: true
    validates :phone_number, presence: true
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'is invalid. Ixclude hyphen(-)' }
    validates :phone_number, length: { maximum: 11, message: "is invalid. within 11 digits"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(street_address: street_address, phone_number: phone_number, postal_code: postal_code, prefecture_id: prefecture_id, city: city, building_name: building_name, purchase_id: purchase.id)
  end
end


