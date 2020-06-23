require 'rails_helper'

describe "User Moods" do
  it "can return a specific user mood entry" do
    mood1 = Mood.create(name: 'worried', rating: 1)
    mood2 = Mood.create(name: 'neutral_face', rating: 2)
    mood3 = Mood.create(name: 'smile', rating: 3)

    user = User.create!(name: 'Tj', email: 'tj@example.com', uid: '12345')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    UserMood.create!(user: user, mood: mood1, created_at: Date.today - 5)
    UserMood.create!(user: user, mood: mood2, created_at: Date.today - 4)
    UserMood.create!(user: user, mood: mood2, created_at: Date.today - 3)
    UserMood.create!(user: user, mood: mood1, created_at: Date.today - 2)
    mood_day = UserMood.create!(user: user, mood: mood1, created_at: Date.today - 1, entry: 'sad')
    UserMood.create!(user: user, mood: mood1, created_at: Date.today)

    get "/user_moods?date=#{mood_day.created_at}"

    resp = JSON.parse(response.body)
    user_moods = resp['data']

    expect(response).to be_success
    expect(user_moods['attributes']['entry']).to eq(mood_day.entry)
  end
end
