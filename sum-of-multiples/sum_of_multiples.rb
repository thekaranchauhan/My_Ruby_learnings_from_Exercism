class SumOfMultiples
  def initialize(*args) = @items = args
  def to(level) = @items.flat_map { |item| (1...level).select { |value| value % item == 0 } }.uniq.sum
end