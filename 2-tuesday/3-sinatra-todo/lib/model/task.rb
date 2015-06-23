
class Task < ActiveRecord::Base

  validates_presence_of :description

  def print
    description
  end
  
end
