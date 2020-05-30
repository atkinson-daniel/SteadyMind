require 'rails_helper'

RSpec.describe 'As a user' do
  before do
    @mood1 = Mood.create(name: 'worried')
    @mood2 = Mood.create(name: 'neutral_face')
    @mood3 = Mood.create(name: 'smile')
  end
  it 'once logged in, I can see links to stats, resources and suggested videos' do
    stub_omniauth

    visit '/login'
    click_on 'Sign In With Google'

    within('#navbarSupportedContent') do
      expect(page).to have_link 'Stats'
      expect(page).to have_link 'Suggested Videos'
      expect(page).to have_link 'All Resources'
    end
  end
end
