
require "./model/password_checker"

describe PasswordChecker do
  describe '#check_password' do
    before(:each) do
      @checker = PasswordChecker.new
    end

    it 'should return false if the password has less than 8 characters' do
      expect(@checker.check_password("name@email.com", "aaaaaaa")).to eq(false)
    end

    it 'should return false if the password is an empty string' do
      expect(@checker.check_password("name@email.com", "")).to eq(false)
    end

    it 'should return false if the password does not contain at least 1 letter' do
      expect(@checker.check_password("name@email.com", "12345678#")).to eq(false)
    end

    it 'should return false if the password does not contain at least 1 number' do
      expect(@checker.check_password("name@email.com", "abcdefghijk#")).to eq(false)
    end

    it 'should return false if the password does not contain at least 1 symbol' do
      expect(@checker.check_password("name@email.com", "abcd1234")).to eq(false)
    end

    it 'should return false if the password does not contain at leas one uppercase letter' do
      expect(@checker.check_password("name@email.com", "abcd1234%%")).to eq(false)
    end

    it 'should return false if the password does not contain at leas one lowercase letter' do
      expect(@checker.check_password("name@email.com", "ABCD1234%%")).to eq(false)
    end

    it 'should return false if the password does the username of the email' do
      expect(@checker.check_password("name@email.com", "abcAname1234%%")).to eq(false)
    end

    it 'should return false if the password does the domain of the email' do
      expect(@checker.check_password("name@email.com", "abcAemail1234%%")).to eq(false)
    end

    it 'should return true if the password is secure' do
      expect(@checker.check_password("name@email.com", "abcA1234%%")).to eq(true)
    end
  end
end
