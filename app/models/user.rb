class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :uid, uniqueness: true
  has_many :moods, through: :user_moods
  has_many :user_moods, dependent: :destroy

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
    user_moods.joins(:mood).select(:name).group(:name).count
  end

  def mood_over_time
    user_moods.joins(:mood).group_by_day(:created_at).sum(:rating)
  end

  def suggested_videos
    rating = mood_rating
    if rating < 1.5
      VideoResults.new.get_suggested_videos('sad')
    elsif rating >= 1.5 && rating < 2.25
      VideoResults.new.get_suggested_videos('neutral')
    elsif rating >= 2.25
      VideoResults.new.get_suggested_videos('happy')
    end
  end

  private

  def mood_rating
    moods = user_moods.where('created_at > ?', 7.days.ago).group(:mood_id).count
    total = moods.sum { |_, count| count }
    rating = moods.sum { |mood, count| Mood.find(mood).rating * count }
    rating / total.to_f
  end
end
