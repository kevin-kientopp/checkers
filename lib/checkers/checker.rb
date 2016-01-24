class Checker
  attr_reader :pos, :dir, :picked_up
  alias_method :picked_up?, :picked_up

  def initialize(pos, dir, image = nil)
    @pos, @dir, @image = pos, dir, image
  end

  def move(pos, other_checkers)
    return false if pos.row < 0 or pos.row > 7 or pos.col < 0 or pos.col > 7

    eligible_spaces = []
    eligible_spaces << Position.new(@pos.row + 1 * dir_multiplier, @pos.col - 1) if space_empty?(Position.new(@pos.row + 1 * dir_multiplier, @pos.col - 1), other_checkers)
    eligible_spaces << Position.new(@pos.row + 1 * dir_multiplier, @pos.col + 1) if space_empty?(Position.new(@pos.row + 1 * dir_multiplier, @pos.col + 1), other_checkers)
    eligible_spaces << Position.new(@pos.row + 2 * dir_multiplier, @pos.col - 2) if space_empty?(Position.new(@pos.row + 2 * dir_multiplier, @pos.col - 2), other_checkers) &&
      enemy_checker_in_space?(Position.new(@pos.row + 1 * dir_multiplier, @pos.col - 1), other_checkers)
    eligible_spaces << Position.new(@pos.row + 2 * dir_multiplier, @pos.col + 2) if space_empty?(Position.new(@pos.row + 2 * dir_multiplier, @pos.col + 2), other_checkers) &&
      enemy_checker_in_space?(Position.new(@pos.row + 1 * dir_multiplier, @pos.col + 1), other_checkers)

    return false if !eligible_spaces.include?(Position.new(pos.row, pos.col))

    @pos = pos
    true
  end

  def to_s
    "#{@pos}, #{@dir}"
  end

  private
  def space_empty?(pos, checkers)
    checkers.count { |c| c.pos.row == pos.row and c.pos.col == pos.col } == 0
  end

  def enemy_checker_in_space?(pos, checkers)
    checkers.count { |c| c.pos.row == pos.row and c.pos.col == pos.col and c.dir == opposite_dir } > 0
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
