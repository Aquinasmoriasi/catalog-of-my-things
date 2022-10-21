require_relative 'items'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
