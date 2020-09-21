FactoryBot.define do
  factory :item do
    # image {Faker::Name.}
    name {"山田"}
    info {"詳細"}
    category_id {3}
    condition_id {3}
    shipping_fee_id {3}
    prefecture_id {3}
    scheduled_delivery_id {3}
    price {10000}


  end
end
# price {Faker::Name.item_price}