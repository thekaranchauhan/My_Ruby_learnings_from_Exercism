class Garden
  PLANTS = {'G' => :grass, 'C' => :clover, 'R' => :radishes, 'V' => :violets}
  DEFAULT = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]
  
  def initialize(diagram, students = DEFAULT)
    diag_list = diagram.split("\n").map { |line| line.scan(/(..)/) }
    plots = diag_list[0].zip(diag_list[1]).map { |x| x.join.chars.map { |c| PLANTS[c] } }
    students.sort.map(&:downcase).zip(plots).each { |x| instance_eval "def %s ; %s ; end" % x }
  end
end