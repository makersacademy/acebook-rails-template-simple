FactoryBot.define do
  factory :user do
    forename { Faker::Name.first_name }
    surname { Faker::Name.last_name }
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password_digest { Faker::Internet.password }
    profilePic  { Faker::Lorem.word }
  end
end

# # Usage:
# # Faker::<generator>.unique.exclude(method, arguments, list)

# # Add 'azerty' and 'wxcvbn' to the string generator with 6 char length

# # Faker::Lorem.unique.exclude :string, [number: 6], %w[azerty wxcvbn]
