class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :uid, uniqueness: true
  has_many :user_moods
  has_many :moods, through: :user_moods

  def self.from_omniauth(auth_info)
    user = User.find_or_create_by(uid: auth_info[:sub])
    user.email = auth_info[:email]
    user.name = auth_info[:given_name]
    user.uid = auth_info[:sub]
    user.save
    user
  end

  def logged_mood?
    entry = UserMood.where(user_id: id,
                           created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    !entry.empty?
  end

  def mood_entry
    return unless logged_mood?

    entry = UserMood.where(user_id: id,
                           created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    entry.first
  end

  def mood_query
    self.user_moods.joins(:mood).select(:name).group(:name).count
  end
end
