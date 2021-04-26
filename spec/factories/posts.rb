FactoryBot.define do
  factory :post do
    user_id { 1 }
    content { Faker::Lorem.sentence(word_count: 10)}
  end
end