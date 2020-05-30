require 'rails_helper'

RSpec.describe 'As a user' do
  it 'when I visit any page I can logout' do
    stub_omniauth
    
    visit '/login'

    click_on 'Sign In With Google'

    click_link 'Logout'
    
    expect(current_path).to eq(root_path)
    expect(page).to have_link('Sign In')
    expect(page).to have_content('You have been logged out!')
    expect(page).to_not have_link('Logout')
  end

end