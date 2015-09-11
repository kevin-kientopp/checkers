require_relative 'player'

class Game
  attr_reader :players

  def start
    @players = [Player.new(nil, nil), Player.new(nil, nil)]
  end
end
