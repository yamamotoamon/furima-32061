FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    shipping_area_id { 3 }
    municipality { '名古屋市' }
    address { '1-1' }
    building { '名古屋ビル' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 2 }
    item_id { 2 }
  end
end