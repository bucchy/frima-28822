FactoryBot.define do
  factory :item do
    name { '山田' }
    info { '詳細' }
    category_id { 3 }
    condition_id { 3 }
    shipping_fee_id { 3 }
    prefecture_id { 3 }
    scheduled_delivery_id { 3 }
    price { 300 }
    user
  end
end
