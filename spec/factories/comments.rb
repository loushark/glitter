FactoryBot.define do
  factory :comment do
    message { "A random comment, hello!" }
    user_id { 1 }
    post_id { 1 }
  end
end
