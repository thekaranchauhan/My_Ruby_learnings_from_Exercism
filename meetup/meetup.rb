require 'date'

class Meetup
  START_DAY = { first: 1, second: 8, third: 15, fourth: 22, teenth: 13, last: -7 }

  def initialize(month, year)
    @month, @year = month, year
  end

  def day(weekday, schedule)
    date = Date.new(@year, @month, START_DAY[schedule])
    (date..(date + 6)).detect { |day| day.public_send("#{weekday}?") }
  end
end