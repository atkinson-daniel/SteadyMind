class AddEntryToUserMood < ActiveRecord::Migration[5.1]
  def change
    add_column :user_moods, :entry, :string
  end
end
