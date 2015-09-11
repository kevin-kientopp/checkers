require 'gosu'
require_relative 'board_drawer'

class Window < Gosu::Window
  START_X = 80

  def initialize
    super 640, 480, false
    self.caption = 'Checkers'

    white_tile = Gosu::Image.new(self, 'media/white_tile.png', true)
    black_tile = Gosu::Image.new(self, 'media/black_tile.png', true)
    @board_drawer = BoardDrawer.new(black_tile, white_tile)
  end

  def draw
    @board_drawer.draw
  end
end
