module Change
  ImpossibleCombinationError = NegativeTargetError = Class.new(RuntimeError)

  def self.generate(enumerable, target)
    raise NegativeTargetError if target < 0
    return [] if target.zero?

    (1..target).lazy.flat_map do |combination_length|
      enumerable.repeated_combination(combination_length).select { |combination| combination.sum == target }
    end.first || (raise ImpossibleCombinationError)
  end
end