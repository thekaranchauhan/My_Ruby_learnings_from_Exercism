class RunLengthEncoding
  def self.encode(input)
    input.gsub(/(.)\1+/) { |run| "#{run.size}#{run[0]}" }
  end

  def self.decode(input)
    input.gsub(/(?<size>\d+)(?<char>\D)/) { $~[:char] * $~[:size].to_i }
  end
end