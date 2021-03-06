class Song

  @@all = []
   attr_accessor :name, :artist_name


  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end


  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new_by_name(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.new_from_filename(file_name)
    new_song = self.new
    song_arr = file_name.split(" - ").map {|x| x.gsub(".mp3","")}
    new_song.name = song_arr[1]
    new_song.artist_name = song_arr[0]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    @@all << new_song 
    new_song
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all
    @@all
  end


end
