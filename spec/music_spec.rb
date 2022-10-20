require_relative 'spec_helper'
require 'pry'

describe MusicAlbum do
  context '#initialize' do
    it 'creates a new instance of the MusicAlbum class' do
      music = MusicAlbum.new('Uncle Tom\'s Cabin', 'black')
      expect(music).to be_an_instance_of MusicAlbum
    end
  end
end
