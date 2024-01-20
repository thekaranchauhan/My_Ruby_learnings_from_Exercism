module BookKeeping
  VERSION = 1
end

class OcrNumbers
NUMBERS = [" _ \n| |\n|_|\n   ","   \n  |\n  |\n   "," _ \n _|\n|_ \n   "," _ \n _|\n _|\n   ","   \n|_|\n  |\n   "," _ \n|_ \n _|\n   "," _ \n|_ \n|_|\n   "," _ \n  |\n  |\n   "," _ \n|_|\n|_|\n   "," _ \n|_|\n _|\n   "]
  def self.convert(string)
    raise ArgumentError if string.lines.length % 4 != 0 || ((string.lines[0]).length-1) % 3 != 0
    (0..string.lines.length/4-1).map {|i| string.lines[i*4..i*4+3].join("")}.map{|string|(0..(string.lines[0].length-1)/3 -1).map {|i| string.lines.map{|line| line[i*3..i*3+2]}.join("\n")}.inject(""){|sum,digit| NUMBERS.index(digit) ? sum+NUMBERS.index(digit).to_s : sum+"?"}}.join(",")
  end
end