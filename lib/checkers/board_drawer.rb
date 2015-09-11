class BoardDrawer
  START_X = 80

  def initialize(black_tile, white_tile)
    @black_tile, @white_tile = black_tile, white_tile
  end

  def draw
    for i in 0..3
      for j in 0..3
        @black_tile.draw(START_X + i * 120, j * 120, 0)
        @white_tile.draw(START_X + i * 120 + 60, j * 120, 0)

        @white_tile.draw(START_X + i * 120, 60 + j * 120, 0)
        @black_tile.draw(START_X + i * 120 + 60, 60 + j * 120, 0)
      end
    end
  end
end
