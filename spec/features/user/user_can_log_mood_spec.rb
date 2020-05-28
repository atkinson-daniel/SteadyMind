require 'rails_helper'

RSpec.describe 'As a user' do
  it 'once logged in, I\'m redirected to a page where I can log my mood.' do
    visit user_dashboard_index_path

    expect(page).to have_content 'Please share your mood today to see your profile. You can always edit it later.'

    choose(option: 'happy')
    click_on 'Submit'

    mood_entry = MoodLog.last
    expect(mood_entry.user_id).to eq 1
    expect(mood_entry.mood_id).to eq 3
  end
end


