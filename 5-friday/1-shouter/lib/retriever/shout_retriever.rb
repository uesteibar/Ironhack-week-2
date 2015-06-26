require "./lib/model/user"
require "./lib/collection/shout_collection"

class ShoutRetriever
  def from_user(user_id)
    return if user_id.nil?
    user = User.find_by_id(user_id)
    return user.nil? ? nil : user.shouts
  end

  def from_many_users(user_ids)
    shouts = []
    user_ids.each do |user_id|
      from_user(user_id).each do |shout|
        shouts << shout
      end
    end
    ShoutCollection.new(shouts)
  end
end
