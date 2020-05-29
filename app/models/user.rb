class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :uid, presence: true

  def self.from_omniauth(auth_info)
    user = User.find_or_create_by(uid: auth_info[:uid])
    user.email = auth_info[:email]
    user.name = auth_info[:given_name]
    user.uid = auth_info[:sub]
    user.save!
    user
  end
end
