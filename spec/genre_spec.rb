require_relative 'spec_helper'

describe Genre do
  context '#initialize' do
    it 'creates a new instance of the Genre class' do
      genre = Genre.new('action')
      expect(genre).to be_an_instance_of Genre
    end
  end
end