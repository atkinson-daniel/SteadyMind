require 'rails_helper'

RSpec.describe Mood, type: :model do
  describe 'relationships' do
    it {should have_many :UserMoods}
  end

  describe 'instance methods' do
    it '#name_to_emoji' do
      mood1 = Mood.create(name: 'smile')
      mood2 = Mood.create(name: 'dog')
      expect(mood1.name_to_emoji).to eq '😄'
      expect(mood2.name_to_emoji).to eq '🐶'
    end
  end
end
