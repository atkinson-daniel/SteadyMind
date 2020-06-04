require 'rails_helper'

RSpec.describe 'As a user' do
  describe "When I'm on the dashboard page, I can click the all resources button" do
    it 'I should see an embedded youtube video with links to see all yoga, meditation, and motivational videos', :vcr do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_link 'All Resources'

      expect(current_path).to eq('/all_resources')
      expect(page).to have_selector 'h2', text: 'All Yoga Videos'
      expect(page).to have_link('All Yoga Videos')
      expect(page).to have_link('All Meditation Videos')
      expect(page).to have_link('All Motivational Videos')
      expect(page).to have_css('#player')
    end

    it 'I can see all yoga videos', :vcr do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_link 'All Resources'

      click_link('All Yoga Videos')
      expect(page).to have_current_path(all_resources_path(category: 'yoga'))
      expect(first('.video-links').text).to_not be_empty
    end

    it 'I can see all meditation videos', :vcr do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_link 'All Resources'

      click_link('All Meditation Videos')
      expect(page).to have_current_path(all_resources_path(category: 'meditation'))
      expect(page).to have_selector 'h2', text: 'All Meditation Videos'
      expect(first('.video-links').text).to_not be_empty
    end

    it 'I can see all meditation videos', :vcr do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/dashboard'
      click_link 'All Resources'

      click_link('All Motivational Videos')
      expect(page).to have_current_path(all_resources_path(category: 'motivational'))
      expect(page).to have_selector 'h2', text: 'All Motivational Videos'
      expect(first('.video-links').text).to_not be_empty
    end

    it 'Can play a different video in the playlist', :vcr do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      expected_video_id = 'hJbRpHZr_d0'

      visit '/dashboard'
      click_link 'All Resources'
      click_link 'Yoga For Anxiety and Stress'
      expect(current_url).to include(expected_video_id)
      expect(current_url).to include('yoga')
    end

    it 'I can also see an aside with links to external resources', :vcr do
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
