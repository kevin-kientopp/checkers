require_relative 'player'
require_relative 'checker'

class Game
  attr_reader :players

  def start
    @players = [Player.new(:up, Array.new(8) {Checker.new}), Player.new(:down, Array.new(8) {Checker.new})]
  end
end
