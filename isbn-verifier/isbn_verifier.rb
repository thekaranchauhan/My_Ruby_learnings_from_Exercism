module IsbnVerifier
  def self.valid?(isbn)
    /^\d-?\d{3}-?\d{5}-?[\dX]$/.match?(isbn) && (isbn.delete("-").chars.each_with_index.map { |x, i| (x == "X" ? 10 : x.to_i) * (10 - i) }.sum % 11).zero?
  end
end