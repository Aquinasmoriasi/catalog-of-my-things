require_relative 'spec_helper'
require 'pry'

describe Genre do
  context '#initialize' do
    it 'creates a new instance of the Genre class' do
      genre = Genre.new('Uncle Tom\'s Cabin', 'black')
      expect(genre).to be_an_instance_of Genre
    end
  end
end
