
require 'date'

class Item
  attr_reader :source, :author, :label, :publish_date, :genre

  def initialize(author, _source, label, publish_date)
    @author = author
    @label = label
    @publish_date = publish_date
    @id = Random.rand(1..100_000)
    @genre = genre
    @archived = archived
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end
end
