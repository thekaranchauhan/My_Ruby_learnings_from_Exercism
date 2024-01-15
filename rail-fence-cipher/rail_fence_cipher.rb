class RailFenceCipher
    def self.encode(message, rails)
        validateMessage(message, rails)
        get_zigzag_pattern(message, rails)
            .zip(message.chars)
            .sort
            .map { |n| n.last }
            .join    
    end

    def self.decode(message, rails)
        validateMessage(message, rails)
        get_zigzag_pattern(message, rails)
            .sort
            .zip(message.chars)
            .sort_by { |n| n.first.last }
            .map { |n| n.last }
            .join
    end

    private
  
    def self.validateMessage(message, rails)
        return message if message.empty? || rails == 1
    end

    def self.get_zigzag_pattern(message, rails)
        pattern = (0...rails).to_a + (1...rails-1).to_a.reverse
        pattern
            .cycle
            .first(message.length)
            .zip(0...message.length)
    end
end