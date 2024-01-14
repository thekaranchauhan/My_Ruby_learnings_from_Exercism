class Nucleotide
  DEFAULT_HISTOGRAM = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }.freeze

  def self.from_dna(sequence)
    raise ArgumentError unless sequence =~ /\A[ACGT]*\z/
    new(sequence)
  end

  def initialize(sequence)
    @sequence = sequence.split(//)
  end

  def count(nucleotide)
    @sequence.count(nucleotide)
  end

  def histogram
    DEFAULT_HISTOGRAM.merge(@sequence.tally) { |_, default, actual| actual || default }
  end
end