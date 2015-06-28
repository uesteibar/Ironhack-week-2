
class PasswordChecker
  def check_password(email, password)
    return false if password.size < 8
    return false if !(password =~ /\d/)
    return false if !(password =~ /[A-Z]/)
    return false if !(password =~ /[a-z]/)

    special = "?<>',?[]}{=-)(*&^%$#`~{}"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return false if !(password =~ regex)

    username = email.slice(0..email.index("@")-1)
    after_at = email.slice(email.index("@")+1..-1)
    domain = after_at.slice(0..after_at.index(".")-1)

    return false if password.downcase.include?(username.downcase)
    return false if password.downcase.include?(domain.downcase)

    return true
  end
end
