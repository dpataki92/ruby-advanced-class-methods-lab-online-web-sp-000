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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(str_name)
    song = self.create
    song.name = str_name
    song
  end

  def self.create_by_name(str_name)
    song = self.new_by_name(str_name)
    song
  end

  def self.find_by_name(str_name)
    self.all.find {|inst| inst.name == str_name}
  end

  def self.find_or_create_by_name(str_name)
    self.find_by_name(str_name) == nil ? self.create_by_name(str_name) : self.find_by_name(str_name)
  end

  def self.alphabetical
    self.all.uniq.sort_by {|inst| inst.name}
  end

  def self.new_from_filename(filename)
    artist_and_song = filename.split(" - ")
    artist = artist_and_song[0]
    song = self.create_by_name(artist_and_song[1][0...-4])
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
