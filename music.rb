class MusicAlbum < Item
  attr_accessor :on_spotify
  attr_reader :name

  def initialize(publish_date, on_spotify)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  private
  def can_be_archived?
    super && @on_spotify = true
  end
end
