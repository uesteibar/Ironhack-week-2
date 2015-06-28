
class PasswordChecker
  def initialize
    @password_conditions = [
      ->(email, password) { password.size >= 8 },
      ->(email, password) { password =~ /\d/ },
      ->(email, password) { password =~ /[A-Z]/ },
      ->(email, password) { password =~ /[a-z]/ },
      ->(email, password) {
        special = "?<>',?[]}{=-)(*&^%$#`~{}"
        regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
        password =~ regex
      },
      ->(email, password) {
        username = email.slice(0..email.index("@")-1)
        !password.downcase.include?(username.downcase)
      },
      ->(email, password) {
        after_at = email.slice(email.index("@")+1..-1)
        domain = after_at.slice(0..after_at.index(".")-1)
        !password.downcase.include?(domain.downcase)
      }
    ]
  end
  def check_password(email, password)
    @password_conditions.each do |condition|
      return false if !condition.call(email, password)
    end
    return true
  end
end
