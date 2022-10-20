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
    puts "Is the game a multiplayer game? [Y/N]: "
    label_title = gets.chomp
    puts "When was the game published: "
    publish_date = gets.chomp
    puts "When was the game played last: "
    last_played_at = gets.chomp
    puts "Enter the game's label(e.g. 'Gift'): "
    label_title = gets.chomp
     
    author = Author.new(first_name, last_name)
    genre = Genre.new(genre)
    game = Game.new(multiplayer, last_played_at)
    label = Label.new(title: title, color: "unknown")
    item = Item.new(publish_date)
    game_struct = ItemStruct.new(author: "#{author.first_name} #{author.last_name}", multiplayer: game.multiplayer,
                                 last_played_at: game.last_played_at, title: title, publish_date: publish_date, 
                                 label: label.title, genre: genre.genre)
    json = json.generate(game_struct)
    @games << json
    File.write('games.json', @games)
  end

  def list_all_games
    @games = File.read('games.json', create_additions: true) if File.exist? && File.read('games.json') != ''
    p @games
  end

  def list_all_game_labels
    @labels = File.read('games.json', create_additions: true) if File.exist? && File.read('games.json') != ''
    p @labels
  end
end
