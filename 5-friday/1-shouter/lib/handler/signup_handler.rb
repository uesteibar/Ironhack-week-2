
class SignupHandler
  def initialize(password_generator)
    @password_generator = password_generator
  end

  def signup(user)
    user.password = @password_generator.password
    if user.save
      return user.id
    else
      return nil
    end
  end
end
