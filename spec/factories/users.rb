word = Faker::Internet.password

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    password { word }
    password_confirmation { word }
  end
end