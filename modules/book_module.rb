module BookModule
  def create_book
      # rubocop:disable Metrics/MethodLength
    puts 'Creating a book... \n'
    puts "Enter the book's name"
    title = gets.chomp
    puts "Enter the book's label(e.g. 'Gift'): "
    label_title = gets.chomp
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
    puts "Enter book's color"
    color = gets.chomp

    author = Author.new(first_name, last_name)
    book = Book.new(publisher, cover_state)
    label = Label.new(label_title, color)
    item = Item.new(publish_date)
    book_struct = ItemStruct.new({ author: "#{author.first_name} #{author.last_name}", publisher: book.publisher,
                                   cover_state: book.cover_state, title: title, color: label.color,
                                   publish_date: item.publish_date, label: label.title })
    json = JSON.generate(book_struct)
    @books << json
    File.write('books.json', @books)
    puts 'Book created successfully :)'
      # rubocop:enable Metrics/MethodLength
  end

  def list_all_books
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json') && File.read('books.json') != ''
    p @books
  end

  def list_all_labels
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json') && File.read('books.json') != ''
    p @books
  end
end
