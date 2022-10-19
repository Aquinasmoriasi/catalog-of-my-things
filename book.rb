require_relative 'items'

class Book < Item
  attr_accessor :archived

  def initialize(publisher, cover_state)
    super
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    archived || @cover_state == 'bad'
  end
end