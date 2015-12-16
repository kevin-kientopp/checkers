class Checker
  attr_reader :row, :col, :picked_up
  alias_method :picked_up?, :picked_up

  def initialize(row, col, image = nil)
    @row, @col, @image = row, col, image
  end

  def to_s
    "#{@row}, #{@col}"
  end
end
