require 'rails_helper'

RSpec.describe 'As a user', :vcr do
  describe 'when I login'
    before do
      @mood1 = Mood.create(name: 'worried', rating: 1)
      @mood2 = Mood.create(name: 'neutral_face', rating: 2)
      @mood3 = Mood.create(name: 'smile', rating: 3)

      stub_omniauth
      visit '/login'
      click_on 'Sign In With Google'

      @user = User.last
    end
    it 'I can click on stats, and view a calendar view of my enteries' do
      expect(current_path).to eq('/dashboard')

      UserMood.create!(user: @user, mood: @mood2, created_at: Date.today)

      click_on 'My Profile'

      within(".today") do
        expect(page).to have_content "😐"
      end
    end
end
