require 'test_helper'
require_relative '../lib/checkers/game'

class GameTest < Minitest::Test
  def test_that_game_starts_with_2_players
    game = Game.new
    game.start
    assert_equal(2, game.players.length)
  end

  def test_that_players_have_opposing_directions
    game = Game.new
    game.start
    assert_equal(:up, game.players[0].direction)
    assert_equal(:down, game.players[1].direction)
  end

  def test_that_players_start_with_12_checkers
    game = Game.new
    game.start
    assert_equal(12, game.players[0].checkers.length)
    assert_equal(12, game.players[1].checkers.length)
  end

  def test_that_checkers_start_in_correct_positions
    game = Game.new
    game.start

    [0..3].each_with_index { |e, i| assert_nil(game.board[0][i * 2]) }
    [0..3].each_with_index { |e, i| assert_nil(game.board[1][1 + i * 2]) }
    [0..3].each_with_index { |e, i| assert_nil(game.board[2][i * 2]) }

    [0..3].each_with_index { |e, i| assert_instance_of(Checker, game.board[0][1 + i * 2]) }
    [0..3].each_with_index { |e, i| assert_instance_of(Checker, game.board[1][i * 2]) }
    [0..3].each_with_index { |e, i| assert_instance_of(Checker, game.board[2][1 + i * 2]) }

    game.board[3..4].each { |e| e.each { |space| assert_nil(space) } }

    [0..3].each_with_index { |e, i| assert_nil(game.board[5][1 + i * 2]) }
    [0..3].each_with_index { |e, i| assert_nil(game.board[6][i * 2]) }
    [0..3].each_with_index { |e, i| assert_nil(game.board[7][1 + i * 2]) }

    [0..3].each_with_index { |e, i| assert_instance_of(Checker, game.board[5][i * 2]) }
    [0..3].each_with_index { |e, i| assert_instance_of(Checker, game.board[6][1 + i * 2]) }
    [0..3].each_with_index { |e, i| assert_instance_of(Checker, game.board[7][i * 2]) }
  end
end
