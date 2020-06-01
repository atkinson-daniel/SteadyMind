require 'rails_helper'

RSpec.describe 'As a user' do
  it 'when I visit the stats page I see pie chart' do
    stub_omniauth

    visit '/login'

    click_on 'Sign In With Google'
    user = User.last
    mood1 = Mood.create(name: 'worried', rating: 1)
    mood2 = Mood.create(name: 'neutral_face', rating: 2)
    mood3 = Mood.create(name: 'smile', rating: 3)

    mood_entry1 = UserMood.create(user_id: user.id, mood_id: mood1.id, created_at: 'Tue 26 May 2020 21:21:12 UTC +00:00', updated_at: 'Tue 26 May 2020 21:21:12 UTC +00:00')
    mood_entry2 = UserMood.create(user_id: user.id, mood_id: mood2.id, created_at: 'Wed 27 May 2020 21:21:12 UTC +00:00', updated_at: 'Wed 27 May 2020 21:21:12 UTC +00:00')
    mood_entry3 = UserMood.create(user_id: user.id, mood_id: mood3.id, created_at: 'Thu 28 May 2020 21:21:12 UTC +00:00', updated_at: 'Thu 28 May 2020 21:21:12 UTC +00:00')
    mood_entry4 = UserMood.create(user_id: user.id, mood_id: mood3.id, created_at: 'Fri 29 May 2020 21:21:12 UTC +00:00', updated_at: 'Fri 29 May 2020 21:21:12 UTC +00:00')
    mood_entry5 = UserMood.create(user_id: user.id, mood_id: mood3.id, created_at: 'Sat 30 May 2020 21:21:12 UTC +00:00', updated_at: 'Sat 30 May 2020 21:21:12 UTC +00:00')

    expect(current_path).to eq('/dashboard')
    find(:xpath, "//a[@href='/stats']").click
    assert_css('.chartjs-render-monitor') if has_css?('.chartjs-render-monitor', visible: :all)
    expect(page).to have_link "Pie Chart"
    expect(page).to have_link "Line Chart"
  end
end
