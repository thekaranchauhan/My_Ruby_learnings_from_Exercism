class Element
  attr_accessor :datum, :next

  def initialize(n)
    @datum = n
  end
end

class SimpleLinkedList < Array
  def initialize(arr = [])
    super(arr.map { |item| Element.new(item) })
  end

  def to_a
    map { |item| item.datum || item }.reverse
  end
end