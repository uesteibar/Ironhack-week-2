
require "sinatra"
require "sinatra/reloader"

require "medium-scrapper"

require "./song"

set :port, 3003
set :bind, "0.0.0.0"

songs = []

get '/' do
  songs.each do |song|
    puts "#{song.artist} - #{song.title}"
  end
  true
end

post '/songs/new' do
  songs << Song.new(params[:artist], params[:title])

  if songs.size > 10
    redirect('/enough')
  end

  redirect('/')
end

get '/enough' do
  "IS WOTH F***ING NOTHING"
end
