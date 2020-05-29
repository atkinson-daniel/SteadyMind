FactoryBot.define do
  factory :user do
    name { Faker::FunnyName.name }
    email { Faker::Internet.email  }
    uid { Faker::Number.number(digits: 10) }
  end
end
