require 'pry'

class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    file_arr = Dir["#{@path}/*.mp3"]
    normalized = file_arr.map { |file| file.split("/").last }
  end

  def import
    files.each { |file| Song.new_by_filename(file) }
  end

end