
class SongsCollection
  attr_reader :songs

  def initialize(limit)
    @limit = limit
    @songs = []
  end

  def add_song(song)
    @songs << song
  end

  def full?
    @songs.size >= @limit
  end
end
