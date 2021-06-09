FactoryBot.define do
  factory :post do
    body { Faker::Lorem.word }
    user_id { 1 }
  end
end
