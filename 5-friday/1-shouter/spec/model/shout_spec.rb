
require "./lib/model/shout"

describe Shout do
  before(:all) do
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: './lib/ddbb/testddbb.sqlite'
    )

    Shout.delete_all
    User.delete_all

    @sharon = User.new
    @sharon.name = "Sharon"
    @sharon.handle = "sharebear"
    @sharon.password = "730571638493760"
    @sharon.save
  end

  before(:each) do
    @shout = @sharon.shouts.new(
    message: "Hey there!",
    likes: 0)
  end

  it 'should be valid with correct data' do
    expect(@shout.valid?).to be_truthy
  end

  describe :message do
    it 'should be invalid with no message' do
      @shout.message = nil
      expect(@shout.valid?).to be_falsy
    end

    it 'should be invalid with a message longer than 200 characters' do
      @shout.message = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      expect(@shout.valid?).to be_falsy
    end
  end

  describe :likes do
    it 'should be invalid when likes is not an integer' do
      @shout.likes = "a lot of likes!"
      expect(@shout.valid?).to be_falsy
    end
  end

  describe :user do
    it 'should be valid with a proper user' do
      @shout.user_id = @sharon.id
      expect(@shout.valid?).to be_truthy
    end

    it 'should be invalid with no user' do
      @shout.user = nil
      expect(@shout.valid?).to be_falsy
    end

    it 'should be invalid with a user that does not exist' do
      @shout.user = User.new
      expect(@shout.valid?).to be_falsy
    end
  end
end
