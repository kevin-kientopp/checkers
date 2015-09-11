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
end
