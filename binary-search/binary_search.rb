class BinarySearch
  def initialize(arr)
    @arr = arr.sort
  end

  def search_for(n)
    @arr.bsearch_index { |x| n <=> x }
  end
end