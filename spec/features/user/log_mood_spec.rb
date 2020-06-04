require 'rails_helper'

RSpec.describe 'As a user', :vcr do
  before do
    @mood1 = Mood.create(name: 'worried', rating: 1)
    @mood2 = Mood.create(name: 'neutral_face', rating: 2)
    @mood3 = Mood.create(name: 'smile', rating: 3)
  end
  it 'once logged in, I\'m redirected to a page where I can log my mood.', :vcr do
    stub_omniauth

    visit '/'

    click_on 'signing in'
    user = User.last

    expect(current_path).to eq('/dashboard')

    click_on 'Submit'

    expect(page).to have_content 'There was an error!'

    fill_in :entry, with: "I'm feeling great today"
    choose(id: "mood_id_#{@mood3.id}")
    click_on 'Submit'

    mood_entry = UserMood.last
    expect(mood_entry.user_id).to eq user.id
    expect(mood_entry.mood_id).to eq @mood3.id
    expect(mood_entry.entry).to eq "I'm feeling great today"
  end
  it 'if I already logged a mood, I can edit the mood from my dashboard.', :vcr do
    stub_omniauth

    visit '/'

    click_on 'signing in'
    user = User.last

    expect(current_path).to eq('/dashboard')

    fill_in :entry, with: "I'm feeling okay"
    choose(id: "mood_id_#{@mood2.id}")
    click_on 'Submit'

    mood_entry = UserMood.last
    expect(mood_entry.user_id).to eq user.id
    expect(mood_entry.mood_id).to eq @mood2.id
    expect(mood_entry.entry).to eq "I'm feeling okay"

    expect(page).to have_content 'Edit Today\'s Mood'

    within('#edit-mood') do
      expect(page).to have_field(:entry, with: "I'm feeling okay")
    end

    fill_in :entry, with: "I'm feeling sad actually"
    choose(id: "mood_id_#{@mood1.id}")
    click_on 'Save'

    mood_entry.reload
    expect(page).to have_content 'Emancipate yourself from mental slavery, none but ourselves can free our mind.'
    expect(page).to have_content 'Welcome, ' + user.name
    expect(mood_entry.user_id).to eq user.id
    expect(mood_entry.mood_id).to eq @mood1.id
    expect(mood_entry.entry).to eq "I'm feeling sad actually"
  end
end
