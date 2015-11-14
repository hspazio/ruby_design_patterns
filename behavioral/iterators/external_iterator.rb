# role > External Iterator
class PlaylistIterator
  
  attr_accessor :index

  def initialize(playlist)
  	@playlist = playlist.songs
    @index = 0
  end

  def has_next?
  	@index < @playlist.length
  end

  def song
  	@playlist[@index]
  end

  def next_song
  	song = @playlist[@index]
  	@index += 1
  	song
  end
end

class Playlist
  
  attr_accessor :name

  def initialize(name)
  	@name = name
  	@songlist = []
  end

  def add_song(song)
    @songlist << song
  end	

  def delete_song(song)
  	@songlist.delete(song)
  end	

  # for the External Iterator we need to provide the a way to access the array to the outside
  def songs
  	@songlist
  end
end

playlist = Playlist.new('rock')

playlist.add_song('Smoke on the water')
playlist.add_song('Smells like teen spirit')
playlist.add_song('Another brick in the wall')

iterator = PlaylistIterator.new(playlist)
while iterator.has_next?
  puts "Song #{iterator.index}: #{iterator.next_song}"
end
