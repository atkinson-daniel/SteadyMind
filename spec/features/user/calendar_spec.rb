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
    it 'I can see a calendar view of my entries', :vcr do
      expect(current_path).to eq('/dashboard')

      fill_in :entry, with: "I'm feeling great today"
      choose(id: "mood_id_#{@mood2.id}")
      click_on 'Submit'

      within(".today") do
        expect(page).to have_content "😐"
      end
    end
end
