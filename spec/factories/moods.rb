FactoryBot.define do
  factory :mood do
    name { Faker::SlackEmoji.people }
    rating { Faker::Number.between(from: 1, to: 3) }
  end
end
