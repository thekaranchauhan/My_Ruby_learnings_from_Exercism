module Grid
  def self.saddle_points(input)
    return [] if input.first.empty?

    input.each_with_index.each_with_object([]) do |(row, i), points|
      max = row.max
      row.each_with_index do |tree, j|
        if tree == max && ((0...input.size).to_a - [i]).all? { |k| input[k][j] >= max }
          points << { "row" => i + 1, "column" => j + 1 }
        end
      end
    end
  end
end