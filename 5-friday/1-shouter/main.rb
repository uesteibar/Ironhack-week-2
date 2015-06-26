require "pry"
require "sinatra"
require "sinatra/reloader"

require 'rubygems'
require 'active_record'

require "./lib/handler/login_handler"
require "./lib/handler/signup_handler"
require "./lib/generator/random_password_generator"
require "./lib/retriever/shout_retriever"

require "./lib/model/user"
require "./lib/model/shout"

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: './lib/ddbb/shouter.sqlite'
)

set :port, 3003
set :bind, "0.0.0.0"

enable :sessions

get '/' do
  if session[:user_id]
    redirect to('/home')
  else
    redirect to('/login')
  end
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

post '/users/signup' do
  user = User.new(
  handle: params[:handle],
  name: params[:name])
  if user_id = SignupHandler.new(RandomPasswordGenerator.new).signup(user)
    session[:user_id] = user_id
    redirect to('/')
  else
    redirect to('/users/signup')
  end

end

get '/users/login' do
  user_id = LoginHandler.new.login(params[:handle], params[:password])
  if user_id
    session[:user_id] = user_id
    redirect to('/')
  else
    redirect to('/users/signup')
  end
end

delete '/users/logout' do
  session.delete(:user_id)
  redirect to('/')
end

get '/home' do
  if session[:user_id]
    @shouts = Shout.all
    erb :home
  else
    redirect to('/login')
  end
end

post '/shouts' do
  user = User.find_by_id(session[:user_id])
  user.shout!(Shout.new(message: params[:message]))
  redirect to('/')
end

post '/shouts/like/:id' do |id|
  if shout = Shout.find_by_id(id)
    shout.likes += 1
    shout.save
  end
  redirect to('/')
end

get '/best' do
  @shouts = ShoutRetriever.new.all.by(:likes)
  erb :best
end

get '/:user_handle' do
  user = User.find_by_handle(params[:user_handle])
  if user
    shouts = ShoutRetriever.new.from_user(user.id)
    shouts.nil? ? @shouts = [] : @shouts = shouts.by(:date)
    erb :profile
  end
end
