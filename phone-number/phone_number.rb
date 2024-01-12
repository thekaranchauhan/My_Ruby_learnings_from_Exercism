class PhoneNumber
    def self.clean(number)
        number.match(/^[^\d]*1?[^\d]*([2-9]\d{2})[^\d]*([2-9]\d{2})[^\d]*(\d{4})[^\d]*$/)&.captures&.to_a&.join
    end
end