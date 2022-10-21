require_relative './items'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name, :id

  def initialize(on_spotify)
    super
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify = true
  end
end
