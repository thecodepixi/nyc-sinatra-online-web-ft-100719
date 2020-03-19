ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'


# Type `rake -T` on your command line to see the available rake tasks.
task :start do 
  exec 'bundle exec rackup -p 3000'
end   