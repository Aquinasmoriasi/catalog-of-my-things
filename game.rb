require_relative 'items'

class Game
  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super || Date.today.year - Date.parse(@last_played_at).year > 2
  end
end
