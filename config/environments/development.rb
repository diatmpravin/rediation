# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = false

# Don't care if the mailer can't send
#config.action_mailer.raise_delivery_errors = false

require 'smtp_tls'
  #Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.default_charset = "utf-8"
  ActionMailer::Base.raise_delivery_errors = true
 
ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :authentication => :plain,
  :domain => "localhost.localdomain",
  :enable_starttls_auto => true,
  :user_name => "diatm.pravin.it.07.27@gmail.com",
  :password => "diatmit27"
}
ActionMailer::Base.default_content_type = "text/html"