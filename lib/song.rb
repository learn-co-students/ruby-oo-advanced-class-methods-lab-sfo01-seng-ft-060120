require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song
    song
  end

  def self.find_by_name(song_name)
      #binding.pry
      @@all.find { |person| person.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    #binding.pry
    song = self.find_by_name(song_name)
    if song == nil
      self.create_by_name(song_name)
      song = self.find_by_name(song_name) # this is needed to return the song that was just created
    end
    song
  end

  def self.alphabetical
    all.sort { |a, b|  a.name <=> b.name }
  end

  def self.new_from_filename(song)
    song_details = song.split(" - ")
    new_song = self.new_by_name(song_details[1].delete_suffix('.mp3'))
    new_song.artist_name = song_details[0]
    new_song
  end

  def self.create_from_filename(song)
    #binding.pry
    song_details = song.split(" - ")
    new_song = self.new
    new_song.name = song_details[1].delete_suffix('.mp3')
    new_song.artist_name = song_details[0]
    @@all << new_song
  end

  def self.destroy_all
    @@all = []
  end

end

# binding.pry
