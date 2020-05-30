class Mood < ApplicationRecord
  has_many :UserMoods

  default_scope { order(id: :asc) }

  def name_to_emoji
    Emoji.find_by_alias(name).raw
  end
end
