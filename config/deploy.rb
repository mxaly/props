lock '3.4.0'

set :application, 'props'
set :repo_url,  'git://github.com/netguru/props.git'
set :deploy_to, ENV['DEPLOY_PATH']

set :linked_files, %w(config/database.yml config/sec_config.yml config/secrets.yml)
set :linked_dirs, %w(bin log tmp vendor/bundle)
