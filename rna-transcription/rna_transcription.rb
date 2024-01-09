module Complement
  COMPLEMENTS = { "C" => "G", "G" => "C", "T" => "A", "A" => "U" }.freeze
  def self.of_dna(dna)
    dna.empty? ? "" : COMPLEMENTS[dna[0]] + of_dna(dna[1..])
  end
end
