require 'gosu'

class Window < Gosu::Window
  START_X = 80

  def initialize
    super 640, 480, false
    self.caption = 'Checkers'

    @white_tile = Gosu::Image.new(self, 'media/white_tile.png', true)
    @black_tile = Gosu::Image.new(self, 'media/black_tile.png', true)
  end

  def draw
    for j in 0..3
      for i in 0..3
        @black_tile.draw(START_X + i * 120, j * 120, 0)
        @white_tile.draw(START_X + i * 120 + 60, j * 120, 0)

        @white_tile.draw(START_X + i * 120, 60 + j * 120, 0)
        @black_tile.draw(START_X + i * 120 + 60, 60 + j * 120, 0)
      end
    end
  end
end
