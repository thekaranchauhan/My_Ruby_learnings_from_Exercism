module BeerSong
  def self.recite(start, takedown)
    (0...takedown).map{|i| "#{start - i == 0 ? "No more" : start - i} bottle#{start - i == 1 ? "" : "s"} of beer on the wall, #{start - i == 0 ? "no more" : start - i} bottle#{start - i == 1 ? "" : "s"} of beer.\n" + ((start - i).zero? ? "Go to the store and buy some more, 99 bottles of beer on the wall." : "Take #{start - i == 1 ? "it" : "one"} down and pass it around, #{(start - i - 1).zero? ? "no more" : start - i - 1} bottle#{start - i - 1 == 1 ? "" : "s" } of beer on the wall.") + "\n"}.join("\n")
  end
end