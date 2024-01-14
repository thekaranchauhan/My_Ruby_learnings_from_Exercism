class ResistorColorTrio
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    @value = (10 * COLORS.index(colors[0]) + COLORS.index(colors[1])) * 10**COLORS.index(colors[2])
  end

  def label
    "Resistor value: #{@value < 1000 ? "#{@value} ohms" : "#{@value / 1000} kiloohms"}"
  end
end