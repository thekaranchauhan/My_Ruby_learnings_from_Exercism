module Gigasecond
  ONE_BILLION = 1_000_000_000
  def self.from(time)
    time + ONE_BILLION
  end
end
