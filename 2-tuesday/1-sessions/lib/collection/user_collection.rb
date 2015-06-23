
class UserCollection
  attr_reader :users

  def initialize(id_manager)
    @id_manager = id_manager
    @users = {}
  end
  
  def new_user(username)
    user_id = @id_manager.next_id
    @users[user_id] = username
    user_id
  end

  def user(user_id)
    @users[user_id]
  end

  def delete(user_id)
    @users.delete(user_id)
  end
end
