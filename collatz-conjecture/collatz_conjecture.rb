class CollatzConjecture
  def self.steps(num)
    raise ArgumentError if num <= 0

    steps = 0

    while num != 1
      num = num.even? ? num / 2 : 3 * num + 1
      steps += 1
    end

    steps
  end
end