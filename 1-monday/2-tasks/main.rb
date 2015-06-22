
require "sinatra"
require "sinatra/reloader"


require "./task"

set :port, 3003
set :bind, "0.0.0.0"

tasks = []


get '/tasks' do
  res = ""
  tasks.each do |task|
    res << "#{task.print}\n"
  end
  res
end

get '/tasks/priority/:priority' do |priority|
  res = ""
  tasks.each do |task|
    if task.priority == priority
      res << "#{task.print}\n"
    end
  end
  res
end

get '/tasks/search/:word' do |word|
  res = ""
  tasks.each do |task|
    if task.description.include?(word)
      res << "#{task.print}\n"
    end
  end  
  res
end

post '/tasks/new' do
  description = params[:description]
  priority = params[:priority]
  tasks << Task.new(description, priority)
  true
end
