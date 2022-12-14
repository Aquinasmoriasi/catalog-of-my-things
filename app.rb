require_relative './modules/book_module'
require_relative './modules/game_module'
require_relative './modules/music_module'
require 'json/add/struct'
require './file_helper'
require 'json'

ItemStruct = Struct.new(:item)
class App
  def initialize
    @books = []
    @genres = []
    @games = []
    @musics = []
  end

  include BookModule
  include GameModule
  include MusicModule

  def listing_options(option)
    case option
    when 1
      list_all_books
    when 2
      list_all_music_albums
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      puts ' All labels'
      list_all_book_labels
      list_all_game_labels
    when 6
      puts ' All authors'
      list_all_book_authors
      list_all_game_authors
    else
      creation_options(option)
    end
  end

  def creation_options(option)
    case option
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
