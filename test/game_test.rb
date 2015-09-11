require 'minitest/autorun'
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

    assert(game.players[0].checkers.any? {|c| c.row == 0 && c.col == 1})
    assert(game.players[0].checkers.any? {|c| c.row == 0 && c.col == 3})
    assert(game.players[0].checkers.any? {|c| c.row == 0 && c.col == 5})
    assert(game.players[0].checkers.any? {|c| c.row == 0 && c.col == 7})
    assert(game.players[0].checkers.any? {|c| c.row == 1 && c.col == 0})
    assert(game.players[0].checkers.any? {|c| c.row == 1 && c.col == 2})
    assert(game.players[0].checkers.any? {|c| c.row == 1 && c.col == 4})
    assert(game.players[0].checkers.any? {|c| c.row == 1 && c.col == 6})
    assert(game.players[0].checkers.any? {|c| c.row == 2 && c.col == 1})
    assert(game.players[0].checkers.any? {|c| c.row == 2 && c.col == 3})
    assert(game.players[0].checkers.any? {|c| c.row == 2 && c.col == 5})
    assert(game.players[0].checkers.any? {|c| c.row == 2 && c.col == 7})

    assert(game.players[1].checkers.any? {|c| c.row == 5 && c.col == 0})
    assert(game.players[1].checkers.any? {|c| c.row == 5 && c.col == 2})
    assert(game.players[1].checkers.any? {|c| c.row == 5 && c.col == 4})
    assert(game.players[1].checkers.any? {|c| c.row == 5 && c.col == 6})
    assert(game.players[1].checkers.any? {|c| c.row == 6 && c.col == 1})
    assert(game.players[1].checkers.any? {|c| c.row == 6 && c.col == 3})
    assert(game.players[1].checkers.any? {|c| c.row == 6 && c.col == 5})
    assert(game.players[1].checkers.any? {|c| c.row == 6 && c.col == 7})
    assert(game.players[1].checkers.any? {|c| c.row == 7 && c.col == 0})
    assert(game.players[1].checkers.any? {|c| c.row == 7 && c.col == 2})
    assert(game.players[1].checkers.any? {|c| c.row == 7 && c.col == 4})
    assert(game.players[1].checkers.any? {|c| c.row == 7 && c.col == 6})
  end
end
