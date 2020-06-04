desc "Remind users if they haven't entered their mood"
task :remind_of_mood => :environment do
  puts "Reminding users to log mood"
  MoodReminderWorker.new.perform
  puts "done."
end
