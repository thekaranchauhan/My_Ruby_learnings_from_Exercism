module Blackjack
  def self.parse_card(card)
    PARSES.index(card) || 10
  end

  def self.card_range(card1, card2)
    value = parse_card(card1) + parse_card(card2)
    case value
    when (4..11) then 'low'
    when (12..16) then 'mid'
    when (17..20) then 'high'
    when 21 then 'blackjack'
    end
  end
  
  def self.first_turn(card1, card2, dealer_card)
    case 
    when card1 == card2 && card1 == 'ace' && card2 == 'ace'
      "P"
    when card1 != card2 && card1 != dealer_card && card1 == 'ace'
      "W"
    when parse_card(card1) + parse_card(card2) <= 16 && parse_card(dealer_card) > 6 || parse_card(dealer_card) == 5 || parse_card(dealer_card) == 2
      "H"
    when parse_card(card1) + parse_card(card2) >= 16 || parse_card(dealer_card) <= 6
      "S"
    end
  end

  private 

    PARSES = ['joker', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'ace'].freeze
end