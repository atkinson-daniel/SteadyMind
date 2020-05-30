FactoryBot.define do
  factory :mood do
    name { Faker::SlackEmoji.people }
  end
end
