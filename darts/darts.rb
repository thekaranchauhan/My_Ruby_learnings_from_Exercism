class Darts
  attr_reader :score
  
  def initialize(x, y)
    dist = Math.sqrt(x**2 + y**2)
    @score = case
             when dist <= 1 then 10
             when dist <= 5 then 5
             when dist <= 10 then 1
             else 0
             end
  end
end