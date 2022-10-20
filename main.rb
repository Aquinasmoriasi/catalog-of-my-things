require_relative 'app'

class Main
  attr_accessor :app

  def initialize
    @app = App.new
  end

  def start_app
    loop do
      main_menu
      input = gets.chomp.to_i
      exit_app unless input != 13
      @app.options(input)
    end
  end

  def main_menu
    puts "\nSelect an option from below with a number"
    puts "-------------------------------------------\n"
    puts '1)  List all books'
    puts '2)  List all music albums'
    puts '3)  List all movies'
    puts '4)  List of games'
    puts '5)  List all genres'
    puts '6)  List all labels'
    puts '7)  List all authors'
    puts '8)  List all sources'
    puts '9)  Add a book'
    puts '10) Add a music album'
    puts '11) Add a movie'
    puts '12) Add a game'
    puts "13) Exit app\n"
    puts "------------\n"
  end

  def exit_app
    abort 'Thank you for using the app'
  end
end

new_session = Main.new
new_session.start_app
