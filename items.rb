require 'date'

class Item
  attr_reader :publish_date, :author, :label, :genre
  attr_accessor :archived

  def initialize(publish_date)
    @author = author
    @label = label
    @publish_date = publish_date
    @id = Random.rand(1..100_000)
    @genre = genre
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
    @archived
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

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
