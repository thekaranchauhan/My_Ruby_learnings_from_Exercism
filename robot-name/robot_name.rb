class Robot
  ALL_NAMES = ("AA000".."ZZ999").to_a.shuffle!.cycle

  class << self
    def forget; end
  end

  attr_reader :name

  def named? = @name

  def initialize
    @name = ALL_NAMES.next
  end

  def reset
    @name = nil
  end
end
