class Song
  attr_accessor :name, :artist_name
  @@all = []
  def initialize(name, artist_name=nil)
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create_from_filename(filename)
    delimiters = [' - ', '.']
    new_arr = filename.split(Regexp.union(delimiters))
    @@all << self.new(new_arr[1], new_arr[0])
  end

  def self.new_from_filename(filename)
      delimiters = [' - ', '.']
      new_arr = filename.split(Regexp.union(delimiters))
      self.new(new_arr[1], new_arr[0])
  end

  def self.alphabetical
    
    self.all.sort_by {|n| n.name }.uniq
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else    
      self.create_by_name(name)
    end
  end

  def self.find_by_name(name)
    self.all.find {|n| n.name == name}
  end

  def self.create_by_name(name)
    #binding.pry
    song = self.new(name)
    @@all << song
    song
  end

  def self.new_by_name(name)
      self.new(name)
  end

  def self.create
    self.new(name)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
