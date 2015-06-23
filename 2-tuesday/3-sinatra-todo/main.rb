
require "sinatra"
require "sinatra/reloader"
require 'rubygems'
require 'active_record'

require "pry"

require "./lib/model/task"
require "./lib/ddbb_access/tasks_retriever"

set :port, 3003
set :bind, "0.0.0.0"

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './lib/ddbb/tasks.sqlite'
)

tasks = []

get '/' do
  @tasks = TasksRetriever.new.all
  erb :home
end

post '/tasks' do
  description = params[:description]
  (Task.new name: description,
    done: false,
    date: DateTime.now.strftime('%Y-%m-%d %H:%M:%S')).save
  redirect to('/')
end

delete '/tasks/:id' do |id|
  TasksRetriever.new.by_id(id).destroy
  redirect to('/')
end

put '/tasks/:id' do |id|
  task = TasksRetriever.new.by_id(id)
  task.done = true
  task.save
  redirect to('/')
end
