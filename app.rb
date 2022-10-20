require_relative './modules/book_module'
require_relative './modules/game_module'
require_relative './modules/music_module'
require 'json/add/struct'
require './file_helper.rb'
require 'json'

ItemStruct = Struct.new(:item)
class App
  def initialize
    @books = []
    @genres = []
  end

  include BookModule
  include GameModule

  def options(option)
    case option
    when 4
      list_all_genres
    when 7
      create_book
    when 8
      add_album
    when 9
      create_game
    else
      puts 'Please enter a valid option'
    end
  end
end
