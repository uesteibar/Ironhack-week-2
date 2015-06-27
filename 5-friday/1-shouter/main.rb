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

post '/users/follow/:id' do |id|
  if session[:user_id] && user = User.find_by_id(session[:user_id])
      user.followings.create(followed_id: id, follower_id: session[:user_id])
  end
  redirect to('/home')
end

delete '/users/unfollow/:id' do
  if session[:user_id] && user = User.find_by_id(session[:user_id])
    user.followings.select { |f| f.follower_id == 7 }.each do |f|
      f.destroy
    end
  end
  redirect to('/home')
end

get '/home' do
  if session[:user_id] && user = User.find_by_id(session[:user_id])
    if user
      @shouts = ShoutRetriever.new.from_many_users((user.followings.map { |f| f.followed_id }))
      @shouts.add_many ShoutRetriever.new.from_user(user.id)
      @shouts.sort_by(:date)
      erb :home
    end
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

get '/top-handles' do
  res = User.connection.select_all("SELECT id, (SELECT SUM(likes) FROM shouts WHERE user_id = users.id) AS likes FROM users ORDER BY likes DESC")
  @users_total_likes = res.rows.map { |id_likes|
    [User.find_by_id(id_likes[0]), id_likes[1]]
  }
  erb :top_users
end

get '/:user_handle' do
  user = User.find_by_handle(params[:user_handle])
  if user
    relationships = Following.where("follower_id = #{session[:user_id]} AND followed_id = #{user.id}")
    if relationships.any?
      @following = true
    else
      @following = false
    end
    shouts = ShoutRetriever.new.from_user(user.id)
    shouts.nil? ? @shouts = [] : @shouts = shouts.by(:date)
    erb :profile
  end
end
