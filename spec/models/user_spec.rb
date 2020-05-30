require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :name}
    it {should validate_presence_of :uid}
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
