require 'test_helper'
require_relative '../lib/checkers/position'

class CheckerTest < Minitest::Test
  def test_checker_moves
    checker = Checker.new(Position.new(0, 0), :up)
    assert checker.move(Position.new(1, 1), [])
    assert_equal Position.new(1, 1), checker.pos
  end

  def test_checker_cannot_move_straight
    checker = Checker.new(Position.new(0, 0), :up)
    refute checker.move(Position.new(1, 0), [])
    assert_equal Position.new(0, 0), checker.pos
  end

  def test_checker_cannot_move_to_col_less_than_0
    checker = Checker.new(Position.new(0, 0), :up)
    refute checker.move(Position.new(1, -1), [])
    assert_equal Position.new(0, 0), checker.pos
  end

  def test_checker_cannot_move_to_col_greater_than_7
    checker = Checker.new(Position.new(0, 7), :up)
    refute checker.move(Position.new(1, 8), [])
    assert_equal Position.new(0, 7), checker.pos
  end

  def test_checker_cannot_move_sideways
    checker = Checker.new(Position.new(0, 0), :up)
    refute checker.move(Position.new(0, 1), [])
    assert_equal Position.new(0, 0), checker.pos
  end

  def test_checker_cannot_move_down_when_dir_is_up
    checker = Checker.new(Position.new(1, 1), :up)
    refute checker.move(Position.new(0, 0), [])
    assert_equal Position.new(1, 1), checker.pos
  end

  def test_checker_cannot_move_up_when_dir_is_down
    checker = Checker.new(Position.new(4, 4), :down)
    refute checker.move(Position.new(5, 5), [])
    assert_equal Position.new(4, 4), checker.pos
  end

  def test_checker_cannot_move_to_row_less_than_0
    checker = Checker.new(Position.new(0, 0), :down)
    refute checker.move(Position.new(-1, 1), [])
    assert_equal Position.new(0, 0), checker.pos
  end

  def test_checker_cannot_move_to_row_greater_than_7
    checker = Checker.new(Position.new(7, 0), :up)
    refute checker.move(Position.new(8, 1), [])
    assert_equal Position.new(7, 0), checker.pos
  end

  def test_checker_cannot_move_more_than_1_row
    checker = Checker.new(Position.new(0, 0), :up)
    refute checker.move(Position.new(2, 1), [])
    assert_equal Position.new(0, 0), checker.pos
  end

  def test_checker_cannot_move_more_than_1_col
    checker = Checker.new(Position.new(0, 0), :up)
    refute checker.move(Position.new(1, 2), [])
    assert_equal Position.new(0, 0), checker.pos
  end

  def test_checker_cannot_move_to_occupied_space
    other_checker = Checker.new(Position.new(1, 1), :up)

    checker = Checker.new(Position.new(0, 0), :up)
    refute checker.move(Position.new(1, 1), [other_checker])
    assert_equal Position.new(0, 0), checker.pos
  end

  def test_checker_can_jump_enemy_checker
    other_checker = Checker.new(Position.new(1, 1), :down)

    checker = Checker.new(Position.new(0, 0), :up)
    assert checker.move(Position.new(2, 2), [other_checker])
    assert_equal Position.new(2, 2), checker.pos
  end
end
