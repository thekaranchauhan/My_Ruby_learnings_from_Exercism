class Sieve
  def initialize(limit)
    @primes = (2..limit).reject { |num| (2..Math.sqrt(num)).any? { |div| (num % div).zero? } }
  end

  attr_reader :primes
end