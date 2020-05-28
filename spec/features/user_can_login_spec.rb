require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'when I visit the welcome page I see a link to sign in which takes me to the login page' do
    visit '/'

    click_on 'Sign In'

    expect(current_path).to eq('/login')
  end

  it 'when I visit the login page' do
    stub_omniauth
    
    visit '/login'

    click_on 'Sign In With Google'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Happy')
  end
end