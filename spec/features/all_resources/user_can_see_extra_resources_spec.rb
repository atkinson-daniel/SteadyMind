require 'rails_helper'

RSpec.describe 'As a user' do
  describe "When I'm on the dashboard page, I can click the all resources button" do
    it 'I can see all yoga, meditiation, and motivational videos' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/all_resources'
      expect(page).to have_content('All Resources')
      expect(page).to have_css('#player')
    end

    it 'I can also see an aside with links to additional resources' do

    end
  end
end
