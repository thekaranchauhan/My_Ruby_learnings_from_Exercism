class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = [[1]]
    (n - 1).times { @rows << [1] + @rows[-1].each_cons(2).map { |a, b| a + b } + [1] }
  end
end