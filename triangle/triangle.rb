class Triangle
  def initialize(side)
    @side = side
  end

  def equilateral?
    @side.uniq.size == 1 && triangle?
  end

  def isosceles?
    @side.uniq.size <= 2 && triangle?
  end

  def scalene?
    @side.uniq.size == 3 && triangle?
  end

  def triangle?
    @side.min(2).sum >= @side.max && !@side.include?(0)
  end
end
