require 'rails_helper'

RSpec.describe UserMood, type: :model do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :mood}
  end
end
