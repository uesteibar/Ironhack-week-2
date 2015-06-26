
require "./lib/generator/random_password_generator"
require "./lib/model/user"

describe RandomPasswordGenerator do
  before(:all) do
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: './lib/ddbb/testddbb.sqlite'
    )

  end

  describe '#password' do
    before(:each) do
      @password = RandomPasswordGenerator.new.password
    end

    it 'should generate a password 20 characters long' do
      expect(@password.size).to eq 20
    end

    it 'should generate a unique password' do
      expect(User.find_by_password(@password)).to be_falsy
    end
  end
end
