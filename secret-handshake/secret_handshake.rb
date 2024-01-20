class SecretHandshake
  attr_reader :commands

  def initialize(i)
    @commands = i.is_a?(Integer) ? (0..3).map { |c| 2**c }.zip(['wink', 'double blink', 'close your eyes', 'jump']).select { |k, v| k & i == k }.sort_by { |k, v| 16 & i == 16 ? -k : k }.map { |k, v| v } : []
  end
end