module GameModule
  def create_game
    puts 'Creating a game... \n'
    puts "Enter the game's name"
    title = gets.chomp
    puts "Enter the game's author first name"
    first_name = gets.chomp
    puts "Enter the game's author last name"
    last_name = gets.chomp
    puts "Enter the game's genre"
    genre = gets.chomp
    puts 'Is the game a multiplayer game? [Yes/No]: '
    multiplayer = gets.chomp.downcase
    puts 'When was the game published: '
    publish_date = gets.chomp
    puts 'When was the game played last: '
    last_played_at = gets.chomp
    puts "Enter the game's label(e.g. 'Gift'): "
    label_title = gets.chomp

    author = Author.new(first_name, last_name)
    genre = Genre.new(genre)
    game = Game.new(multiplayer, last_played_at)
    label = Label.new(label_title, 'unknown')
    item = Item.new(publish_date)
    game_struct = ItemStruct.new({ author: "#{author.first_name} #{author.last_name}", multiplayer: game.multiplayer,
                                   last_played_at: game.last_played_at, title: title, publish_date: item.publish_date,
                                   label: label.title, genre: genre.name })
    json = JSON.generate(game_struct)
    @games << json
    File.write('games.json', @games)
    puts 'Game created successfully'
  end

  def list_all_games
     @games = JSON.parse(File.read('games.json'))  if File.exist?('games.json') && File.read('games.json') != ''
    p @games
  end

  def list_all_game_labels
     @games = JSON.parse(File.read('games.json'))  if File.exist?('games.json') && File.read('games.json') != ''
    p @games
  end
end
