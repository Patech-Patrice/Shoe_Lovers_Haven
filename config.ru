require_relative './config/environment'
require 'erb'
if ActiveRecord::Migrator.needs_migration?
raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride
use UsersController
use ShoeEntriesController
# use OtherController2
# use OtherController3
run ApplicationController
