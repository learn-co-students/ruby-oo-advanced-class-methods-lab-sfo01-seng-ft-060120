require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name)
    @name = name
    @artist_name = artist_name
    save
  end
    # in case you forgot how to intantiate?? here ya go ^^^


  def self.all
    @@all
  end

  def save
    # self.class.all << self
    @@all << self
  end

  def self.create 
    self.new(name)
  end
  # in case you forgot how to intantiate?? here ya go ^^^
#   song = Song.create
# Song.all.include?(song) #=> true

  def self.new_by_name(name)
    self.new(name) 
  end
# song = Song.new_by_name("The Middle")
# #=> #<Song @name="The Middle">
# song.name #=> "The Middle"

  def self.create_by_name(name)
    song = self.new(name)

    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|n|n.name == name}
  end 
  # use find when you want to look for matches

  def self.find_or_create_by_name(name)
   if self.find_by_name(name) == nil 
    self.create_by_name(name)
   else
    self.find_by_name(name)
      # helper methods are our friend
      #since we already have two methods that help find &&/|| create names 
      # its easier if we call them
   end
  end

  def self.alphabetical
     self.all.sort_by {|word| word.name}.uniq
    end
    # yes i know its weird that we used uniq on the braces / at end... 

   def self.new_from_filename(name)
    song = self.new(name)
    song.name = name.split(" - ")[1].chomp('.mp3')
    song.artist_name = name.split(" - ")[0].chomp('.mp3')
    song
   end
  #  using chomp removes the line break, we can remove ('.mp3') with .chomp
  # remember this !!!
# song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# song.name #=> "Blank Space"
# song.artist_name #=> "Taylor Swift"

   def self.create_from_filename(name)
    song = self.new(name)
    song.name = name.split(" - ")[1].chomp('.mp3')
    song.artist_name = name.split(" - ")[0].chomp('.mp3')
    @@all << song
   end

   def self.destroy_all
    self.all.clear 
   end
  #  best way to clear the data 
end
