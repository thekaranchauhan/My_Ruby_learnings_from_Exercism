class Transpose
  def self.transpose(input)
    input.split("\n").map { |line| line.tr(' ', '%').ljust(input.lines.max_by(&:length)&.length).chars }.transpose.map { |row| row.join.rstrip.tr('%', ' ') }.join("\n").strip
  end
end