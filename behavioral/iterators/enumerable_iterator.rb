class Song
  attr_reader :name
  attr_reader :duration

  def initialize(name, duration)
  	@name = name
  	@duration = duration
  end

  def duration_time
  	Time.at(@duration).strftime('%M:%S')
  end
  
  def <=>(other)
  	duration <=> other.duration
  end
end

class Playlist
  include Enumerable

  def initialize(name)
  	@name = name
    @songlist = []
  end

  def each(&block)
  	@songlist.each(&block)
  end

  def add_song(song)
  	@songlist << song
  end
end

playlist = Playlist.new('rock')

playlist.add_song( Song.new 'Smoke on the water', 60*4 )
playlist.add_song( Song.new 'Smells like teen spirit', 60*3.5 )
playlist.add_song( Song.new 'Another brick in the wall', 60*5 )

playlist.each do |song|
  puts "Song: #{song.name} - #{song.duration_time}"
end

p playlist.any?{ |song| song.duration >= 60*4}
p playlist.all?{ |song| song.duration >= 60*4 }