require 'date'

class Year
  def self.leap?(year)       
     DateTime.leap? year
  end
end