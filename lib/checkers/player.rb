require_relative 'checker'

class Player
  attr_reader :direction, :checkers

  def initialize(direction, checkers)
    @direction = direction #:up or :down
    @checkers = checkers
  end

  def move(pos, new_pos, board)
    checker = board[ pos[:row] ] [ pos[:col] ]

    board[ new_pos[:row] ] [ new_pos[:col] ] = checker

    board[ pos[:row] ] [ pos[:col] ] = nil
  end
end
