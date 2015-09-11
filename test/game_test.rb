require 'minitest/autorun'
require_relative '../lib/checkers/game'

class GameTest < Minitest::Test
  def test_that_game_starts_with_2_players
    game = Game.new
    game.start
    assert_equal(2, game.players.length)
  end
end
