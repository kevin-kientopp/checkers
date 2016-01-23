require_relative 'player'
require_relative 'checker'

class Game
  attr_reader :players, :board

  def start
    @players = [Player.new(:up, Array.new(12, Checker.new(:up))), Player.new(:down, Array.new(12, Checker.new(:down)))]
    @board = Array.new(8) { Array.new(8) }

    @players[1].checkers[0..3].each_with_index { |e, index| @board[0][1 + index * 2] = e }
    @players[1].checkers[4..7].each_with_index { |e, index| @board[1][index * 2] = e }
    @players[1].checkers[8..11].each_with_index { |e, index| @board[2][1 + index * 2] = e }

    @players[0].checkers[0..3].each_with_index { |e, index| @board[5][index * 2] = e }
    @players[0].checkers[4..7].each_with_index { |e, index| @board[6][1+ index * 2] = e }
    @players[0].checkers[8..11].each_with_index { |e, index| @board[7][index * 2] = e }
  end
end
