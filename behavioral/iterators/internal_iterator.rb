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

  # role > Internal Iterator
  # the array is not accessible externally and the class is responsible
  # for iterating on its internal collection.
  def each_song
    @songlist.each do |song|
      yield(song)
    end
  end
end

playlist = Playlist.new('rock')

playlist.add_song('Smoke on the water')
playlist.add_song('Smells like teen spirit')
playlist.add_song('Another brick in the wall')

count = 0
playlist.each_song do |song|
  puts "Song #{count}: #{song}"
  count += 1
end
