require_relative "./bingo_board.rb"

input = File.readlines("input.txt", chomp: true)

numbers = input.first.split(",").map(&:to_i)
boards = []
current_board = nil

input[1..-1].each do |line|
  if current_board.nil?
    current_board = BingoBoard.new
    next
  end

  if line.empty?
    boards << current_board
    current_board = BingoBoard.new
    next
  end

  current_board << line.split(" ").map(&:to_i)
end

numbers.each do |number|
  boards.each do |board|
    board.mark(number)
  end

  if boards.length > 1
    boards = boards.reject { |board| board.bingo? }
    next
  end

  next unless boards.first.bingo?

  puts "We have the last winner!"
  puts boards.first
  puts "won with #{number}"

  puts "Solution: #{number * boards.first.remaining_sum}"
  break
end
