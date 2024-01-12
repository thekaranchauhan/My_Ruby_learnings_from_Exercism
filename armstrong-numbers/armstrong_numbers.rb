class ArmstrongNumbers 
  def self.include?(number)
    number == number.digits.sum { |d| d ** number.digits.size }
  end
end