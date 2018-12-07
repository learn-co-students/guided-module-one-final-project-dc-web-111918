require 'bundler'
Bundler.require

ActiveRecord::Base.logger = nil
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/venues.db')
require_all 'lib'
require_all 'bin'
