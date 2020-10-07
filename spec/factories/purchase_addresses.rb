FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { Faker::Address.city_suffix }
    street_address { Faker::Address.street_suffix }
    phone_number { '09012345678' }
  end
end
