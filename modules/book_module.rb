module BookModule
  # rubocop:disable Metrics/MethodLength
  def create_book
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
  end
  # rubocop:enable Metrics/MethodLength

  def list_all_books
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json') && File.read('books.json') != ''
    if @books.empty?
      puts "No books currently saved"
    else
      puts "All saved books"
      puts "---------------\n"
      @books.each_with_index do |book, index|
        book = JSON.parse(book, create_additions: true)
        puts "#{index+1}) \"#{book.item['title']}\" by #{book.item['author']}, published by #{book.item['publisher']} on #{book.item['publish_date']}."
      end
    end
  end

  def list_all_book_labels
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json') && File.read('books.json') != ''
    if @books.empty?
      puts ''
      else
      @books.each_with_index do |book, index|
        book = JSON.parse(book, create_additions: true)
        puts "The book, \"#{book.item['title']}\" by #{book.item['author']} is labeled as: \"#{book.item['label']}\"."
      end
    end
  end
end
