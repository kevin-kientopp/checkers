require 'test_helper'
require_relative '../lib/checkers/game'

class CheckerTest < Minitest::Test
  def test_checker_moves
    checker = Checker.new(0, 0, :up)
    assert checker.move(1, 1)
    assert_equal 1, checker.row
    assert_equal 1, checker.col
  end

  def test_checker_must_move_diagonally
    checker = Checker.new(0, 0, :up)
    refute checker.move(1, 0)
    assert_equal 0, checker.row
    assert_equal 0, checker.col
  end
end
