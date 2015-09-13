require 'gosu'
require_relative 'board_drawer'
require_relative 'game'
require_relative 'position_calculator'

class Window < Gosu::Window

  def initialize
    super 640, 480, false
    self.caption = 'Checkers'

    white_tile = Gosu::Image.new(self, 'media/white_tile.png', true)
    black_tile = Gosu::Image.new(self, 'media/black_tile.png', true)
    @board_drawer = BoardDrawer.new(black_tile, white_tile)

    @game = Game.new
    @game.start

    @red_checker = Gosu::Image.new(self, 'media/red_checker.png', true)
    @blue_checker = Gosu::Image.new(self, 'media/blue_checker.png', true)

    @position_calculator = PositionCalculator.new
  end

  def draw
    @board_drawer.draw

    @game.players[0].checkers.each {|c| @red_checker.draw(@position_calculator.calc_x_for_col(c.col), @position_calculator.calc_y_for_row(c.row), 1)}
    @game.players[1].checkers.each {|c| @blue_checker.draw(@position_calculator.calc_x_for_col(c.col), @position_calculator.calc_y_for_row(c.row), 1)}
  end

  def needs_cursor?
    true
  end
end
