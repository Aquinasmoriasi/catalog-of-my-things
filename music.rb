require_relative './items'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :id

  def initialize(name, publish_date, on_spotify)
    super(id, publish_date)
    @on_spotify = on_spotify
    @name = name
  end

  private

  def can_be_archived?
    super && @on_spotify = true
  end
end
