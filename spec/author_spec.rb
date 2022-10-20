require_relative 'spec_helper'

describe Author do
  context '#initialize' do
    it 'creates a new instance of the Author class' do
      author = Author.new('Lil', 'Papi')
      expect(author).to be_an_instance_of Author
    end
  end
  context '#add_item' do
    it 'sets the Author of an Item class\' instance to the instance of the Author class' do
      author = Author.new('Lil', 'Papi')
      item = Item.new('2012/08/10')
      new_author = author.add_item(item)
      expect(new_author.items[0].author).to eq author
    end
  end
end
