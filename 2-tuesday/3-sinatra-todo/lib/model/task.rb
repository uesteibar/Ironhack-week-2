
class Task < ActiveRecord::Base

  validates_presence_of :name

  def print
    "#{date} => #{name}"
  end
  
end
