
require 'rubygems'
require 'active_record'

class User < ActiveRecord::Base
  validates :handle, presence: true, uniqueness: true
  validates_presence_of :name
  validates_uniqueness_of :password
  validate :correct_password
  has_many :followings, class_name:  "Following",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy

  has_many :shouts

  def correct_password
    unless !password.nil? && password.size >= 8
      errors.add(:password, "It should be at least 8 characters long")
    end
  end

  def shout!(shout)
    if shout.message
      self.shouts.create(message: shout.message, likes: 0)
      return true
    else
      return nil
    end
  end
end

class Following < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
end
