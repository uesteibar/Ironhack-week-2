
require "sinatra"
require "sinatra/reloader"

require "./lib/model/id_manager"
require "./lib/collection/user_collection"


set :port, 3003
set :bind, "0.0.0.0"

enable :sessions

user_collection = UserCollection.new(IdManager.new(1))

get '/' do
  if user_collection.user(session[:user_id])
    @username = user_collection.user(session[:user_id])
    @users = user_collection.users
    p @users
  end

  erb :home
end

post '/signup' do
  session[:user_id] = user_collection.new_user(params[:username])
  p user_collection.users
  redirect to('/')
end

get '/cats' do
  if user_collection.user(session[:user_id])
    erb :cats
  else
    redirect to('/')
  end
end

delete '/signout' do
  if user_collection.user(session[:user_id])
      user_collection.delete(session[:user_id])
  end
  redirect to('/')
end
