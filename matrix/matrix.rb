class Matrix
  def initialize(elements)
    @matrix = elements.split("\n").map{|row| row.split(' ').map(&:to_i) }
  end

  def row(position)
    @matrix[position - 1]
  end

  def column(position)
    @matrix.map{|row| row[position - 1] }
  end
end
