class BaseConverter
  def self.convert(ib, d, ob)
    throw ArgumentError unless ib > 1 && ob > 1 && d.reject {|e| (0...ib).include? e}.empty?
    n = d.reduce(0) {|m, e| m * ib + e}
    o = [n % ob]
    o.unshift n % ob while (n /= ob) > 0
    o
  end
end