class Queens
  def initialize(white: [0, 0], black: [0, 0])
    validate_positions(white, black)
    @white = white
    @black = black
  end

  def attack?
    @white[0] == @black[0] || @white[1] == @black[1] || (@white[0] - @black[0]).abs == (@white[1] - @black[1]).abs
  end

  private

  def validate_positions(white, black)
    raise ArgumentError unless valid_position?(white) && valid_position?(black)
  end

  def valid_position?(position)
    position.all? { |coord| coord.between?(0, 7) }
  end
end