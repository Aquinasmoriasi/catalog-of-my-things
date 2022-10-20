require_relative 'spec_helper'

describe Book do
  context '#initialize' do
    it 'creates a new instance of the Book class' do
      book = Book.new('Longhorn', 'bad')
      expect(book).to be_an_instance_of Book
    end
  end
end
