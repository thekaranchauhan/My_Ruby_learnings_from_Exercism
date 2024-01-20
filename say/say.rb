class Say
  def initialize(number)
    @number = number
  end

  def in_english(number = @number)
    if number < 0 || number >= 10 ** 12
      raise ArgumentError, 'invalid number'
    elsif number < 20
      %w(zero one two three four five six seven eight nine
        ten eleven twelve thirteen fourteen fifteen sixteen
        seventeen eighteen nineteen)[number]
    elsif number < 100
      %w(twenty thirty forty fifty sixty seventy eighty
        ninety)[number / 10 - 2] +
        (number % 10 > 0 ? '-' + in_english(number % 10) : '')
    else
      quantity, name = { 10 ** 9 => 'billion', 10 ** 6 => 'million',
        10 ** 3 => 'thousand', 10 ** 2 => 'hundred' }
        .find {|quantity, _| number / quantity > 0 }
      in_english(number / quantity) + ' ' + name +
        (number % quantity > 0 ? ' ' + in_english(number % quantity) : '')
    end
  end
end