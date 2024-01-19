class BookStore
  BASE = 8.00
  DISCOUNTED = [1, 1, 0.95, 0.9, 0.8, 0.75]

  def self.calculate_price(basket)
    sets = []
    while basket.length > 0
      unique_books = basket.uniq
      sets << unique_books.length
      unique_books.each { |book| basket.delete_at(basket.index(book)) }
    end

    while sets.include?(3) && sets.include?(5)
      sets[sets.index(3)] = 4
      sets[sets.index(5)] = 4
    end

    sets.map { |set| set * BASE * DISCOUNTED[set] }.reduce(&:+).to_f
  end
end