class Player
  attr_reader :direction, :checkers

  def initialize(direction, checkers)
    @direction = direction #:up or :down
    @checkers = checkers
  end
end
