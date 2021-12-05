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

boards.each do |board|
  puts board
  puts "---"
end

numbers.each do |number|
  boards.each do |board|
    board.mark(number)
  end

  winner = boards.find { |board| board.bingo? }

  if winner
    puts "We have a winner!"
    puts winner
    puts "won with #{number}"
    break
  end
end
