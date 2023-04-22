FactoryBot.define do
  factory :item do
    item_name           {Faker::Name.name }
    content             {Faker::Lorem.paragraph }
    category_id         {Faker::Number.between(from: 2, to: 10) }
    status_id           {Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id  {Faker::Number.between(from: 2, to: 3) }
    prefecture_id       {Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id     {Faker::Number.between(from: 2, to: 4) }
    price               {Faker::Number.between(from: 1, to: 10000) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
