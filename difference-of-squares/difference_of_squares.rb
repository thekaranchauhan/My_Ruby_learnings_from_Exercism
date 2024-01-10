class Squares
  def initialize(num)
    @num = 1..num
  end

  def square_of_sum
    @num.sum**2
  end

  def sum_of_squares
    @num.sum { |n| n**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
