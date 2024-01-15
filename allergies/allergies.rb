class Allergies
  ITEMS = %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

  attr_reader :list
  
  def initialize(score)
    @list = ITEMS.select.with_index { |_, index| score & (1 << index) != 0 }
  end

  def allergic_to?(allergy)
    list.include?(allergy)
  end
end