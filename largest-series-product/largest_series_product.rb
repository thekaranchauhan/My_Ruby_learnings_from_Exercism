class Series
  def initialize(series)
    raise ArgumentError unless series.match?(/^\d*$/)

    @series = series
  end

  def largest_product(len)
    raise ArgumentError unless (1..@series.size).cover?(len)

    @series.chars.each_cons(len).map { |s| s.map(&:to_i).reduce(:*) }.max
  end
end