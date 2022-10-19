require_relative 'spec_helper'

describe Game do
  context '#initialize' do
    it 'creates a new instance of the Game class' do
      game = Game.new(true, '2022/9/17')
      expect(game).to be_an_instance_of Game
    end
  end
end
