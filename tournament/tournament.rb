# frozen_string_literal: true

class Tournament
  attr_accessor :teams

  def initialize
    @teams = Hash.new { |hash, key| hash[key] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }
  end

  def self.tally(input)
    return header_line if input.nil? || input.strip.empty?

    tournament = Tournament.new
    input.each_line { |line| tournament.parsed_result(line.chomp) }
    tournament.generate_table
  end

  def parsed_result(result)
    team1, team2, outcome = result.split(';')
    update_stats(team1, team2, outcome)
  end

  def update_stats(team1, team2, outcome)
    teams[team1][:mp] += 1
    teams[team2][:mp] += 1
    teams[team1][outcome == 'win' ? :w : (outcome == 'draw' ? :d : :l)] += 1
    teams[team2][outcome == 'win' ? :l : (outcome == 'draw' ? :d : :w)] += 1

    update_points(team1)
    update_points(team2)
  end

  def update_points(team)
    teams[team][:p] = teams[team][:w] * 3 + teams[team][:d]
  end

  def sort_teams
    teams.sort_by { |team, stats| [-stats[:p], team] }
  end

  def generate_table
    "#{self.class.header_line}#{generate_rows.join("\n")}\n"
  end

  def self.header_line
    "Team                           | MP |  W |  D |  L |  P\n"
  end

  def generate_rows
    sort_teams.map { |team, stats| "#{team.ljust(30)} | #{stats.values_at(:mp, :w, :d, :l, :p).map { |stat| stat.to_s.rjust(2) }.join(' | ')}" }
  end
end
