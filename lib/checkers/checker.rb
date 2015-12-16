class Checker
  attr_reader :row, :col, :dir, :picked_up
  alias_method :picked_up?, :picked_up

  def initialize(row, col, dir, image = nil)
    @row, @col, @dir, @image = row, col, dir, image
  end

  def move(row, col)
    return false if col < 0 or col > 7 or col == @col or row == @row or (@dir == :up and row < @row) or (@dir == :down and row > @row) or row < 0

    @row, @col = row, col
    true
  end

  def to_s
    "#{@row}, #{@col}, #{@dir}"
  end
end
