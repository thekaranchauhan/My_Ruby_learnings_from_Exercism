class Game
  attr_reader :frames, :current_frame

  class BowlingError < StandardError; end

  def initialize
    @frames = Array.new(12) { [] }
    @current_frame = 0
  end

  def roll(pins)
    raise BowlingError if invalid_roll?(pins)

    frames[current_frame].push(pins)
    @current_frame += 1 if frame_completed?(pins)
  end

  def score
    raise BowlingError unless game_finished?

    frames.flatten.sum + bonuses.sum
  end

  def game_finished?
    final_rolls = frames.slice(9, 3).flatten.length
    final_rolls != 2 ? (final_rolls == 3) : (frames[9].sum < 10)
  end

  def bonuses
    frames.slice(0, 9).map.with_index do |frame, index|
      bonuses = frame[0] / 10 + frame.sum / 10
      frames.slice(index + 1, 2).flatten.slice(0, bonuses).sum
    end
  end

  private

  def invalid_roll?(pins)
    pins.negative? || (frames[current_frame].sum + pins > 10) || game_finished?
  end

  def frame_completed?(pins)
    frames[current_frame].length == 2 || pins == 10
  end
end