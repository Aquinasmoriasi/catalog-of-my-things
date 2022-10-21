module BookModule
  def create_book
    puts "Enter the book's name"
    title = gets.chomp.capitalize
    puts "Enter the book's label(e.g. 'Gift'): "
    label_title = gets.chomp.capitalize
    puts "Enter the author's name: "
    author_name = gets.chomp.capitalize
    puts 'Enter publisher: '
    publisher = gets.chomp.capitalize
    puts 'Enter publish date: '
    publish_date = gets.chomp
    puts "What's the book's cover state?: "
    cover_state = gets.chomp
    author = Author.new(author_name, nil)
    book = Book.new(publisher, cover_state)
    label = Label.new(label_title, nil)
    item = Item.new(publish_date)
    @books << JSON.generate(ItemStruct.new({ author: author.first_name, publisher: book.publisher,
                                             cover_state: book.cover_state, title: title,
                                             publish_date: item.publish_date, label: label.title }))
    File.write('books.json', @books)
  end

  def list_all_books
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json') && File.read('books.json') != ''
    if @books.empty?
      puts 'No books currently saved'
    else
      puts 'All saved books'
      puts "---------------\n"
      @books.each_with_index do |book, index|
        book = JSON.parse(book, create_additions: true)
        puts "#{index + 1}) \"#{book.item['title']}\" by #{book.item['author']},
         published by #{book.item['publisher']} on #{book.item['publish_date']}."
      end
    end
  end

  def list_all_book_labels
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json') && File.read('books.json') != ''
    if @books.empty?
      puts ''
    else
      @books.each_with_index do |book, _index|
        book = JSON.parse(book, create_additions: true)
        puts "The book, \"#{book.item['title']}\" by #{book.item['author']} is labeled as: \"#{book.item['label']}\"."
      end
    end
  end

  def list_all_book_authors
    @books = JSON.parse(File.read('books.json')) if File.exist?('books.json') && File.read('books.json') != ''
    if @books.empty?
      puts ''
    else
      @books.each_with_index do |book, _index|
        book = JSON.parse(book, create_additions: true)
        puts "#{book.item['author']} authored \"#{book.item['title']}\"."
      end
    end
  end
end
