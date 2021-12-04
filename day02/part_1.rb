class Submarine
  attr_reader :depth, :distance
  def initialize(depth: 0, distance: 0)
    @depth = depth
    @distance = distance
  end

  def move(command)
    case command
    in ["forward", distance]
      @distance += distance.to_i
    in ["down", distance]
      @depth += distance.to_i
    in ["up", distance]
      @depth -= distance.to_i
    end
  end
end

sub = Submarine.new

File.foreach("input.txt") do |line|
  command = line.split(" ")
  sub.move(command)
end

puts "Solution: #{sub.depth * sub.distance}"
