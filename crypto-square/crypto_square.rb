class Crypto
  attr_reader :text

  def initialize(text)
    @text = text.gsub(/\W/, '').downcase
  end

  def ciphertext
    c = (1..10).find { |b| b**2 >= text.length || b * (b - 1) >= text.length }
    text.chars.each_slice(c).map { |s| s + ([' '] * (c - s.length)) }.transpose.map(&:join).join(' ')
  end
end