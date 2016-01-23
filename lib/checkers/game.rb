require_relative 'player'
require_relative 'checker'

class Game
  attr_reader :players, :board

  def start
    @players = [Player.new(:up, create_player_0_checkers), Player.new(:down, create_player_1_checkers)]
    @board = Array.new(8) { Array.new(8) }

    @players[1].checkers[0..3].each_with_index { |e, index| @board[0][1 + index * 2] = e }
    @players[1].checkers[4..7].each_with_index { |e, index| @board[1][index * 2] = e }
    @players[1].checkers[8..11].each_with_index { |e, index| @board[2][1 + index * 2] = e }

    @players[0].checkers[0..3].each_with_index { |e, index| @board[5][index * 2] = e }
    @players[0].checkers[4..7].each_with_index { |e, index| @board[6][1+ index * 2] = e }
    @players[0].checkers[8..11].each_with_index { |e, index| @board[7][index * 2] = e }
  end

  private
  def create_player_0_checkers
    row_0_checkers = Array.new(4) {|i| Checker.new(0, 1 + i * 2, :up)}
    row_1_checkers = Array.new(4) {|i| Checker.new(1, i * 2, :up)}
    row_2_checkers = Array.new(4) {|i| Checker.new(2, 1 + i * 2, :up)}
    row_0_checkers + row_1_checkers + row_2_checkers
  end

  def create_player_1_checkers
    row_5_checkers = Array.new(4) {|i| Checker.new(5, i * 2, :down)}
    row_6_checkers = Array.new(4) {|i| Checker.new(6, 1 + i * 2, :down)}
    row_7_checkers = Array.new(4) {|i| Checker.new(7, i * 2, :down)}
    row_5_checkers + row_6_checkers + row_7_checkers
  end
end
