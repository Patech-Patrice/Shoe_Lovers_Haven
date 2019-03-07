ENV['SINATRA_ENV'] ||= "development"
require 'bundler/setup'
require 'erb'
Bundler.require
ActiveRecord::Base.establish_connection(
:adapter => "sqlite3",
:database => "db/development.sqlite"
)
require_all 'app'
