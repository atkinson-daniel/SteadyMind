require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'when I visit the welcome page I see a link to sign in which takes me to the login page' do
    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq('/login')
  end

  it 'when I visit the login page I can login with Google and the Sign In button now says Logout' do
    stub_omniauth
    
    visit '/login'

    click_on 'Sign In With Google'

    expect(current_path).to eq('/dashboard')
    expect(User.last.name).to eq('Bob')
    within('nav') do
      expect(page).to_not have_link('Sign In')
      expect(page).to have_link('Logout')
    end
  end

  it 'I cannot go to the dashboard page directly if not signed in' do
    visit '/dashboard'

    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

end