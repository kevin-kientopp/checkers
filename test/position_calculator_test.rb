require 'test_helper'
require_relative '../lib/checkers/position_calculator'

class PositionCalculatorTest < Minitest::Test
  def test_calc_y_returns_0
    position_calculator = PositionCalculator.new
    y = position_calculator.calc_y_for_row(7)
    assert_equal(0, y)
  end

  def test_calc_y_returns_420
    position_calculator = PositionCalculator.new
    y = position_calculator.calc_y_for_row(0)
    assert_equal(420, y)
  end

  def test_calc_x_returns_0
    position_calculator = PositionCalculator.new
    x = position_calculator.calc_x_for_col(0)
    assert_equal(0, x)
  end

  def test_calc_x_returns_420
    position_calculator = PositionCalculator.new
    x = position_calculator.calc_x_for_col(7)
    assert_equal(420, x)
  end
end
