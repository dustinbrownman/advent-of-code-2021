class Submarine
  attr_reader :depth, :position
  VALID_COMMANDS = %w(forward down up).freeze

  def initialize(depth: 0, position: 0, aim: 0)
    @depth = depth
    @position = position
    @aim = aim
  end

  def move(instruction)

  end

  def move(instruction)
    command, units = instruction.split(' ')

    return unless VALID_COMMANDS.include?(command)

    send(command, units.to_i)
  end

  def forward(distance)
    @position += distance
    @depth += @aim * distance
  end

  def down(units)
    @aim += units
  end

  def up(units)
    @aim -= units
  end
end

sub = Submarine.new

File.foreach("input.txt") do |line|
  sub.move(line)
end

puts "Solution: #{sub.depth * sub.position}"
