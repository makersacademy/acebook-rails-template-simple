FactoryBot.define do
  factory :post do
    user_id nil
    content { Faker::String.random(length: 50)}
  end
end