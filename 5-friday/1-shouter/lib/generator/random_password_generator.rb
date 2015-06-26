
class RandomPasswordGenerator
  def password
    pword = generate_random
    while User.find_by_password(pword) do
      pword = generate_random
    end
    pword
  end

  private

  def generate_random
    (0...20).map { (65 + rand(26)).chr }.join
  end
end
