# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Mood.destroy_all
User.destroy_all
UserMood.destroy_all
user = User.create!(name: 'Tj', email: 'tj@example.com', uid: '12345')
mood1 = Mood.create!(name: 'worried')
mood2 = Mood.create!(name: 'neutral_face')
mood3 = Mood.create!(name: 'smile')
mood_entry1 = UserMood.create!(user_id: user.id, mood_id: mood1.id, created_at: 'Tue 26 May 2020 21:21:12 UTC +00:00', updated_at: 'Tue 26 May 2020 21:21:12 UTC +00:00')
mood_entry2 = UserMood.create!(user_id: user.id, mood_id: mood2.id, created_at: 'Wed 27 May 2020 21:21:12 UTC +00:00', updated_at: 'Wed 27 May 2020 21:21:12 UTC +00:00')
mood_entry3 = UserMood.create!(user_id: user.id, mood_id: mood3.id, created_at: 'Thu 28 May 2020 21:21:12 UTC +00:00', updated_at: 'Thu 28 May 2020 21:21:12 UTC +00:00')
mood_entry4 = UserMood.create!(user_id: user.id, mood_id: mood3.id, created_at: 'Fri 29 May 2020 21:21:12 UTC +00:00', updated_at: 'Fri 29 May 2020 21:21:12 UTC +00:00')
mood_entry5 = UserMood.create!(user_id: user.id, mood_id: mood3.id, created_at: 'Sat 30 May 2020 21:21:12 UTC +00:00', updated_at: 'Sat 30 May 2020 21:21:12 UTC +00:00')
