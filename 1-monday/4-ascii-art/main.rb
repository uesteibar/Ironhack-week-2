
require "sinatra"
require "sinatra/reloader"

require "./lib/ascii_formatter"

set :port, 3003
set :bind, "0.0.0.0"

get '/ascii/:text' do |text|
  @ascii_text = AsciiFormatter.new(text).format
  erb :ascii
end
