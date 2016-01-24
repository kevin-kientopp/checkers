class Position
  attr_reader :row, :col
  alias_method :eql?, :==

  def initialize(row, col)
    @row, @col = row, col
  end

  def to_s
    "#{@row}, #{@col}"
  end

  def ==(other)
    other.instance_of?(self.class) && @row == other.row && @col == other.col
  end
end
