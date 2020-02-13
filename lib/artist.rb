require 'pry'

class Artist

  # May need a custom writer
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    artist = all.detect { |artist| artist.name == name }
    artist != nil ? artist : Artist.new(name)
  end

  def print_songs
    songs.each { |song| puts song.name}
  end

end