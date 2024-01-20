class ComplexNumber
  PRECISION = 15
  attr_reader :real, :imaginary

  def initialize(real = 0.0, imaginary = 0.0)
    @real, @imaginary = real.to_f, imaginary.to_f
  end

  def +(number2) = ComplexNumber.new(@real + number2.real, @imaginary + number2.imaginary)
  def -(number2) = ComplexNumber.new(@real - number2.real, @imaginary - number2.imaginary)
  def *(number2) = ComplexNumber.new(@real * number2.real - @imaginary * number2.imaginary, @imaginary * number2.real + @real * number2.imaginary)
  def /(number2)
    denom = number2.real**2 + number2.imaginary**2
    ComplexNumber.new((@real * number2.real + @imaginary * number2.imaginary) / denom, (@imaginary * number2.real - @real * number2.imaginary) / denom)
  end

  def ==(number2) = @real.round(PRECISION).eql?(number2.real.round(PRECISION)) && @imaginary.round(PRECISION).eql?(number2.imaginary.round(PRECISION))
  def abs = Math.hypot(@real, @imaginary)
  def conjugate = ComplexNumber.new(@real, -@imaginary)
  def exp = ComplexNumber.new(Math::E ** @real) * ComplexNumber.new(Math.cos(@imaginary), Math.sin(@imaginary))
end