class Checker
  attr_reader :row, :col, :dir, :picked_up
  alias_method :picked_up?, :picked_up

  def initialize(row, col, dir, image = nil)
    @row, @col, @dir, @image = row, col, dir, image
  end

  def move(row, col, other_checkers)
    return false if row < 0 or row > 7 or col < 0 or col > 7

    eligible_spaces = []
    eligible_spaces << [@row + 1 * dir_multiplier, @col - 1] if space_empty?(@row + 1 * dir_multiplier, @col - 1, other_checkers)
    eligible_spaces << [@row + 1 * dir_multiplier, @col + 1] if space_empty?(@row + 1 * dir_multiplier, @col + 1, other_checkers)
    eligible_spaces << [@row + 2 * dir_multiplier, @col - 2] if space_empty?(@row + 2 * dir_multiplier, @col - 2, other_checkers) and enemy_checker_in_space?(@row + 1 * dir_multiplier, @col - 1, other_checkers)
    eligible_spaces << [@row + 2 * dir_multiplier, @col + 2] if space_empty?(@row + 2 * dir_multiplier, @col + 2, other_checkers) and enemy_checker_in_space?(@row + 1 * dir_multiplier, @col + 1, other_checkers)

    return false if !eligible_spaces.include?([row, col])

    @row, @col = row, col
    true
  end

  def to_s
    "#{@row}, #{@col}, #{@dir}"
  end

  private
  def space_empty?(row, col, checkers)
    checkers.count { |c| c.row == row and c.col == col } == 0
  end

  def enemy_checker_in_space?(row, col, checkers)
    checkers.count { |c| c.row == row and c.col == col and c.dir == opposite_dir } > 0
  end

  def dir_multiplier
    return -1 if @dir == :down
    return 1
  end

  def opposite_dir
    return :down if @dir == :up
    return :up
  end
end
