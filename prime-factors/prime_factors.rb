require 'prime'

module PrimeFactors
  def self.of(number)
    Prime.prime_division(number).flat_map { |p, e| [p] * e }
  end
end