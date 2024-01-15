class Robot
  DIRECTIONS = %i[north east south west].each_with_index.to_h.freeze
  attr_reader :coordinates
  
  def at(x, y) = @coordinates = [x, y]
  def orient(direction) = @bearing = DIRECTIONS[direction] || raise(ArgumentError)
  def bearing = DIRECTIONS.keys[@bearing]
    
  def turn_right = @bearing = (@bearing + 1) % 4
  def turn_left = @bearing = (@bearing - 1) % 4
  def advance = @coordinates[1 - @bearing % 2] += [1, -1][@bearing / 2]
end

class Simulator
  INSTRUCTIONS = {'A' => :advance, 'L' => :turn_left, 'R' => :turn_right}
  
  def instructions(input) = input.chars.map(&INSTRUCTIONS)

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, input)
    instructions(input).each { |i| robot.instance_eval { send(i) } }
  end
end