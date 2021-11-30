FactoryBot.define do
  factory :party do
    movie_title { Faker::Movie.title }
    start_time { Faker::Time.forward(days: 7, period: :evening) }
    start_date { Faker::Time.forward(days: 7, period: :evening) }
    duration { Faker::Number.number(from: 80, to: 180) }
    user_id { nil }
  end
end