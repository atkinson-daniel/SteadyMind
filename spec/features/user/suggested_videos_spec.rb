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

      UserMood.create!(user: @user, mood: @mood1, created_at: Date.today - 5)
      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today - 4)
      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today - 3)
      UserMood.create!(user: @user, mood: @mood1, created_at: Date.today - 2)
      UserMood.create!(user: @user, mood: @mood1, created_at: Date.today - 1)
      UserMood.create!(user: @user, mood: @mood1, created_at: Date.today)

      click_on 'Suggested Videos'

      expect(page).to have_link "Yoga and Breathwork for Stress, Overthinking and Anxiety"
      expect(page).to have_link "Yoga for mental health - Aham Yoga | Yoga with Aru"
      expect(page).to have_link "Yoga For Anxiety and Stress"

      expect(page).to have_link "Suggested Yoga Videos"
      expect(page).to have_link "Suggested Meditation Videos"
      expect(page).to have_link "Suggested Motivational Videos"
    end
    it 'I can click Suggested Videos, and view suggested videos based on my mood (neutral)', :vcr do
      expect(current_path).to eq('/dashboard')

      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today - 5)
      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today - 4)
      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today - 3)
      UserMood.create!(user: @user, mood: @mood3, created_at: Date.today - 2)
      UserMood.create!(user: @user, mood: @mood1, created_at: Date.today - 1)
      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today)

      click_on 'Suggested Videos'

      expect(page).to have_link "UnWind Yoga Flow and Meditation | Faith Hunter"
      expect(page).to have_link "20 min Full Body STRETCH/YOGA for STRESS & ANXIETY Relief"
      expect(page).to have_link "Yoga Flow to Boost Energy"

      expect(page).to have_link "Suggested Yoga Videos"
      expect(page).to have_link "Suggested Meditation Videos"
      expect(page).to have_link "Suggested Motivational Videos"
    end

    it 'I can click Suggested Videos, and view suggested videos based on my mood (happy)', :vcr do
      expect(current_path).to eq('/dashboard')

      UserMood.create!(user: @user, mood: @mood3, created_at: Date.today - 5)
      UserMood.create!(user: @user, mood: @mood3, created_at: Date.today - 4)
      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today - 3)
      UserMood.create!(user: @user, mood: @mood1, created_at: Date.today - 2)
      UserMood.create!(user: @user, mood: @mood3, created_at: Date.today - 1)
      UserMood.create!(user: @user, mood: @mood3, created_at: Date.today)
      click_on 'Suggested Videos'

      expect(page).to have_link "15 Minutes Morning Yoga | Aham Yoga | Yoga with Aru"
      expect(page).to have_link "Ashtanga Fundamentals | 20 minutes class | Laruga Glaser"
      expect(page).to have_link "20-Min Energizing Morning Yoga"

      expect(page).to have_link "Suggested Yoga Videos"
      expect(page).to have_link "Suggested Meditation Videos"
      expect(page).to have_link "Suggested Motivational Videos"
    end

    it 'I can click Suggested Videos but I have not logged my mood', :vcr do
      expect(current_path).to eq('/dashboard')

      click_on 'Suggested Videos'

      expect(page).to have_content "No video to display"
    end

end
