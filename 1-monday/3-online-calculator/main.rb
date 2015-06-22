
require "sinatra"
require "sinatra/reloader"

require "./lib/calculator"

require "pry"

set :port, 3003
set :bind, "0.0.0.0"

operations_lambdas = {
  sum: -> (a, b) {a + b},
  rest: -> (a, b) {a - b},
  multiply: -> (a, b) {a * b},
  divide: -> (a, b) {
    if b != 0
      return a / b
    end
    0
    }
}

get '/' do
  erb :home
end

post '/operation' do
  a = params[:number_one]
  b = params[:number_two]
  operation = params[:operation]
  res = Calculator.new(operations_lambdas).execute(operation, a.to_i, b.to_i)

  redirect("/result?a=#{a}&b=#{b}&operation=#{operation}&res=#{res}")
end

get '/result' do
  @a = params[:a]
  @b = params[:b]
  @operation = params[:operation]
  @res = params[:res]

  erb :result
end
