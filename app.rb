require_relative './modules/book_module'
require 'json/add/struct'

class App
  def initialize
    @books = []
  end

  include BookModule

  def options(option)
    case option
    when 7
      create_book
    else
      puts 'Please enter a valid option'
    end
  end
end
