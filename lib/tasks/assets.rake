# Compile react assets first!
Rake::Task['assets:precompile']
  .enhance(['assets:compile_react'])

# Remove react bundle as well
Rake::Task['assets:clobber'].enhance do
  Rake::Task['assets:clobber_webpack'].invoke
end

namespace :assets do
  desc 'Compile assets with webpack'
  task :compile_react do
    sh '$(npm bin)/webpack --config webpack.config.js'
  end

  desc 'remove compiled react components with webpack'
  task :clobber_webpack do
    rm_rf "#{Rails.application.config.root}/app/assets/javascripts/generated"
  end
end
