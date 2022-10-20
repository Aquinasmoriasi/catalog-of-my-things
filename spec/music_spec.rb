require_relative 'spec_helper'

describe MusicAlbum do
  context '#initialize' do
    it 'creates a new instance of the MusicAlbum class' do
      music = MusicAlbum.new('Wakawaka', '22/12/2009', true)
      expect(music).to be_an_instance_of MusicAlbum
    end
  end
end