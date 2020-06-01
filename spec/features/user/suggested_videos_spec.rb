require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit my dashboard'
    before do
      @mood1 = Mood.create(name: 'worried', rating: 1)
      @mood2 = Mood.create(name: 'neutral_face', rating: 2)
      @mood3 = Mood.create(name: 'smile', rating: 3)

      stub_omniauth
      visit '/login'
      click_on 'Sign In With Google'

      @user = User.last
    end
    it 'I can click Suggested Videos, and view suggested videos based on my mood (sad)', :vcr do
      expect(current_path).to eq('/dashboard')

      UserMood.create!(user: @user, mood: @mood2, created_at: 'Tue 26 Feb 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood2, created_at: 'Tue 26 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood2, created_at: 'Wed 27 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood1, created_at: 'Thu 28 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood1, created_at: 'Fri 29 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood1, created_at: 'Sat 30 May 2020 21:21:12 UTC +00:00')

      click_on 'Suggested Videos'

      expect(page).to have_link "20 Minute Relaxation Yoga"
      expect(page).to have_link "Meditate With Your Plants!"
      expect(page).to have_link "Inspirational and Sensational"

      expect(page).to have_link "All Yoga Videos"
      expect(page).to have_link "All Meditation Videos"
      expect(page).to have_link "All Motivational Videos"
    end
    it 'I can click Suggested Videos, and view suggested videos based on my mood (neutral)', :vcr do
      expect(current_path).to eq('/dashboard')

      UserMood.create!(user: @user, mood: @mood2, created_at: 'Tue 26 Feb 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood2, created_at: 'Tue 26 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood2, created_at: 'Wed 27 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood2, created_at: 'Thu 28 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood3, created_at: 'Fri 29 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood1, created_at: 'Sat 30 May 2020 21:21:12 UTC +00:00')

      click_on 'Suggested Videos'

      expect(page).to have_link "Day 17 - Happiness Boost Yoga - 30 Days of Yoga"
      expect(page).to have_link "How To Be Happy - Motivational Speech"
      expect(page).to have_link "Joy Meditation (Strengthen Happiness)"

      expect(page).to have_link "All Yoga Videos"
      expect(page).to have_link "All Meditation Videos"
      expect(page).to have_link "All Motivational Videos"
    end
    it 'I can click Suggested Videos, and view suggested videos based on my mood (happy)', :vcr do
      expect(current_path).to eq('/dashboard')

      UserMood.create!(user: @user, mood: @mood3, created_at: 'Tue 26 Feb 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood3, created_at: 'Tue 26 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood3, created_at: 'Wed 27 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood2, created_at: 'Thu 28 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood1, created_at: 'Fri 29 May 2020 21:21:12 UTC +00:00')
      UserMood.create!(user: @user, mood: @mood3, created_at: 'Sat 30 May 2020 21:21:12 UTC +00:00')

      click_on 'Suggested Videos'

      expect(page).to have_link "How To Maintain Happiness"
      expect(page).to have_link "Yoga & You: How to stay happy?"
      expect(page).to have_link "Secret To Become Mentally Strong"

      expect(page).to have_link "All Yoga Videos"
      expect(page).to have_link "All Meditation Videos"
      expect(page).to have_link "All Motivational Videos"
    end
    it 'I can click Suggested Videos but I have not logged my mood', :vcr do
      expect(current_path).to eq('/dashboard')

      click_on 'Suggested Videos'

      expect(page).to have_content "No video to display"
    end

end
