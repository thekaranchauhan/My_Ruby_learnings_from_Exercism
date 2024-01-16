class Deque
  attr_reader :elements
  
  def initialize
    @elements = []
  end

  def push(value)
    elements.push(value)
  end

  def pop
    elements.pop
  end

  def unshift(value)
    elements.unshift(value)
  end

  def shift
    elements.shift
  end
end