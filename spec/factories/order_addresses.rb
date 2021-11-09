FactoryBot.define do
  factory :order_address do
    postcode         { '123-1234' }
    prefecture_id    { rand(2..48)}
    city             { '福岡市' }
    block            { '天神1−1−1' }
    building         { 'sampleビル' }
    phone_number     { '1234567890' }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
