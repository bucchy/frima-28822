FactoryBot.define do
  factory :item do
   # belongs_to :user

    name {"山田"}
    info {"詳細"}
    category_id {3}
    condition_id {3}
    shipping_fee_id {3}
    prefecture_id {3}
    scheduled_delivery_id {3}
    price {300}
    user
  
  end
end

# itemのダミーデータにおいて、どのユーザーが出品するのか教えてあげる必要があります。
# その際、factoryにもアソシエーションを設定することが可能なので、アソシエーションを定義しましょう！