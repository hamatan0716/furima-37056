FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 10) }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '田中' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'タナカ' }
    birth_day             { '2000-01-01' }
  end
end
