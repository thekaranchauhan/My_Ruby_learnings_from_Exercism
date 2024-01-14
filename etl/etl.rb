module ETL
  def self.transform(old)
    old.each_with_object({}) do |(value, letters), new|
      letters.each { |letter| new[letter.downcase] = value }
    end
  end
end