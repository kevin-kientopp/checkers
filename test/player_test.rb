require 'test_helper'
require_relative '../lib/checkers/player'

class PlayerTest < Minitest::Test
  def test_move_checker
    checker = Checker.new(:up)
    board = Array.new(8) { Array.new(8) }
    board[7][0] = checker

    player = Player.new(:up, Array.new(1, checker))
    player.move({:row => 7, :col => 0}, {:row => 6, :col => 1}, board)

    assert_equal(checker, board[6][1])
    assert_nil(board[7][0])
  end
end
