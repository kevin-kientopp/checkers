class Player
  attr_reader :direction

  def initialize(direction, checkers)
    @direction = direction #up or down
    @checkers = checkers
  end


end
