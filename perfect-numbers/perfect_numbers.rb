class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 1
    sum = (1..(num / 2)).select { (num % _1).zero? }.sum
    sum == num ? 'perfect' : sum > num ? 'abundant' : 'deficient'
  end
end