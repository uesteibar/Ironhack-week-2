
require "./lib/collection/shout_collection"

describe ShoutCollection do
  before(:all) do
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: './lib/ddbb/testddbb.sqlite'
    )
  end

  before(:each) do
    @old_shout = Shout.new(message: "Hey old one!", created_at: DateTime.new(1991, 12, 12))
    @old_shout.likes = 0
    @millenial_shout = Shout.new(message: "Millenial!", created_at: DateTime.new(2001, 1, 1))
    @millenial_shout.likes = 3
    @new_shout = Shout.new(message: "The end of the world!", created_at: DateTime.new(2012, 12, 12))
    @new_shout.likes = 1
    @collection = ShoutCollection.new([@old_shout, @new_shout, @millenial_shout])
  end

  describe '#by' do
    describe 'by :date' do
      it 'should sort by date' do
        expect(@collection.by(:date)).to eq [@new_shout, @millenial_shout, @old_shout]
      end
    end

    describe 'by :likes' do
      it 'should sort by likes' do
        expect(@collection.by(:likes)).to eq [@millenial_shout, @new_shout, @old_shout]
      end
    end
  end
end
