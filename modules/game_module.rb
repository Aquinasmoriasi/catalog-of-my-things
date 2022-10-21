module GameModule
  def create_game
    puts "Enter the game's name"
    title = gets.chomp.capitalize
    puts "Enter the game's author name"
    author_name = gets.chomp.capitalize
    puts "Enter the game's genre"
    genre = gets.chomp.capitalize
    puts 'Is the game a multiplayer game? [Yes/No]: '
    multiplayer = gets.chomp.capitalize
    puts 'When was the game published: '
    publish_date = gets.chomp
    puts "Enter the game's label(e.g. 'Gift'): "
    label_title = gets.chomp.capitalize
    author = Author.new(author_name, nil)
    genre = Genre.new(genre)
    game = Game.new(multiplayer, nil)
    label = Label.new(label_title, 'unknown')
    item = Item.new(publish_date)
    @games << JSON.generate(ItemStruct.new({ author: author.first_name, title: title, multiplayer: game.multiplayer,
                                             publish_date: item.publish_date, label: label.title, genre: genre.name }))
    File.write('games.json', @games)
  end

  def list_all_games
    @games = JSON.parse(File.read('games.json')) if File.exist?('games.json') && File.read('games.json') != ''
    if @games.empty?
      puts 'No games currently saved'
    else
      puts 'All saved games'
      puts "---------------\n"
      @games.each_with_index do |game, index|
        game = JSON.parse(game, create_additions: true)
        puts "#{index + 1}) \"#{game.item['title']}\" by #{game.item['author']},
         supports multiplayer: #{game.item['multiplayer']}, genre: #{game.item['genre']}."
      end
    end
  end

  def list_all_game_labels
    @games = JSON.parse(File.read('games.json')) if File.exist?('games.json') && File.read('games.json') != ''
    if @games.empty?
      puts ''
    else
      @games.each_with_index do |game, _index|
        game = JSON.parse(game, create_additions: true)
        puts "The game, \"#{game.item['title']}\" by #{game.item['author']} is labeled as: \"#{game.item['label']}\"."
      end
    end
  end

  def list_all_game_authors
    @games = JSON.parse(File.read('games.json')) if File.exist?('games.json') && File.read('games.json') != ''
    if @games.empty?
      puts ''
    else
      @games.each_with_index do |game, _index|
        game = JSON.parse(game, create_additions: true)
        puts "#{game.item['author']} created the game \"#{game.item['title']}\"."
      end
    end
  end
end
