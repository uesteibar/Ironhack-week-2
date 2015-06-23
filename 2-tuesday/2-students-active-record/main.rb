
require 'rubygems'
require 'active_record'
require "sinatra"
require "sinatra/reloader"


require "./lib/model/student"
require "./lib/ddbb_access/student_retriever"

set :port, 3003
set :bind, "0.0.0.0"

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './lib/ddbb/activerecord.sqlite'
)

get '/' do
  @students = StudentRetriever.new.all
  erb :home
end

post '/students' do
  programming_experience = (params[:programming_experience] == "on")
  student = (Student.new name: params[:name],
    surnames: params[:surnames],
    birthday: params[:birthday],
    website: params[:website],
    number_of_dogs: params[:dogs],
    first_programming_experience: !params[:programming_experience])
  student.save
  redirect to('/')
end

delete '/students/:id' do |id|
  StudentRetriever.new.by_id(id).destroy
  redirect to('/')
end
