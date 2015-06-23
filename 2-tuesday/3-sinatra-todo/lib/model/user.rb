
class User < ActiveRecord::Base
  validates_presence_of :username
  has_many :tasks
end
