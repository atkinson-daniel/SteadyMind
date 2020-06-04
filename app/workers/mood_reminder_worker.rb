class MoodReminderWorker
  def perform
    users = User.all
    users.each do |user|
      if user.logged_mood?
        'user logged mood already'
      else
        UserNotifierMailer.send_reminder_email(user).deliver
      end
    end
  end
end
