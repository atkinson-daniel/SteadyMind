require 'rails_helper'

RSpec.describe 'As a user', :vcr do
  before do
    @mood1 = Mood.create(name: 'worried')
    @mood2 = Mood.create(name: 'neutral_face')
    @mood3 = Mood.create(name: 'smile')
  end
  it 'once logged in, I\'m redirected to a page where I can log my mood.' do
    stub_omniauth

    visit '/login'

    click_on 'Sign In With Google'
    user = User.last

    expect(current_path).to eq('/dashboard')

    expect(page).to have_content 'Please share your mood today to see your profile. You can always edit it later.'
    click_on 'Submit'

    expect(page).to have_content 'There was an error!'

    choose(id: "mood_id_#{@mood3.id}")
    click_on 'Submit'

    mood_entry = UserMood.last
    expect(mood_entry.user_id).to eq user.id
    expect(mood_entry.mood_id).to eq @mood3.id
  end
  it 'if I already logged a mood, I can edit the mood from my dashboard.', :vcr do
    stub_omniauth

    visit '/login'

    click_on 'Sign In With Google'
    user = User.last

    expect(current_path).to eq('/dashboard')

    choose(id: "mood_id_#{@mood2.id}")
    click_on 'Submit'

    mood_entry = UserMood.last
    expect(mood_entry.user_id).to eq user.id
    expect(mood_entry.mood_id).to eq @mood2.id

    expect(page).to have_content 'Edit Mood'
    choose(id: "mood_id_#{@mood1.id}")
    click_on 'Save'

    mood_entry.reload
    expect(page).to have_content 'Emancipate yourself from mental slavery, none but ourselves can free our mind.'
    expect(page).to have_content 'Welcome, ' + user.name
    expect(mood_entry.user_id).to eq user.id
    expect(mood_entry.mood_id).to eq @mood1.id
  end
end
