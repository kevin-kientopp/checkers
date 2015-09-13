require 'gosu'
require_relative 'board_drawer'
require_relative 'game'
require_relative 'position_calculator'
require_relative 'checker_view'

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

    @checker_views = @game.players[0].checkers.collect { |c| CheckerView.new(c, @red_checker, @position_calculator.calc_x_for_col(c.col), @position_calculator.calc_y_for_row(c.row)) } +
      @game.players[1].checkers.collect { |c| CheckerView.new(c, @blue_checker, @position_calculator.calc_x_for_col(c.col), @position_calculator.calc_y_for_row(c.row)) }
  end

  def draw
    @board_drawer.draw

    @checker_views.each { |c_d| c_d.draw }
  end

  def needs_cursor?
    true
  end
end
