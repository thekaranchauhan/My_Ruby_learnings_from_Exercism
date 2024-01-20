class Zipper
  def self.from_tree(tree) = Zipper.new(tree)
  def initialize(tree, path = []) = (@tree, @path = tree, path)

  def to_tree = @tree
  def up = (Zipper.new(@tree, @path[...-1]) if @path.any?)
  def focus(tree = @tree) = @path.inject(tree) { |a, x| a.send(x) }
  def value = focus.value
  def left = focus.left && Zipper.new(@tree, @path + [:left])
  def right = focus.right && Zipper.new(@tree, @path + [:right])
  def set_value(n) = set(:value=, n)
  def set_left(n) = set(:left=, n)
  def set_right(n) = set(:right=, n)
  def ==(o) = focus == o.focus

  private

  def set(sym, n)
    tree = @tree.dup
    focus(tree).send(sym, n)
    Zipper.new(tree, @path)
  end
end

class Node
  attr_accessor *%i(value left right)
  def initialize(v, l, r) = (@value, @left, @right = v, l, r)
  def ==(o) = @value == o.value && @left == o.left && @right == o.right
end