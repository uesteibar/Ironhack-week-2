
require "./lib/model/user"

class LoginHandler

  def login(handle, password)
    user = User.find_by_handle(handle)
    if user.password == password
      return user.id
    else
      return nil
    end
  end
end
