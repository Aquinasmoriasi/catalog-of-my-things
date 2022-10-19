module BookModule
  def create_book
    puts 'Creating a book...'
    puts "Enter the author's first name: "
    first_name = gets.chomp
    puts "Enter the author's last name: "
    last_name = gets.chomp
    puts 'Enter publisher: '
    publisher = gets.chomp
    puts 'Enter publish date: '
    publish_date = gets.chomp
    puts "What's the book's cover state?: "
    cover_state = gets.chomp

    full_name = "#{first_name} #{last_name}"
    book = Book.new(publisher, cover_state)
    book_struct = BookStruct.new(full_name: full_name, publisher: book.publisher, publish_date: publish_date,
                                 cover_state: book.cover_state)
    json = json.generate(book_struct)
    @books << json
    File.write('books.json', @books)
  end

  def list_all_books
    p @books
  end
end
