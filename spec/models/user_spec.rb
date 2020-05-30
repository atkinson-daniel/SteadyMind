require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of :uid}
  end

  describe 'class methods' do
    it '.from_omniauth' do
      auth_info = {
        email: 'steve@example.com',
        given_name: 'Bob',
        sub: '923987239724972'
      }

      expect(User.from_omniauth(auth_info)).to eq(User.last) 
    end
  end
end
