# frozen_string_literal: true

# Hamming class
class Hamming
  def self.compute(str1, str2)
    # Ensure strings are of equal length
    raise ArgumentError, 'Strings must be of equal length' unless str1.length == str2.length

    # Compare characters at each position
    str1.chars.zip(str2.chars).count { |a, b| a != b }
  end
end
