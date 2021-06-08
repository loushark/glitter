FactoryBot.define do
  factory :post do
    body { Faker::Lorem.word }
    user_id { Faker::Number.number(10) }
  end
end
