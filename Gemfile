source 'https://rubygems.org'

ruby '2.1.5'
gem 'rails', '4.2.1'

gem 'active_model_serializers', github: 'rails-api/active_model_serializers', branch: '0-9-stable'
gem 'attr_extras'
gem 'coffee-rails'
gem 'decent_exposure'
gem 'easy_tokens'
gem 'gon'
gem 'gravatar-ultimate'
gem 'haml-rails'
gem 'jquery-rails'
gem 'js_stack'
gem 'kaminari'
gem 'konf'
gem 'netguru_theme'
gem 'newrelic_rpm'
gem 'animate-rails'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'pg'
gem 'rollbar'
gem 'sass-rails'
gem 'searchlight'
gem 'sendgrid'
gem 'slack-notifier'
gem 'thin'
gem 'uglifier'

# deploy
gem 'capistrano', '3.3.5'
gem 'rvm1-capistrano3', require: false
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano-passenger', '0.0.2' # downgrade due to some deployment issues in capistrano 3.3.5+

source 'https://rails-assets.org' do
  gem 'rails-assets-select2'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_19, :mri_20, :mri_21, :rbx]
  gem 'bullet'
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'guard-rubocop'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
  gem 'email_spec'
end
