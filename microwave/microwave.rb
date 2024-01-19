class Microwave
  attr_reader :timer

  def initialize(t)
    @timer = '%02d:%02d' % (t % 100 + t / 100 * 60).divmod(60)
  end
end