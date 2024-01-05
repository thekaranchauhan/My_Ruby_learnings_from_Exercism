

class SimpleCalculator
   class UnsupportedOperation < StandardError; end
  def self.calculate(num1, num2, oprand) 
    raise ArgumentError unless num1.is_a?(Integer) && num2.is_a?(Integer)
    raise UnsupportedOperation unless %w(+ / *).include? oprand
    "#{num1} #{oprand} #{num2} = #{num1.public_send(oprand, num2)}"
    rescue ZeroDivisionError then 'Division by zero is not allowed.' end
 end