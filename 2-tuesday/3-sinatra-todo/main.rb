
require "sinatra"
require "sinatra/reloader"
require 'rubygems'
require 'active_record'

require "./lib/model/task"
require "./lib/model/user"
require "./lib/ddbb_access/tasks_retriever"

set :port, 3003
set :bind, "0.0.0.0"

enable :sessions

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './lib/ddbb/tasks.sqlite'
)

tasks = []

get '/' do
  if session[:user_id]
    redirect to('/tasks')
  else
    erb :signup
  end
end

post '/signup' do
  if user = User.find_by_username(params[:username])
    session[:user_id] = user.id
  else
    user = User.new username: params[:username]
    if user.save
      session[:user_id] = user.id
    end
  end

  redirect to('/')
end

delete '/session' do
  session.delete(:user_id)
  redirect to('/')
end

get '/tasks' do
  if session[:user_id]
    @tasks = TasksRetriever.new.by_user(session[:user_id])
    erb :tasks
  else
    redirect to('/')
  end
end

post '/tasks' do
  description = params[:description]
  (Task.new name: description,
    done: false,
    date: DateTime.now.strftime('%Y-%m-%d %H:%M:%S'),
    user_id: session[:user_id]).save
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
