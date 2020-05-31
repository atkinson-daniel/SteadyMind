require 'rails_helper'

RSpec.describe 'As a user' do
  describe "When I'm on the dashboard page, I can click the all resources button" do
    it 'I should see an embedded youtube video with links to see all yoga, meditation, and motivational videos' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_link 'All Resources'

      expect(current_path).to eq('/all_resources/yoga')
      expect(page).to have_content('All Resources')
      expect(page).to have_link('All Yoga Videos')
      expect(page).to have_link('All Meditiation Videos')
      expect(page).to have_link('All Motivational Videos')
      expect(page).to have_css('#player')
    end

    it 'I can see all yoga videos' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_link 'All Resources'

      click_link('All Yoga Videos')
      expect(current_path).to eq('/all_resources/yoga')
      expect(first('.video-links').text).to_not be_empty
    end

    it 'I can also see an aside with links to external resources' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_link 'All Resources'

      expect(page).to have_content('External Resources')
      within('.external-resources') do
        expect(page).to have_link('National Suicide Prevention Lifeline')
        expect(page).to have_link('Find a Therapist Near You')
        expect(page).to have_link('Yoga Classes Near You')
      end
    end
  end
end
