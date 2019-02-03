require "pry"
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
    song.save
    song
  end 
  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name #sets property name
    song
  end 
  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save
    song
  end 
  def self.find_by_name(song_name)
    @@all.find {|name| name.name == song_name}
  end 
  def self.find_or_create_by_name(song_name)
    find_by_name(song_name) || create_by_name(song_name)
  end 
  def self.alphabetical
    @@all.sort_by {|name| name.name}
  end 
  def self.new_from_filename(file)
    song = file.chomp(".mp3")
    final = song.split(" - ")
    
    new = self.new
    
    new.name = final[1]
    new.artist_name = final[0]
    new
  end 
  def self.create_from_filename(file)
    new_from_filename(file)
  end 
  def self.destroy_all
    @@all.clear
  end 
end