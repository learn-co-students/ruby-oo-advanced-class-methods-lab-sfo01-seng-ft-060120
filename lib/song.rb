require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
    @name = name
    @artist_name = artist_name
    save
  end

  def self.all
    @@all
  end

  def save
    # self.class.all << self
    @@all << self
  end

  def self.create 
    # new_song = self.new
    # #  binding.pry
    # @@all << new_song
    # new_song
    self.new(name)
    # binding.pry
  end

  def self.new_by_name(name)
    self.new(name) 

  end

  def self.create_by_name(name)
    song = self.new(name)
    @@all << song
    song
  # binding.pry
  end

  def self.find_by_name(name)
    self.all.find{|n|n.name == name}
  end 

  def self.find_or_create_by_name(name)
   if self.find_by_name(name) == nil 
    self.create_by_name(name)
   else
    self.find_by_name(name)
   end
  end

  def self.alphabetical

  end
end


# binding.pry