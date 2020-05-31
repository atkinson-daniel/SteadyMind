class AddRatingToMood < ActiveRecord::Migration[5.1]
  def change
    add_column :moods, :rating, :integer
  end
end
