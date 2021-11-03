FactoryBot.define do
  factory :item do
    name                 { Faker::Lorem.word }
    introduction         { Faker::Lorem.characters }
    category_id          { Faker::Number.rand(2..11) }
    status_id            { Faker::Number.rand(2..7) }
    delivery_fee_id      { Faker::Number.rand(2..3) }
    delivery_source_id   { Faker::Number.rand(2..48) }
    until_delivery_id    { Faker::Number.rand(2..4) }
    price                { Faker::Number.rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
