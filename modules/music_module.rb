require_relative '../music'
require_relative '../genre'

def add_album
  print 'Enter album Name: '
  name = gets.chomp
  print 'Enter album genre: '
  genre = gets.chomp
  print 'Enter publish date: '
  publish_date = gets.chomp
  print 'is it on Spotify? [Y/N]: '
  on_spotify = gets.chomp.downcase
  on_spotify = on_spotify == 'y'
  MusicAlbum.new(name, publish_date, on_spotify)
  new_genre = Genre.new(genre)

  music_struct = MusicStruct.new(name: name, genre: genre, publish_date: publish_date,
                                 on_spotify: on_spotify)
  json = json.generate(music_struct)
  @musics << json
  File.write('musics.json', @musics)

  @genres << new_genre
  puts '*************** Music add successfully!!***************'
end

def list_all_genres
  p @genres
  puts ''
end
