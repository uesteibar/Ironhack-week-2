
class Task < ActiveRecord::Base

  validates_presence_of :name

  def print
    name
  end
  
end
