class Checker
  attr_reader :dir

  def initialize(dir, image = nil)
    @dir, @image = dir, image
  end

  def to_s
    "#{@dir}"
  end
end
