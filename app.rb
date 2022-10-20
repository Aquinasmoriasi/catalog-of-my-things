require_relative './modules/book_module'
require_relative './modules/music_module'
require 'json/add/struct'

class App
  def initialize
    @books = []
    @genres = []
  end

  include BookModule

  def options(option)
    case option
    when 5
      list_all_genres
    when 7
      create_book
    when 10
      add_album
    else
      puts 'Please enter a valid option'
    end
  end
end
