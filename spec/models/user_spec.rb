require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :uid}
  end

  describe 'class methods' do
    it '.from_omniauth' do
      auth_info = {
        email: 'steve@example.com',
        given_name: 'Bob',
        sub: '923987239724972'
      }

      expect(User.from_omniauth(auth_info)).to eq(User.last)
    end
    it '.mood_query' do
      user = create(:user)
      mood1 = Mood.create(name: 'worried', rating: 1)
      mood2 = Mood.create(name: 'neutral_face', rating: 2)
      mood3 = Mood.create(name: 'smile', rating: 3)
      mood_entry1 = UserMood.create(user_id: user.id, mood_id: mood1.id, created_at: 'Tue 26 May 2020 21:21:12 UTC +00:00', updated_at: 'Tue 26 May 2020 21:21:12 UTC +00:00')
      mood_entry2 = UserMood.create(user_id: user.id, mood_id: mood2.id, created_at: 'Wed 27 May 2020 21:21:12 UTC +00:00', updated_at: 'Wed 27 May 2020 21:21:12 UTC +00:00')
      mood_entry3 = UserMood.create(user_id: user.id, mood_id: mood3.id, created_at: 'Thu 28 May 2020 21:21:12 UTC +00:00', updated_at: 'Thu 28 May 2020 21:21:12 UTC +00:00')
      mood_entry4 = UserMood.create(user_id: user.id, mood_id: mood3.id, created_at: 'Fri 29 May 2020 21:21:12 UTC +00:00', updated_at: 'Fri 29 May 2020 21:21:12 UTC +00:00')
      mood_entry5 = UserMood.create(user_id: user.id, mood_id: mood3.id, created_at: 'Sat 30 May 2020 21:21:12 UTC +00:00', updated_at: 'Sat 30 May 2020 21:21:12 UTC +00:00')
      expect(user.mood_query).to eq({"neutral_face"=>1, "smile"=>3, "worried"=>1})
    end
  end

  describe 'instance methods' do
    it '#logged_mood?' do
      user = create(:user)
      mood = create(:mood)
      expect(user.logged_mood?).to eq false
      UserMood.create(user: user, mood: mood)
      expect(user.logged_mood?).to eq true
    end
    it '#mood_entry' do
      user = create(:user)
      mood = create(:mood)
      UserMood.create(user: user, mood: mood)
      expect(user.mood_entry.user_id).to eq user.id
      expect(user.mood_entry.mood_id).to eq mood.id
    end
  end
end
