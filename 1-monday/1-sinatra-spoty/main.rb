
require "sinatra"
require "sinatra/reloader"

require "medium-scrapper"

require "./lib/song"
require "./lib/songs_collection"

set :port, 3003
set :bind, "0.0.0.0"

songs_collection = SongsCollection.new(10)

get '/' do
  @songs_collection = songs_collection
  erb :home
end

post '/songs' do
  songs_collection.add_song(Song.new(params[:artist], params[:title]))

  if songs_collection.full?
    redirect('/enough')
  end

  redirect('/')
end

get '/artist/:artist' do |artist|
  @artist = artist.capitalize
  @artist_songs = songs_collection.search_by_artist(artist)
  erb :artist
end

get '/search' do
  @term = params[:search_term]
  @songs = songs_collection.search_by_term(@term)
  erb :search
end

get '/enough' do
  erb :enough
end
