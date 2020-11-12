FactoryBot.define do
  factory :item do
    name { Faker::Lorem.words }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_id { 2 }
    region_id { 2 }
    delivery_id { 2 }
    price { 5000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
