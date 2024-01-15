require 'ostruct'

class Palindromes
  attr_reader :range, :smallest, :largest

  def initialize(max_factor: 9, min_factor: 1)
    @range = min_factor..max_factor
  end

  def generate
    @smallest, @largest = range.to_a.repeated_combination(2)
      .select { |a, b| (a * b).to_s == (a * b).to_s.reverse }
      .group_by { |a, b| a * b }
      .minmax
      .map { |value, factors| OpenStruct.new(value: value, factors: factors) }
  end
end