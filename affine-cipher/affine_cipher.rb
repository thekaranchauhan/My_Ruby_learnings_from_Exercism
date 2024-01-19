class Affine
  MMI = [0,1,0,9,0,21,0,15,0,3,0,19,0,0,0,7,0,23,0,11,0,5,0,17,0,25]

  def initialize(a, b)
    raise ArgumentError if MMI[a] == 0
    @a = a
    @b = b
  end

  def enc(char) = ('a'..'z').include?(char) ? ((@a * (char.ord - 'a'.ord) + @b) % 26 + 'a'.ord).chr : char

  def dec(char) = ('a'..'z').include?(char) ? ((MMI[@a] * ((char.ord - 'a'.ord) - @b)) % 26 + 'a'.ord).chr : char

  def encode(string) = string.downcase.delete(" \t\r\n,.").split("").map { |char| enc(char) }.join.scan(/.{1,5}/).join(' ')

  def decode(string) = string.delete(" \t\r\n").split("").map { |char| dec(char) }.join
end