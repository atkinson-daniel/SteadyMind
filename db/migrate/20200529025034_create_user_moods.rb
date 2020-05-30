class CreateUserMoods < ActiveRecord::Migration[5.1]
  def change
    create_table :user_moods do |t|
      t.references :user, foreign_key: true
      t.references :mood, foreign_key: true

      t.timestamps
    end
  end
end
