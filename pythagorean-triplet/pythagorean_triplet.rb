class PythagoreanTriplet
  def self.triplets_with_sum(sum)
    (1..sum/3).each_with_object([]) do |a, triplets_set|
      b = (sum * (sum - 2 * a)) / (2 * (sum - a))
      c = sum - a - b

      next if b < a || c < b

      triplet = [a, b, c].sort

      triplets_set << triplet if (a**2 + b**2 == c**2) && !triplets_set.include?(triplet)
    end
  end
end