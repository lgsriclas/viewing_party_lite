FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
  end
end