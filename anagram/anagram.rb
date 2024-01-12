class Anagram < String
  def match(words)
    words.select { |word| word.downcase != downcase && word.downcase.chars.sort == downcase.chars.sort }
  end
end