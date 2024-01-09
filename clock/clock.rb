class Clock
  attr_reader :total_minutes
  def initialize(hour: 0, minute: 0) =  
    @total_minutes = (hour * 60 + minute) % (24 * 60)
 
  def to_s = "%02d:%02d" % @total_minutes.divmod(60)
  def +(other) = Clock.new(minute: @total_minutes + other.total_minutes)
  def -(other) =  Clock.new(minute: @total_minutes - other.total_minutes)
  def ==(other) = @total_minutes == other.total_minutes

end
