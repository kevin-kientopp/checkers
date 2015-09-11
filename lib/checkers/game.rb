require_relative 'player'

class Game
  attr_reader :players

  def start
    @players = [Player.new(:up, nil), Player.new(:down, nil)]
  end
end
