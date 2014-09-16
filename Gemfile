source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.2'
gem 'rails', '4.1.5'

gem 'active_model_serializers'
gem 'netguru_theme'
gem 'coffee-rails', '~> 4.0.0'
gem 'decent_exposure'
gem 'gon'
gem 'haml-rails'
gem 'jquery-rails'
gem 'js_stack'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'pg'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'searchlight', github: 'lubieniebieski/searchlight', branch: 'search_on_proc'
gem 'sendgrid'
gem 'thin'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_19, :mri_20, :mri_21, :rbx]
  gem 'bullet'
  gem 'ffaker'
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
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end

group :production do
  gem 'rails_12factor'
end
