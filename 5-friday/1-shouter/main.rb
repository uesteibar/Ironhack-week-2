
require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './lib/ddbb/shouter.sqlite'
)

set :port, 3003
set :bind, "0.0.0.0"
