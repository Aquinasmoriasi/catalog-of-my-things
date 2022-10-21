require_relative 'spec_helper'

describe Game do
  context '#initialize' do
    it 'creates a new instance of the Game class' do
      game = Game.new(true, '2022/9/17')
      expect(game).to be_an_instance_of Game
    end
  end
  context '#can_be_archived?' do
    it 'returns true if the last played date is greater than 2 years' do
      book = Game.new(true, '2022/9/17')
      expect(book.can_be_archived?).to be(false)
    end
  end
end
