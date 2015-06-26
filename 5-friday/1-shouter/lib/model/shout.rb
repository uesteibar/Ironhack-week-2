
require 'rubygems'
require 'active_record'

class Shout < ActiveRecord::Base
  validates :likes, numericality: { greater_than_or_equals_than: 0, only_integer: true }
  validates_presence_of :user, :message
  validate :message_length, :existing_user

  belongs_to :user

  def message_length
    unless !message.nil? && message.size <= 200
      errors.add(:message, "it can't be longer than 200 characters")
    end
  end

  def existing_user
    if !user.nil? && user.id.nil?
      errors.add(:user, "this user doesn't exist in the database")
    end
  end
end
