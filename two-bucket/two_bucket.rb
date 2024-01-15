class Bucket < Struct.new(:name, :size, :content)
end

class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size1, size2, target, fill_first)
    a = Bucket.new('one', size1, 0)
    b = Bucket.new('two', size2, 0)
    a, b = b, a if fill_first == 'two'

    0.step do |i|
      if a.content == target || b.content == target
        a, b = b, a if b.content == target
        @goal_bucket = a.name
        @other_bucket = b.content
        @moves = i
        return
      elsif a.content == 0
        a.content = a.size
      elsif b.size == target
        b.content = b.size
      elsif b.content == b.size
        b.content = 0
      else
        pour = [a.content, b.size - b.content].min
        a.content -= pour
        b.content += pour
      end
    end
  end
end