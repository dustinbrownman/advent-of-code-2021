require_relative "./line"

def test_horizontal_line_points
  start = Coordinate.new(0, 0)
  finish = Coordinate.new(4, 0)

  line = Line.new(start, finish)

  [
    line.points.include?([0, 0]),
    line.points.include?([1, 0]),
    line.points.include?([2, 0]),
    line.points.include?([3, 0]),
    line.points.include?([4, 0]),
  ].all?
end

def test_vertical_line_points
  start = Coordinate.new(0, 0)
  finish = Coordinate.new(0, 4)

  line = Line.new(start, finish)

  [
    line.points.include?([0, 0]),
    line.points.include?([0, 1]),
    line.points.include?([0, 2]),
    line.points.include?([0, 3]),
    line.points.include?([0, 4]),
  ].all?
end

def test_descending_vertical_line_points
  start = Coordinate.new(0, 4)
  finish = Coordinate.new(0, 0)

  line = Line.new(start, finish)

  [
    line.points.include?([0, 0]),
    line.points.include?([0, 1]),
    line.points.include?([0, 2]),
    line.points.include?([0, 3]),
    line.points.include?([0, 4]),
  ].all?
end

def test_diagonal_line_points
  start = Coordinate.new(0, 0)
  finish = Coordinate.new(4, 4)

  line = Line.new(start, finish)

  [
    line.points.include?([0, 0]),
    line.points.include?([1, 1]),
    line.points.include?([2, 2]),
    line.points.include?([3, 3]),
    line.points.include?([4, 4]),
  ].all?
end

def test_descending_diagonal_line_points
  start = Coordinate.new(4, 4)
  finish = Coordinate.new(0, 0)

  line = Line.new(start, finish)

  [
    line.points.include?([0, 0]),
    line.points.include?([1, 1]),
    line.points.include?([2, 2]),
    line.points.include?([3, 3]),
    line.points.include?([4, 4]),
  ].all?
end

def test_inverted_diagnal_line
  start = Coordinate.new(0, 4)
  finish = Coordinate.new(4, 0)

  line = Line.new(start, finish)

  [
    line.points.include?([0, 4]),
    line.points.include?([1, 3]),
    line.points.include?([2, 2]),
    line.points.include?([3, 1]),
    line.points.include?([4, 0]),
  ].all?
end

def test_diagnal_lines_exclude_other_points
  start = Coordinate.new(4, 4)
  finish = Coordinate.new(0, 0)

  line = Line.new(start, finish)

  !line.points.include?([0, 1])
end

def test_horizontal_method
  start = Coordinate.new(0, 0)
  finish = Coordinate.new(4, 0)

  line = Line.new(start, finish)

  line.horizontal?
end

def test_vertical_method
  start = Coordinate.new(0, 4)
  finish = Coordinate.new(0, 0)

  line = Line.new(start, finish)

  line.vertical?
end

test_methods = [
  :test_horizontal_line_points,
  :test_vertical_line_points,
  :test_descending_vertical_line_points,
  :test_diagonal_line_points,
  :test_descending_diagonal_line_points,
  :test_inverted_diagnal_line,
  :test_diagnal_lines_exclude_other_points,
  :test_horizontal_method,
  :test_vertical_method,
]

test_methods.each do |method|
  puts "Running #{method}..."
  puts send(method) ? "PASS" : "FAIL"
end
