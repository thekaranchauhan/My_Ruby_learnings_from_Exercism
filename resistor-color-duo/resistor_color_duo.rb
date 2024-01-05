module ResistorColorDuo
  COL =  %w(black brown red orange yellow green blue violet grey white)
  def self.value(arr) = arr.take(2).map { |x| COL.index(x) }.join.to_i end
