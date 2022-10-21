class Label
  attr_reader :title, :color
  attr_accessor :label, :items

  def initialize(title, color)
    @title = title
    @color = color
    @id = Random.rand(1..100_000)
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
