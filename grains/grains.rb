class Grains
  TOTAL_COUNT_OF_GRAINS = 18_446_744_073_709_551_615
  ALL_SQUARES = (1..64)

  def self.square(num)
    raise ArgumentError unless ALL_SQUARES.cover?(num)

    2**(num - 1)
  end

  def self.total
    TOTAL_COUNT_OF_GRAINS
  end
end