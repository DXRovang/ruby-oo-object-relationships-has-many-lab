class Artist

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    #iterate through all songs, select will 
    #return an array of all that are true
    Song.all.select do |song|
      #call the artist getter from Song class
      #and check it against self (from Artist class)
      song.artist == self
    end
  end

  def add_song(song)
    @songs << song
    #this is the tricky part 
    #call the artist SETTER method (from the Song class)
    #on the song you're passing in & set it 
    #equal to self (from the Artist class!)
    song.artist = self
  end

  def add_song_by_name(song)
    song = Song.new(song)
    song.artist = self
  end

  def self.song_count
  Song.all.length  
  end

end