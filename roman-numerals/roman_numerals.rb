class Integer
  def to_roman
    digits.each_with_index.map { |e, i| ('IXCM'[i] * e.to_i) }.reverse.join
      .gsub(/IIIIIIIII/, 'IX')
      .gsub(/IIIII/, 'V')
      .gsub(/IIII/, 'IV')
      .gsub(/XXXXXXXXX/, 'XC')
      .gsub(/XXXXX/, 'L')
      .gsub(/XXXX/, 'XL')
      .gsub(/CCCCCCCCC/, 'CM')
      .gsub(/CCCCC/, 'D')
      .gsub(/CCCC/, 'CD')
  end
end