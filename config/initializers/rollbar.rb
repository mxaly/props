require 'rollbar/rails'
Rollbar.configure do |config|
  config.access_token = AppConfig.rollbar_access_token

  if %w(development test).include?(Rails.env)
    config.enabled = false
  end
end
