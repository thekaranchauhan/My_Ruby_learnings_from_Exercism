# rubocop:disable all

class CircularBuffer < Array
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
  end

  def write(value)
    raise BufferFullException if count == @size

    push value
  end

  def read
    raise BufferEmptyException if count.zero?

    shift
  end

  def write!(value)
    read if count == @size
    write value
  end
end