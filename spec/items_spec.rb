require_relative 'spec_helper'

describe Item do
  context '#initialize' do
    it 'creates a new instance of the Item class' do
      item = Item.new('05/12/2019')
      expect(item).to be_an_instance_of Item
    end
  end
  context '#move_to_archive' do
    it 'sets the archived state of the item' do
      item = Item.new('05/12/2019')
      expect(item.move_to_archive).to be(false)
    end
  end
  context '#can_be_archived?' do
    it 'returns true if the item\s publish date is longer than 10years' do
      item = Item.new('05/12/2019')
      expect(item.can_be_archived?).to be(false)
    end
  end
  context 'The setter' do
    before(:all) do
      @item = Item.new('05/12/2019')
      @genre = Genre.new('action')
      @label = Label.new('gift', 'maroon')
      @author = Author.new('Harper', 'Lee')
    end
    it 'sets the genre to the assigned value' do
      @item.genre = @genre
      expect(@item.genre).to be(@genre)
    end
    it 'sets the label to the assigned value' do
      @item.label = @label
      expect(@item.label).to be(@label)
    end
    it 'sets the author to the assigned value' do
      @item.author = @author
      expect(@item.author).to be(@author)
    end
  end
end
