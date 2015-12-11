class CheckerView
  attr_accessor :x, :y, :selected, :mouse_x_offset, :mouse_y_offset
  alias_method :selected?, :selected

  def initialize(checker, image, x, y)
    @checker, @image, @x, @y = checker, image, x, y
  end

  def draw
    @image.draw(@x, @y, 1)
  end
end
