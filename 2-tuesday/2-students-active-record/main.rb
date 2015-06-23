
require 'rubygems'
require 'active_record'

require "./model/student"

require "pry"


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './ddbb/activerecord.sqlite'
)

unai = Student.new
unai.name = "Unai"
unai.surnames = "Esteibar Caballero"
unai.website = "http://uesteibar.github.io"
unai.number_of_dogs = 1
unai.birthday = Date.new(1991, 8, 29)

binding.pry

if unai.valid?
  unai.save
  puts unai.complete_name
end
