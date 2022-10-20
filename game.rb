require_relative 'items'

class Game < Item
  attr_reader :multiplayer, :last_played_at
  def initialize(multiplayer, last_played_at)
    super
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super || Date.today.year - Date.parse(@last_played_at).year > 2
  end
end
