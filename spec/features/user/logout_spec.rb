require 'rails_helper'

RSpec.describe 'As a user' do
  it 'when I visit any page I can logout', :vcr do
    stub_omniauth

    visit '/'

    click_on 'signing in'

    click_link 'Logout'

    expect(page).to have_link('sign in')
    expect(page).to have_content('You have been logged out!')
    expect(page).to_not have_link('Logout')

    expect(page).to have_content('Act the way you want to be and soon you\'ll be the way you act')
    expect(page).to have_content('Les Brown')
  end

end
