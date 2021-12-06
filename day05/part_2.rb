require_relative "./line"

input = File.readlines("input.txt")

lines = input.map do |line_definition|
  line = Line.new
  start_str, finish_str = line_definition.split(" -> ")

  start_x, start_y = start_str.split(",").map(&:to_i)
  finish_x, finish_y = finish_str.split(",").map(&:to_i)

  line.start = Coordinate.new(start_x, start_y)
  line.finish = Coordinate.new(finish_x, finish_y)

  line
end

grid = Hash.new(0)

lines.each do |line|
  line.points.each do |point|
    grid[point] += 1
  end
end

number_of_multiple_intersections = grid.values.select { |intersections| intersections > 1 }.count

puts "Solution: #{number_of_multiple_intersections}"
