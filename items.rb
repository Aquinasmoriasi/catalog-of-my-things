require 'date'

class Item
  attr_reader :publish_date
  attr_accessor :author, :label, :genre, :archived

  # rubocop:disable Style/OptionalBooleanParameter

  def initialize(publish_date, archived = false)
    @author = author
    @label = label
    @publish_date = publish_date
    @id = Random.rand(1..100_000)
    @genre = genre
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def move_to_archive
    @archived = can_be_archived?
  end

  def genre=(genre)
      @genre = genre
      genre.items.push(self) unless genre.items.include?(self)
    end

    def author=(author)
      @author = author
      author.items.push(self) unless author.items.include?(self)
    end

    def label=(label)
      @label = label
      label.items.push(self) unless label.items.include?(self)
    end
  
  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
