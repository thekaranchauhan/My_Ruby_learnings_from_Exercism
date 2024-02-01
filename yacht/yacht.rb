class Yacht
  def initialize(dice, category)
    @dice = dice
    @category = category
  end

  def score
    case category
    when 'ones'
      dice.count(1) * 1
    when 'twos'
      dice.count(2) * 2
    when 'threes'
      dice.count(3) * 3
    when 'fours'
      dice.count(4) * 4
    when 'fives'
      dice.count(5) * 5
    when 'sixes'
      dice.count(6) * 6
    when 'full house'
      dice.uniq.map { |v| dice.count(v) }.sort == [2, 3] ? dice.sum : 0
    when 'four of a kind'
      dice.uniq.select { |v| dice.count(v) >= 4 }.sum * 4
    when 'little straight'
      dice.sort == [1, 2, 3, 4, 5] ? 30 : 0
    when 'big straight'
      dice.sort == [2, 3, 4, 5, 6] ? 30 : 0
    when 'choice'
      dice.sum
    when 'yacht'
      dice.uniq.size == 1 ? 50 : 0
    end
  end

  private

  attr_reader :dice, :category
end