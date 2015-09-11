class Checker
  attr_reader :row, :col

  def initialize(row, col)
    @row, @col = row, col
  end

  def to_s
    @row.to_s + ', ' + @col.to_s
  end
end
