
require "./lib/retriever/shout_retriever"

describe ShoutRetriever do
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
    @sharon.shout!(Shout.new(message: "Hey I'm Sharon!"))
    @sharon_shout = @sharon.shouts[0]

    @llorenc = User.new
    @llorenc.name = "Lorenc"
    @llorenc.handle = "lmuntaner"
    @llorenc.password = "2343565743524342"
    @llorenc.save
    @llorenc.shout!(Shout.new(message: "Hey I'm Llorenç!"))
    @llorenc_shout = @llorenc.shouts[0]

    @retriever = ShoutRetriever.new
  end

  describe '#from_user' do
    it 'should retrieve users shouts' do
      expect(@retriever.from_user(@llorenc.id)[0]).to eq(@llorenc_shout)
    end

    it 'should return nil when user is not found' do
      expect(@retriever.from_user(-1)).to be_falsy
    end

    it 'should return nil when nil user is provided' do
      expect(@retriever.from_user(nil)).to be_falsy
    end
  end

  describe '#from_many_users' do
    it 'should retrieve a list of all the shouts from all those user' do
      expect(@retriever.from_many_users([@llorenc.id, @sharon.id]).to_json).to eql ShoutCollection.new([@llorenc_shout, @sharon_shout]).to_json
    end
  end
end
