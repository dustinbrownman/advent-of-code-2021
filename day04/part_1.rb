input = File.readlines("input.txt", chomp: true)

numbers = input.first.split(",").map(&:to_i)
boards = []
current_board = nil

input[1..-1].each do |line|
  if current_board.nil?
    current_board = []
    next
  end

  if line.empty?
    boards << current_board
    current_board = nil
    next
  end

  current_board << line.split(" ").map(&:to_i)
end

boards.each do |board|
  puts board
  puts "---"
end
