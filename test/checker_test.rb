require 'test_helper'

class CheckerTest < Minitest::Test
  def test_checker_moves
    checker = Checker.new(0, 0, :up)
    assert checker.move(1, 1)
    assert_equal 1, checker.row
    assert_equal 1, checker.col
  end

  def test_checker_cannot_move_straight
    checker = Checker.new(0, 0, :up)
    refute checker.move(1, 0)
    assert_equal 0, checker.row
    assert_equal 0, checker.col
  end

  def test_checker_cannot_move_to_col_less_than_0
    checker = Checker.new(0, 0, :up)
    refute checker.move(1, -1)
    assert_equal 0, checker.row
    assert_equal 0, checker.col
  end

  def test_checker_cannot_move_to_col_greater_than_7
    checker = Checker.new(0, 7, :up)
    refute checker.move(1, 8)
    assert_equal 0, checker.row
    assert_equal 7, checker.col
  end

  def test_checker_cannot_move_sideways
    checker = Checker.new(0, 0, :up)
    refute checker.move(0, 1)
    assert_equal 0, checker.row
    assert_equal 0, checker.col
  end

  def test_checker_cannot_move_down_when_dir_is_up
    checker = Checker.new(1, 1, :up)
    refute checker.move(0, 0)
    assert_equal 1, checker.row
    assert_equal 1, checker.col
  end

  def test_checker_cannot_move_up_when_dir_is_down
    checker = Checker.new(4, 4, :down)
    refute checker.move(5, 5)
    assert_equal 4, checker.row
    assert_equal 4, checker.col
  end

  def test_checker_cannot_move_to_row_less_than_0
    checker = Checker.new(0, 0, :down)
    refute checker.move(-1, 1)
    assert_equal 0, checker.row
    assert_equal 0, checker.col
  end

  def test_checker_cannot_move_to_row_greater_than_7
    checker = Checker.new(7, 0, :up)
    refute checker.move(8, 1)
    assert_equal 7, checker.row
    assert_equal 0, checker.col
  end

  def test_checker_cannot_move_more_than_1_row
    checker = Checker.new(0, 0, :up)
    refute checker.move(2, 1)
    assert_equal 0, checker.row
    assert_equal 0, checker.col
  end

  def test_checker_cannot_move_more_than_1_col
    checker = Checker.new(0, 0, :up)
    refute checker.move(1, 2)
    assert_equal 0, checker.row
    assert_equal 0, checker.col
  end
end
