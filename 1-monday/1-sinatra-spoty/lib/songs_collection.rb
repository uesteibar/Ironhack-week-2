
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

  def search_by_artist(artist)
    artist_songs = []
    @songs.each do |song|
      if song.artist.downcase == artist.downcase
        artist_songs << song
      end
    end
    artist_songs
  end

  def search_by_term(term)
    songs = []
    @songs.each do |song|
      if song.title.include?(term.downcase)
        songs << song
      end
    end
    songs
  end
end
