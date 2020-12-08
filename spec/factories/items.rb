FactoryBot.define do
  factory :item do
    association :user
    item_name          {"犬"}
    explanation        {"白色の犬"}
    category_id        {2}
    status_id          {2}
    delivery_id        {2}
    shipping_area_id   {2}
    shipping_day_id    {2}
    price              {10000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
