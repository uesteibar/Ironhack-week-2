
require "sinatra"
require "sinatra/reloader"


require "./task"

set :port, 3003
set :bind, "0.0.0.0"

tasks = []


get '/tasks' do
  tasks.each do |task|
    puts "#{task.priority} - #{task.description}"
  end
end

get '/tasks/priority/:priority' do |priority|
  tasks.each do |task|
    if task.priority == priority
      task.print
    end
  end
end

get '/tasks/search/:word' do |word|
    tasks.each do |task|
      if task.description.include?(word)
        task.print
      end
    end  
end

post '/tasks/new' do
  description = params[:description]
  priority = params[:priority]
  tasks << Task.new(description, priority)  
end
