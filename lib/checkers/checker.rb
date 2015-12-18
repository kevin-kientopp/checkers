class Checker
  attr_reader :row, :col, :dir, :picked_up
  alias_method :picked_up?, :picked_up

  def initialize(row, col, dir, image = nil)
    @row, @col, @dir, @image = row, col, dir, image
  end

  def move(row, col, other_checkers)
    return false if row < 0 or row > 7
    return false if col < 0 or col > 7
    return false if col == @col
    return false if row == @row
    return false if @dir == :up and row < @row
    return false if @dir == :down and row > @row
    return false if (row - @row).abs > 1
    return false if (col - @col).abs > 1

    checkers_in_space = other_checkers.count { |c| c.row == row and c.col == col }
    return false if checkers_in_space > 0

    @row, @col = row, col
    true
  end

  def to_s
    "#{@row}, #{@col}, #{@dir}"
  end
end
