class WordProblem
  def initialize(string)
    subs = [["plus", "+"], ["minus", "-"], ["multiplied by", "*"], ["divided by", "/"]]
    subs.each { |s| string.gsub!(s[0], s[1]) }
    @arr = string.delete("?").split(" ")[2..-1]
  end

  def answer
    raise ArgumentError if (@arr.length < 3) || (@arr.length > 5)
    sum = @arr[0].to_i.send(@arr[1], @arr[2].to_i)
    @arr.length == 3 ? sum : sum.send(@arr[3], @arr[4].to_i)
  end
end