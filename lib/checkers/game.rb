require_relative 'player'
require_relative 'checker'

class Game
  attr_reader :players

  def start
    @players = [Player.new(:up, (1..8).collect {Checker.new}), Player.new(:down, (1..8).collect {Checker.new})]
  end
end
