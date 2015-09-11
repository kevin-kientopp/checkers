require_relative 'player'
require_relative 'checker'

class Game
  attr_reader :players

  def start
    @players = [Player.new(:up, create_player_0_checkers), Player.new(:down, create_player_1_checkers)]
  end

  private
  def create_player_0_checkers
    row_0_checkers = Array.new(4) {|i| Checker.new(0, 1 + i * 2)}
    row_1_checkers = Array.new(4) {|i| Checker.new(1, i * 2)}
    row_2_checkers = Array.new(4) {|i| Checker.new(2, 1 + i * 2)}
    row_0_checkers + row_1_checkers + row_2_checkers
  end

  def create_player_1_checkers
    row_5_checkers = Array.new(4) {|i| Checker.new(5, i * 2)}
    row_6_checkers = Array.new(4) {|i| Checker.new(6, 1 + i * 2)}
    row_7_checkers = Array.new(4) {|i| Checker.new(7, i * 2)}
    row_5_checkers + row_6_checkers + row_7_checkers
  end
end
