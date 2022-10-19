require_relative 'spec_helper'
require 'pry'

describe Label do
  context '#initialize' do
    it 'creates a new instance of the Label class' do
      label = Label.new('Uncle Tom\'s Cabin', 'black')
      expect(label).to be_an_instance_of Label
    end
  end
  context '#add_item' do
    it 'sets the label of an Item class\' instance to the instance of the Label class' do
      label = Label.new('Uncle Tom\'s Cabin', 'black')
      item = Item.new('2012/08/10')
      newlabel = label.add_item(item)
      expect(newlabel.items[0].label).to eq label
    end
  end
end
