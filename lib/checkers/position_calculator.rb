class PositionCalculator
  def calc_x_for_col(col)
    80 + col * 60
  end

  def calc_y_for_row(row)
    (7-row) * 60
  end
end
