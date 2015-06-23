
require "sinatra"
require "sinatra/reloader"

require "./lib/model/id_manager"

set :port, 3003
set :bind, "0.0.0.0"

enable :sessions


id_manager = IdManager.new(0)
users = {}

get '/' do
  if session[:user_id]
    @username = users[session[:user_id]]
    @users = users
  end

  erb :home
end

post '/signup' do
  user_id = id_manager.next_id
  users[user_id] = params[:username]
  session[:user_id] = user_id

  redirect to('/')
end

get '/cats' do
  if users[session[:user_id]]
    erb :cats
  else
    redirect to('/')
  end
end

delete '/signout' do
  if users[session[:user_id]]
      users.delete(session[:user_id])
  end
  redirect to('/')
end
