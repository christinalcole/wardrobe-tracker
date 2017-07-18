require './config/environment'
require 'rack/flash/test'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


run ApplicationController
use Rack::MethodOverride
use WardrobesController
use UsersController
