class Diamond
  def self.make_diamond(letter)
    letters = ('A'..letter).to_a
    rows = letters.map.with_index { |i, j| i.ljust(j + 1).rjust(letters.count) }
                  .map { |i| "#{i}#{i[0, letters.count - 1].reverse}\n" }
    rows.append(rows[0, letters.count - 1].reverse).join
  end
end