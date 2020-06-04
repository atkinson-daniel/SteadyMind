# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.


# Configuration for using SendGrid on Heroku
Rails.application.initialize!
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name => "app172527008@heroku.com",
  :password => "uj2bw8fp9049",
  :domain => "https://steadymind.herokuapp.com/",
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
