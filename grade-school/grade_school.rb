class School
  private

  def initialize
    @students = Hash.new { |grades, grade| grades[grade] = [] }
  end

  public

  attr_reader :students

  def add(student, grade)
    return false if roster.include?(student)

    students[grade] << student
    !!students[grade].sort!
  end

  def roster
    sorted_roster.values.flatten
  end

  def sorted_roster
    students.sort.to_h.transform_values(&:sort)
  end

  def grade(level)
    sorted_roster[level] || []
  end
end