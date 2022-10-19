class Item
  attr_accessor :genre
  attr_reader :source, :author, :label, :publish_date

  def initialize(author, source, label, publish_date)
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @id = Random.rand(1..100_000)
    @genre = genre
    @archived = false
  end

  def move_to_archive
    @archieved = can_be_archieved?
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
