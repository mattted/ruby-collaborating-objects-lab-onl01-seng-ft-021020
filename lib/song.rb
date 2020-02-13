class Song

  attr_accessor :name
  attr_reader :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    artist_name, song_name, genre = filename.split(" - ")
    new_song = Song.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(artist_name)
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end

end